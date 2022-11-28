interface UserContext {
  id?: number
  email?: string
}

export interface Context {
  req: Request
  res: Response
  user: UserContext
}

export type Resolver = (
  parent: any,
  args: any,
  context: Context,
  info: any
) => any
