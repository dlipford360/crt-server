// 1
import { createServer } from "@graphql-yoga/node"
import { schema } from "./schema"
// 2
const port = Number(process.env.API_PORT) || 4000
// 3
const server = createServer({
  port,
  schema,
})
// 4
server.start().then(() => {
  console.log(`🚀 GraphQL Server ready at http://localhost:${port}/graphql`)
})
