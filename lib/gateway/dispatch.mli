(** Used to store dispatch callbacks. Each event can only have one callback registered at a time.
    These should be accessed through their re-export in {!Client}.
    {3 Examples}
    [Client.ready := (fun _ -> print_endline "Shard is Ready!")]

    [Client.guild_create := (fun guild -> print_endline guild.name)]

    {[
open Core
open Disml

let check_command (msg : Message.t) =
    if String.is_prefix ~prefix:"!ping" msg.content then
        Message.reply msg "Pong!" >>> ignore

Client.message_create := check_command
    ]}
*)

open Event_models

val ready : (Ready.t -> unit Lwt.t) ref
(** Dispatched when each shard receives READY from discord after identifying on the gateway. Other event dispatch is received after this. *)

val resumed : (Resumed.t -> unit Lwt.t) ref
(** Dispatched when successfully reconnecting to the gateway. *)

val channel_create : (ChannelCreate.t -> unit Lwt.t) ref
(** Dispatched when a channel is created which is visible to the bot. *)

val channel_update : (ChannelUpdate.t -> unit Lwt.t) ref
(** Dispatched when a channel visible to the bot is changed. *)

val channel_delete : (ChannelDelete.t -> unit Lwt.t) ref
(** Dispatched when a channel visible to the bot is deleted. *)

val channel_pins_update : (ChannelPinsUpdate.t -> unit Lwt.t) ref
(** Dispatched when messages are pinned or unpinned from a a channel. *)

val guild_create : (GuildCreate.t -> unit Lwt.t) ref
(** Dispatched when the bot joins a guild, and during startup. *)

val guild_update : (GuildUpdate.t -> unit Lwt.t) ref
(** Dispatched when a guild the bot is in is edited. *)

val guild_delete : (GuildDelete.t -> unit Lwt.t) ref
(** Dispatched when the bot is removed from a guild. *)

val member_ban : (GuildBanAdd.t -> unit Lwt.t) ref
(** Dispatched when a member is banned. *)

val member_unban : (GuildBanRemove.t -> unit Lwt.t) ref
(** Dispatched when a member is unbanned. *)

val guild_emojis_update : (GuildEmojisUpdate.t -> unit Lwt.t) ref
(** Dispatched when emojis are added or removed from a guild. *)

(** Dispatched when a guild's integrations are updated. *)
(* val integrations_update : (Yojson.Safe.t -> unit Lwt.t) ref *)

val member_join : (GuildMemberAdd.t -> unit Lwt.t) ref
(** Dispatched when a member joins a guild. *)

val member_leave : (GuildMemberRemove.t -> unit Lwt.t) ref
(** Dispatched when a member leaves a guild. Is Dispatched alongside {!Client.member_ban} when a user is banned. *)

val member_update : (GuildMemberUpdate.t -> unit Lwt.t) ref
(** Dispatched when a member object is updated. *)

val members_chunk : (GuildMembersChunk.t -> unit Lwt.t) ref
(** Dispatched when requesting guild members through {!Client.request_guild_members} *)

val role_create : (GuildRoleCreate.t -> unit Lwt.t) ref
(** Dispatched when a role is created. *)

val role_update : (GuildRoleUpdate.t -> unit Lwt.t) ref
(** Dispatched when a role is edited. *)

val role_delete : (GuildRoleDelete.t -> unit Lwt.t) ref
(** Dispatched when a role is deleted. *)

val message_create : (MessageCreate.t -> unit Lwt.t) ref
(** Dispatched when a message is sent. *)

val message_update : (MessageUpdate.t -> unit Lwt.t) ref
(** Dispatched when a message is edited. This does not necessarily mean the content changed. *)

val message_delete : (MessageDelete.t -> unit Lwt.t) ref
(** Dispatched when a message is deleted. *)

val message_delete_bulk : (MessageDeleteBulk.t -> unit Lwt.t) ref
(** Dispatched when messages are bulk deleted. *)

val reaction_add : (ReactionAdd.t -> unit Lwt.t) ref
(** Dispatched when a rection is added to a message. *)

val reaction_remove : (ReactionRemove.t -> unit Lwt.t) ref
(** Dispatched when a reaction is removed from a message. *)

val reaction_remove_all : (ReactionRemoveAll.t -> unit Lwt.t) ref
(** Dispatched when all reactions are cleared from a message. *)

val presence_update : (PresenceUpdate.t -> unit Lwt.t) ref
(** Dispatched when a user updates their presence. *)

val typing_start : (TypingStart.t -> unit Lwt.t) ref
(** Dispatched when a typing indicator is displayed. *)

val user_update : (UserUpdate.t -> unit Lwt.t) ref
(** Dispatched when the current user is updated. You most likely want {!Client.member_update} or {!Client.presence_update} instead. *)

val webhook_update : (WebhookUpdate.t -> unit Lwt.t) ref
(** Dispatched when a webhook is updated. *)

val unknown : (Unknown.t -> unit Lwt.t) ref
(** Dispatched as a fallback for unknown events. *)

(**/**)
(* val voice_state_update : (Yojson.Safe.t -> unit Lwt.t) ref *)
(* val voice_server_update : (Yojson.Safe.t -> unit Lwt.t) ref *)
