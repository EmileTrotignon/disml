open Async

include module type of Guild_t

val ban_user :
  id:Snowflake.t -> ?reason:string -> ?days:int -> t -> unit Deferred.Or_error.t

val create : (string * Yojson.Safe.t) list -> t Deferred.Or_error.t

val create_emoji :
  name:string -> image:string -> t -> Emoji.t Deferred.Or_error.t

val create_role :
     name:string
  -> ?colour:int
  -> ?permissions:int
  -> ?hoist:bool
  -> ?mentionable:bool
  -> t
  -> Role_t.t Deferred.Or_error.t

val create_channel :
     mode:[`Text | `Voice | `Category]
  -> name:string
  -> t
  -> Channel_t.t Deferred.Or_error.t

val delete : t -> unit Deferred.Or_error.t

val get_ban : id:Snowflake.t -> t -> Ban_t.t Deferred.Or_error.t

val get_bans : t -> Ban_t.t list Deferred.Or_error.t

val get_emoji : id:Snowflake.t -> t -> Emoji.t Deferred.Or_error.t

val get_invites : t -> Yojson.Safe.t Deferred.Or_error.t

val get_prune_count : days:int -> t -> int Deferred.Or_error.t

val get_webhooks : t -> Yojson.Safe.t Deferred.Or_error.t

val kick_user :
  id:Snowflake.t -> ?reason:string -> t -> unit Deferred.Or_error.t

val leave : t -> unit Deferred.Or_error.t

val list_voice_regions : t -> Yojson.Safe.t Deferred.Or_error.t

val prune : days:int -> t -> int Deferred.Or_error.t

val request_members : t -> Member_t.t list Deferred.Or_error.t

val request_roles : t -> Role_t.t list Deferred.Or_error.t

val set_afk_channel : id:Snowflake.t -> t -> Guild_t.t Deferred.Or_error.t

val set_afk_timeout : timeout:int -> t -> Guild_t.t Deferred.Or_error.t

val set_name : name:string -> t -> Guild_t.t Deferred.Or_error.t

val set_icon : icon:string -> t -> Guild_t.t Deferred.Or_error.t

val unban_user :
  id:Snowflake.t -> ?reason:string -> t -> unit Deferred.Or_error.t

val get_channel : id:Channel_id_t.t -> t -> Channel_t.t Deferred.Or_error.t
(** Get a channel belonging to this guild. This does not make an HTTP request. *)

val get_member : id:User_id_t.t -> t -> Member_t.t Deferred.Or_error.t
(** Get a member belonging to this guild. This does not make an HTTP request. *)

val get_role : id:Role_id.t -> t -> Role_t.t option
(** Get a role belonging to this guild. This does not make an HTTP request. *)

val id : t -> Guild_id_t.t
(** The guild's snowflake ID. *)

val name : t -> string
(** The guild name. *)

val icon : t -> string option
(** The guild icon hash, if one is set. *)

val splash : t -> string option
(** The guild splash hash, if one is set. *)

val owner_id : t -> User_id_t.t
(** The user ID of the owner. *)

val region : t -> string
(** The region the guild is in. *)

val afk_channel_id : t -> Channel_id_t.t option
(** The AFK channel ID, if one is set. *)

val afk_timeout : t -> int
(** The time before a user is moved to the AFK channel. *)

val is_embed_enabled : t -> bool
(** Whether the embed is enabled. *)

val embed_channel_id : t -> Channel_id_t.t option
(** The channel ID of the embed channel, if it is enabled. *)

val verification_level : t -> int
(** See {{:https://discordapp.com/developers/docs/resources/guild#guild-object-verification-level} the discord docs} for details. *)

val default_message_notifications : t -> int
(** 0 = All messages, 1 = Only mentions *)

val explicit_content_filter : t -> int
(** 0 = Disabled, 1 = For members with no roles, 2 = All members *)

val roles : t -> Role_t.t list
(** List of roles in the guild. *)

val emojis : t -> Emoji.t list
(** List of custom emojis in the guild. *)

val features : t -> string list
(** A List of features enabled for the guild. *)

val mfa_level : t -> int
(** 0 = None, 1 = Elevated *)

val application_id : t -> Snowflake.t option
(** Snowflake ID if the guild is bot-created. *)

val is_widget_enabled : t -> bool
(** Whether the widget is enabled. *)

val widget_channel_id : t -> Channel_id_t.t option
(** The channel ID for the widget, if enabled. *)

val system_channel_id : t -> Channel_id_t.t option
(** The channel ID where system messages are sent. *)

val is_large : t -> bool
(** Whether the guild exceeds the configured large threshold. *)

val member_count : t -> int option
(** Total number of members in the guild. *)

val members : t -> Member_t.t list
(** List of guild members. *)

val channels : t -> Channel_t.t list
(** List of guild channels. *)

module Set : Core.Set.S with type Elt.t = t

module Map : Core.Map.S with type Key.t = t
