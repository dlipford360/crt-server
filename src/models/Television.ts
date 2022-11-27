import { builder } from "../builder"
import { prisma } from "../db"

builder.prismaObject("Television", {
  fields: (t) => ({
    id: t.exposeID("id"),
    brand: t.exposeString("brand", { nullable: true }),
    modelNumber: t.exposeString("modelNumber", { nullable: true }),
    svideo: t.exposeInt("svideo", { nullable: true }),
    composite: t.exposeInt("composite", { nullable: true }),
    component: t.exposeInt("component", { nullable: true }),
    curved: t.exposeBoolean("curved", { nullable: true }),
    widescreen: t.exposeBoolean("widescreen", { nullable: true }),
    coaxial: t.exposeInt("coaxial", { nullable: true }),
    ntsc: t.exposeBoolean("ntsc", { nullable: true }),
    pal: t.exposeBoolean("pal", { nullable: true }),
    highDefinition: t.exposeBoolean("highDefinition", { nullable: true }),
    users: t.relation("users"),

    updatedAt: t.expose("updatedAt", {
      type: "Date",
    }),
    createdAt: t.expose("createdAt", {
      type: "Date",
    }),
  }),
})

//creates graphql query endpoint
builder.queryField("televisions", (t) =>
  t.prismaField({
    type: ["Television"],
    args: {
      composite: t.arg.int({ required: false }),
    },
    resolve: async (query, root, args, ctx, info) => {
      return prisma.television.findMany({ where: {} })
    },
  })
)
