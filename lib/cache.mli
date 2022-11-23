open Async

(** The full cache record. Immutable and intended to be wrapped in a concurrency-safe wrapper such as {{!Async.Mvar.Read_write.t}Mvar}.
    Channels are split by type so it isn't necessary to match them later on.
*)
type t =
  { text_channels: Channel_t.guild_text Channel_id.Map.t
  ; voice_channels: Channel_t.guild_voice Channel_id.Map.t
  ; categories: Channel_t.category Channel_id.Map.t
  ; groups: Channel_t.group Channel_id.Map.t
  ; private_channels: Channel_t.dm Channel_id.Map.t
  ; guilds: Guild_t.t Guild_id.Map.t
  ; presences:
      Presence.t User_id.Map.t (* ; messages: Channel_id_t.t Guild_id.Map.t *)
  ; unavailable_guilds: Guild_t.unavailable Guild_id.Map.t
  ; user: User_t.t option
  ; users: User_t.t User_id.Map.t }

val cache : t Mvar.Read_write.t
(** A {{!t}cache} wrapped in an {{!Async.Mvar.Read_write.t}Mvar}. *)

val create : (* ?max_messages:int -> *)
             unit -> t
(** Creates a new, empty cache. *)

val guild : t -> Guild_id_t.t -> Guild_t.t option
(** Equivalent to {!Guild_id.Map.find} on cache.guilds. *)

val text_channel : t -> Channel_id_t.t -> Channel_t.guild_text option
(** Equivalent to {!Channel_id.Map.find} on cache.text_channels. *)

val voice_channel : t -> Channel_id_t.t -> Channel_t.guild_voice option
(** Equivalent to {!Channel_id.Map.find} on cache.voice_channels. *)

val category : t -> Channel_id_t.t -> Channel_t.category option
(** Equivalent to {!Channel_id.Map.find} on cache.categories. *)

val dm : t -> Channel_id_t.t -> Channel_t.dm option
(** Equivalent to {!Channel_id.Map.find} on cache.private_channels. *)

val group : t -> Channel_id_t.t -> Channel_t.group option
(** Equivalent to {!Channel_id.Map.find} on cache.groups. *)

val channel : t -> Channel_id_t.t -> Channel_t.t option
(** Helper method that scans all channel stores and returns a {!Channel.t} holding the channel. *)
