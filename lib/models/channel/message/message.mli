open Async

include module type of Message_t

val add_reaction : t -> Emoji.t -> unit Deferred.Or_error.t
(** Add the given emoji as a reaction. *)

val remove_reaction : t -> Emoji.t -> User_t.t -> unit Deferred.Or_error.t
(** Remove the reaction. Must also specify the user. *)

val clear_reactions : t -> unit Deferred.Or_error.t
(** Remove all reactions from the message. *)

val delete : t -> unit Deferred.Or_error.t
(** Delete the message. *)

val pin : t -> unit Deferred.Or_error.t
(** Pin the message. *)

val unpin : t -> unit Deferred.Or_error.t
(** Unping the message. *)

val reply : t -> string -> t Deferred.Or_error.t
(** Sugar for [Channel_id.say msg.channel_id content]. *)

val reply_with :
     ?embed:Embed.t
  -> ?content:string
  -> ?file:string
  -> ?tts:bool
  -> t
  -> Message_t.t Deferred.Or_error.t
(** Sugar for [Channel_id.send_message ?embed ?content ?file ?tts msg.channel_id]. *)

val set_content : t -> string -> t Deferred.Or_error.t
(** Set the content of the message. *)

val set_embed : t -> Embed.t -> t Deferred.Or_error.t
(** Set the embed of the message. *)
