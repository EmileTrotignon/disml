open Core

type partial_user =
  { id: User_id_t.t
  ; username: string option [@default None]
  ; discriminator: string option [@default None]
  ; avatar: string option [@default None]
  ; bot: bool [@default false] }
[@@deriving sexp, yojson {strict= false; exn= true}]

type t =
  { id: User_id_t.t
  ; username: string
  ; discriminator: string
  ; avatar: string option [@default None]
  ; bot: bool [@default false] }
[@@deriving sexp, yojson {strict= false; exn= true}]

let hash (`User_id t) = Snowflake.hash t

let compare (`User_id t) (`User_id t') = Snowflake.compare t t'

let id {id; _} = id

let username {username; _} = username

let discriminator {discriminator; _} = discriminator

let avatar {avatar; _} = avatar

let bot {bot; _} = bot

let hash user = hash user.id

let compare user user' = compare user.id user'.id
