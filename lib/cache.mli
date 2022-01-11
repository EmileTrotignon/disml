open Async
open Core

(** Represents a Map of {!Channel_id.t} keys. *)
module ChannelMap : module type of Map.Make (Channel_id_t)

(** Represents a Map of {!Guild_id.t} keys. *)
module GuildMap : module type of Map.Make (Guild_id_t)

(** Represents a Map of {!User_id.t} keys. *)
module UserMap : module type of Map.Make (User_id_t)

(** The full cache record. Immutable and intended to be wrapped in a concurrency-safe wrapper such as {{!Async.Mvar.Read_write.t}Mvar}.
    Channels are split by type so it isn't necessary to match them later on.
*)
type t =
  { text_channels: Channel_t.guild_text ChannelMap.t
  ; voice_channels: Channel_t.guild_voice ChannelMap.t
  ; categories: Channel_t.category ChannelMap.t
  ; groups: Channel_t.group ChannelMap.t
  ; private_channels: Channel_t.dm ChannelMap.t
  ; guilds: Guild_t.t GuildMap.t
  ; presences: Presence.t UserMap.t (* ; messages: Channel_id_t.t GuildMap.t *)
  ; unavailable_guilds: Guild_t.unavailable GuildMap.t
  ; user: User_t.t option
  ; users: User_t.t UserMap.t }

val cache : t Mvar.Read_write.t
(** A {{!t}cache} wrapped in an {{!Async.Mvar.Read_write.t}Mvar}. *)

val create : (* ?max_messages:int -> *)
             unit -> t
(** Creates a new, empty cache. *)

val guild : t -> Guild_id_t.t -> Guild_t.t option
(** Equivalent to {!GuildMap.find} on cache.guilds. *)

val text_channel : t -> Channel_id_t.t -> Channel_t.guild_text option
(** Equivalent to {!ChannelMap.find} on cache.text_channels. *)

val voice_channel : t -> Channel_id_t.t -> Channel_t.guild_voice option
(** Equivalent to {!ChannelMap.find} on cache.voice_channels. *)

val category : t -> Channel_id_t.t -> Channel_t.category option
(** Equivalent to {!ChannelMap.find} on cache.categories. *)

val dm : t -> Channel_id_t.t -> Channel_t.dm option
(** Equivalent to {!ChannelMap.find} on cache.private_channels. *)

val group : t -> Channel_id_t.t -> Channel_t.group option
(** Equivalent to {!ChannelMap.find} on cache.groups. *)

val channel : t -> Channel_id_t.t -> Channel_t.t option
(** Helper method that scans all channel stores and returns a {!Channel.t} holding the channel. *)
