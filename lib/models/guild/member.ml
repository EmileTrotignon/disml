open Core
include Member_t

let add_role ~(role : Role_t.t) member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  let (`Role_id role_id) = role.id in
  Http.add_member_role guild_id user_id role_id

let remove_role ~(role : Role_t.t) member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  let (`Role_id role_id) = role.id in
  Http.remove_member_role guild_id user_id role_id

let ban ?(reason = "") ?(days = 0) member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  Http.guild_ban_add guild_id user_id
    (`Assoc [("delete-message-days", `Int days); ("reason", `String reason)])

let kick ?reason member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  let payload =
    match reason with Some r -> `Assoc [("reason", `String r)] | None -> `Null
  in
  Http.remove_member guild_id user_id payload

let change_nick member nickname =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  Http.edit_member guild_id user_id (`Assoc [("nick", `String nickname)])

let mute member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  Http.edit_member guild_id user_id (`Assoc [("mute", `Bool true)])

let deafen member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  Http.edit_member guild_id user_id (`Assoc [("deaf", `Bool true)])

let unmute member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  Http.edit_member guild_id user_id (`Assoc [("mute", `Bool false)])

let undeafen member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  Http.edit_member guild_id user_id (`Assoc [("deaf", `Bool false)])

let hash member =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  Stdlib.Hashtbl.hash (Int.hash user_id, Int.hash guild_id)

let compare (member : t) (member' : t) =
  let (`Guild_id guild_id) = member.guild_id in
  let (`User_id user_id) = member.user.id in
  let (`Guild_id guild_id') = member'.guild_id in
  let (`User_id user_id') = member'.user.id in
  let a = Int.compare user_id user_id' in
  if a = 0 then Int.compare guild_id guild_id' else a

let nick member = member.nick

let roles member = member.roles

let joined_at member = member.joined_at

let is_deaf member = member.deaf

let is_mute member = member.mute

let user member = member.user

let guild_id member = member.guild_id
