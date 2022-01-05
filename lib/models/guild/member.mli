open Async

include module type of Member_t

(** Adds a role to the member. *)
val add_role : role:Role_t.t -> Member_t.t -> unit Deferred.Or_error.t

(** Removes a role from the member. *)
val remove_role : role:Role_t.t -> Member_t.t -> unit Deferred.Or_error.t

(** Bans the member with optional reason and days of messages to delete. *)
val ban : ?reason:string -> ?days:int -> Member_t.t -> unit Deferred.Or_error.t

(** Kicks the member with the optional reason. *)
val kick : ?reason:string -> Member_t.t -> unit Deferred.Or_error.t

(** Mutes the member, preventing them from speaking in voice chats. *)
val mute : Member_t.t -> unit Deferred.Or_error.t

(** Deafens the member, preventing them from hearing others in voice chats. *)
val deafen : Member_t.t -> unit Deferred.Or_error.t

(** Opposite of {!mute}. *)
val unmute : Member_t.t -> unit Deferred.Or_error.t

(** Opposite of {!deafen}. *)
val undeafen : Member_t.t -> unit Deferred.Or_error.t

val nick : Member_t.t -> string option

val roles : Member_t.t -> Role_id.t list

val joined_at : Member_t.t -> string

val is_deaf : Member_t.t -> bool

val is_mute : Member_t.t -> bool

val user : Member_t.t -> User_t.t

val guild_id : Member_t.t -> Guild_id_t.t
