// prisma/seed.ts

import { PrismaClient } from "@prisma/client"
const prisma = new PrismaClient()

async function main() {
  // Delete all `User` and `Message` records
  await prisma.message.deleteMany({})
  await prisma.user.deleteMany({})
  await prisma.television.deleteMany({})
  // (Re-)Create dummy `User` and `Message` records
  await prisma.user.create({
    data: {
      name: "Jack",
      messages: {
        create: [
          {
            body: "A Note for Jack",
          },
          {
            body: "Another note for Jack",
          },
        ],
      },
    },
  })
  await prisma.user.create({
    data: {
      name: "Ryan",
      messages: {
        create: [
          {
            body: "A Note for Ryan",
          },
          {
            body: "Another note for Ryan",
          },
        ],
      },
    },
  })
  await prisma.user.create({
    data: {
      name: "Adam",
      messages: {
        create: [
          {
            body: "A Note for Adam",
          },
          {
            body: "Another note for Adam",
          },
        ],
      },
    },
  })
  await prisma.television.create({
    data: {
      brand: "Sony",
      modelNumber: "kv-34xbr910",
      coaxial: 1,
      component: 2,
      svideo: 1,
      composite: 2,
      dvi: 1,
      highDefinition: true,
      widescreen: true,
    },
  })
  await prisma.television.create({
    data: {
      brand: "JVC",
      modelNumber: `32" dseries`,
      coaxial: 1,

      component: 1,
      svideo: 1,
      composite: 2,
      dvi: 0,
      hdmi: 0,
      highDefinition: false,
      widescreen: true,
    },
  })
}

main().then(() => {
  console.log("Data seeded...")
})
