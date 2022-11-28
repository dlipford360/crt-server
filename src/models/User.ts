// src/models/User.ts

import { builder } from "../builder"
import { prisma } from "../db"
import * as bcrypt from "bcryptjs"
import * as jwt from "jsonwebtoken"

builder.prismaObject("User", {
  fields: (t) => ({
    id: t.exposeID("id"),
    name: t.exposeString("name", { nullable: true }),
    email: t.exposeString("email"),
    messages: t.relation("messages"),
  }),
})

builder.queryField("users", (t) =>
  t.prismaField({
    type: ["User"],
    resolve: async (query, root, args, ctx, info) => {
      return prisma.user.findMany({ ...query })
    },
  })
)
builder.mutationField("register", (t) =>
  t.prismaField({
    type: "User",
    args: {
      email: t.arg.string({ required: true }),
      password: t.arg.string({ required: true }),
    },
    resolve: async (query, root, { email, password }, ctx, info) => {
      const parsed_email = email.trim().toLowerCase()
      const hashed = await bcrypt.hash(password, 10)

      const user = await prisma.user.create({
        data: {
          email: parsed_email!,
          password: hashed,
        },
        select: {
          id: true,
        },
      })
      const token = jwt.sign(
        { user: { email: parsed_email, id: user!.id } },
        process.env.JWT_SECRET!
      )

      return await prisma.user.update({
        data: { session_token: token },
        where: { id: user!.id },
      })
    },
  })
)
