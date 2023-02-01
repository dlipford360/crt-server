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
    diagonalInches: t.exposeInt("diagonalInches", { nullable: true }),
    coaxial: t.exposeInt("coaxial", { nullable: true }),
    tvl: t.exposeInt("tvl", { nullable: true }),
    digitalconverter: t.exposeBoolean("ntsc", { nullable: true }),
    hdmi: t.exposeInt("hdmi", { nullable: true }),
    scart: t.exposeInt("scart", { nullable: true }),
    stereoAudio: t.exposeBoolean("stereoAudio", { nullable: true }),
    yearMade: t.exposeString("yearMade", { nullable: true }),
    dvi: t.exposeInt("dvi", { nullable: true }),
    vga: t.exposeInt("vga", { nullable: true }),
    ntsc: t.exposeBoolean("ntsc", { nullable: true }),
    pal: t.exposeBoolean("pal", { nullable: true }),
    highDefinition: t.exposeBoolean("highDefinition", { nullable: true }),
    vcrPlayback: t.exposeBoolean("vcrPlayback", { nullable: true }),
    dvdPlayback: t.exposeBoolean("dvdPlayback", { nullable: true }),
    description: t.exposeString("description", { nullable: true }),
    televisionPictures: t.relation("pictures"),
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
builder.mutationField("addTelevision", (t) =>
  t.prismaField({
    type: "Television",
    args: {
      brand: t.arg.string({ required: false }),
      modelNumber: t.arg.string({ required: false }),
    },
    resolve: async (query, root, { brand, modelNumber }, ctx, info) => {
      return await prisma.television.create({
        data: { brand: brand, modelNumber: modelNumber },
      })
    },
  })
)
