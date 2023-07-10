import * as dotenv from 'dotenv'
dotenv.config({ path: `${__dirname}/../../.env` })
import { Context, Telegraf } from 'telegraf'
const TelegrafBot = require('telegraf')

export const bot = new TelegrafBot(process.env.TOKEN, {
  handlerTimeout: 1,
}) as Telegraf<Context>
