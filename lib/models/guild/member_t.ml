open Core

type partial_member =
  { nick: string option [@default None]
  ; roles: Role_id.t list
  ; joined_at: string
  ; deaf: bool
  ; mute: bool }
[@@deriving sexp, yojson {strict= false; exn= true}]

type member =
  { nick: string option [@default None]
  ; roles: Role_id.t list
  ; joined_at: string
  ; deaf: bool
  ; mute: bool
  ; user: User_t.t }
[@@deriving sexp, yojson {strict= false; exn= true}]

type member_wrapper = {guild_id: Guild_id_t.t; user: User_t.t}
[@@deriving sexp, yojson {strict= false; exn= true}]

type member_update =
  { guild_id: Guild_id_t.t
  ; roles: Role_id.t list [@default []]
  ; user: User_t.t
  ; nick: string option [@default None] }
[@@deriving sexp, yojson {strict= false; exn= true}]

type t =
  { nick: string option [@default None]
  ; roles: Role_id.t list
  ; joined_at: string
  ; deaf: bool
  ; mute: bool
  ; user: User_t.t
  ; guild_id: Guild_id_t.t }
[@@deriving sexp, yojson {strict= false; exn= true}]

let wrap ~guild_id ({nick; roles; joined_at; deaf; mute; user} : member) =
  {nick; roles; joined_at; deaf; mute; user; guild_id= `Guild_id guild_id}

let compare (member : t) (member' : t) =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  let (`Guild_id guild_id') = member'.guild_id in
  let (`User_id user_id') = member'.user.id in
  let a = Int.compare user_id user_id' in
  if a = 0 then Int.compare guild_id guild_id' else a

let hash member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  Stdlib.Hashtbl.hash (Int.hash user_id, Int.hash guild_id)
