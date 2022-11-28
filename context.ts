import { verify } from "jsonwebtoken"
import { Context } from "./ctxtypes"
/**
 * Read only version of Prisma. This is only intended to be used for high impact queries.
 **/

export const createContext = (ctx: any): Context => {
  const { req, res, connection, authorization } = ctx
  const authToken = connection?.context
    ? connection?.context?.authorization
    : (req?.headers && req?.headers?.authorization) || ""
  if (!authToken) {
    return {
      res,
      user: {
        id: undefined,
        email: undefined,
      },
      req,
    }
  }

  try {
    const { user }: any = verify(authToken, process.env.JWT_SECRET!)

    return {
      user,
      req,
      res,
    }
  } catch (error) {}
  return {
    user: {
      id: undefined,
      email: undefined,
    },
    req,
    res,
  }
}
