// src/schema.ts

import { builder } from "./builder"

import "./models/Message"
import "./models/User"
import "./models/CathodeRayTube"

export const schema = builder.toSchema({})
