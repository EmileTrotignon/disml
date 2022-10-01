open Event_models

let ready = ref (fun (_ : Ready.t) -> Lwt.return_unit)

let resumed = ref (fun (_ : Resumed.t) -> Lwt.return_unit)

let channel_create = ref (fun (_ : ChannelCreate.t) -> Lwt.return_unit)

let channel_update = ref (fun (_ : ChannelUpdate.t) -> Lwt.return_unit)

let channel_delete = ref (fun (_ : ChannelDelete.t) -> Lwt.return_unit)

let channel_pins_update = ref (fun (_ : ChannelPinsUpdate.t) -> Lwt.return_unit)

let guild_create = ref (fun (_ : GuildCreate.t) -> Lwt.return_unit)

let guild_update = ref (fun (_ : GuildUpdate.t) -> Lwt.return_unit)

let guild_delete = ref (fun (_ : GuildDelete.t) -> Lwt.return_unit)

let member_ban = ref (fun (_ : GuildBanAdd.t) -> Lwt.return_unit)

let member_unban = ref (fun (_ : GuildBanRemove.t) -> Lwt.return_unit)

let guild_emojis_update = ref (fun (_ : GuildEmojisUpdate.t) -> Lwt.return_unit)

(* let integrations_update = ref (fun (_:Yojson.Safe.t) -> Lwt.return_unit) *)
let member_join = ref (fun (_ : GuildMemberAdd.t) -> Lwt.return_unit)

let member_leave = ref (fun (_ : GuildMemberRemove.t) -> Lwt.return_unit)

let member_update = ref (fun (_ : GuildMemberUpdate.t) -> Lwt.return_unit)

let members_chunk = ref (fun (_ : GuildMembersChunk.t) -> Lwt.return_unit)

let role_create = ref (fun (_ : GuildRoleCreate.t) -> Lwt.return_unit)

let role_update = ref (fun (_ : GuildRoleUpdate.t) -> Lwt.return_unit)

let role_delete = ref (fun (_ : GuildRoleDelete.t) -> Lwt.return_unit)

let message_create = ref (fun (_ : MessageCreate.t) -> Lwt.return_unit)

let message_update = ref (fun (_ : MessageUpdate.t) -> Lwt.return_unit)

let message_delete = ref (fun (_ : MessageDelete.t) -> Lwt.return_unit)

let message_delete_bulk = ref (fun (_ : MessageDeleteBulk.t) -> Lwt.return_unit)

let reaction_add = ref (fun (_ : ReactionAdd.t) -> Lwt.return_unit)

let reaction_remove = ref (fun (_ : ReactionRemove.t) -> Lwt.return_unit)

let reaction_remove_all = ref (fun (_ : ReactionRemoveAll.t) -> Lwt.return_unit)

let presence_update = ref (fun (_ : PresenceUpdate.t) -> Lwt.return_unit)

let typing_start = ref (fun (_ : TypingStart.t) -> Lwt.return_unit)

let user_update = ref (fun (_ : UserUpdate.t) -> Lwt.return_unit)

(* let voice_state_update = ref (fun (_:Yojson.Safe.t) -> Lwt.return_unit) *)
(* let voice_server_update = ref (fun (_:Yojson.Safe.t) -> Lwt.return_unit) *)
let webhook_update = ref (fun (_ : WebhookUpdate.t) -> Lwt.return_unit)

let unknown = ref (fun (_ : Unknown.t) -> Lwt.return_unit)
