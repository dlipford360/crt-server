notes:

- Do not update graphql-yoga/node above 2.13.13, will mess up the CreateServer on index.ts aka require refactoring.

- after adding things to schema.prisma. run `npx prisma generate`
- seed `npx prisma db seed`
- migrate ` npx prisma migrate dev --name televisionnow`
- migrate on prod ` npx prisma migrate dev` after changind db_url on env
- run `npm run dev`
