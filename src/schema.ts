// src/schema.ts

import { builder } from "./builder"

import "./models/Message"
import "./models/User"
import "./models/Television"
import "./models/TelevisionPicture"

export const schema = builder.toSchema({})
