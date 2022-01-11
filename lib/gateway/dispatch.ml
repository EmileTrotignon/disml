open Core
open Event_models

let ready = ref (fun (_ : Ready.t) -> ())

let resumed = ref (fun (_ : Resumed.t) -> ())

let channel_create = ref (fun (_ : ChannelCreate.t) -> ())

let channel_update = ref (fun (_ : ChannelUpdate.t) -> ())

let channel_delete = ref (fun (_ : ChannelDelete.t) -> ())

let channel_pins_update = ref (fun (_ : ChannelPinsUpdate.t) -> ())

let guild_create = ref (fun (_ : GuildCreate.t) -> ())

let guild_update = ref (fun (_ : GuildUpdate.t) -> ())

let guild_delete = ref (fun (_ : GuildDelete.t) -> ())

let member_ban = ref (fun (_ : GuildBanAdd.t) -> ())

let member_unban = ref (fun (_ : GuildBanRemove.t) -> ())

let guild_emojis_update = ref (fun (_ : GuildEmojisUpdate.t) -> ())

(* let integrations_update = ref (fun (_:Yojson.Safe.t) -> ()) *)
let member_join = ref (fun (_ : GuildMemberAdd.t) -> ())

let member_leave = ref (fun (_ : GuildMemberRemove.t) -> ())

let member_update = ref (fun (_ : GuildMemberUpdate.t) -> ())

let members_chunk = ref (fun (_ : GuildMembersChunk.t) -> ())

let role_create = ref (fun (_ : GuildRoleCreate.t) -> ())

let role_update = ref (fun (_ : GuildRoleUpdate.t) -> ())

let role_delete = ref (fun (_ : GuildRoleDelete.t) -> ())

let message_create = ref (fun (_ : MessageCreate.t) -> ())

let message_update = ref (fun (_ : MessageUpdate.t) -> ())

let message_delete = ref (fun (_ : MessageDelete.t) -> ())

let message_delete_bulk = ref (fun (_ : MessageDeleteBulk.t) -> ())

let reaction_add = ref (fun (_ : ReactionAdd.t) -> ())

let reaction_remove = ref (fun (_ : ReactionRemove.t) -> ())

let reaction_remove_all = ref (fun (_ : ReactionRemoveAll.t) -> ())

let presence_update = ref (fun (_ : PresenceUpdate.t) -> ())

let typing_start = ref (fun (_ : TypingStart.t) -> ())

let user_update = ref (fun (_ : UserUpdate.t) -> ())

(* let voice_state_update = ref (fun (_:Yojson.Safe.t) -> ()) *)
(* let voice_server_update = ref (fun (_:Yojson.Safe.t) -> ()) *)
let webhook_update = ref (fun (_ : WebhookUpdate.t) -> ())

let unknown = ref (fun (_ : Unknown.t) -> ())
