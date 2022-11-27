import { builder } from "../builder"

builder.prismaObject("TelevisionPicture", {
  fields: (t) => ({
    id: t.exposeID("id"),
    url: t.exposeString("url"),
    television: t.relation("television"),
  }),
})
