include module type of Member_t

val add_role : role:Role_t.t -> Member_t.t -> (unit, string) Lwt_result.t
(** Adds a role to the member. *)

val remove_role : role:Role_t.t -> Member_t.t -> (unit, string) Lwt_result.t
(** Removes a role from the member. *)

val ban :
  ?reason:string -> ?days:int -> Member_t.t -> (unit, string) Lwt_result.t
(** Bans the member with optional reason and days of messages to delete. *)

val kick : ?reason:string -> Member_t.t -> (unit, string) Lwt_result.t
(** Kicks the member with the optional reason. *)

val mute : Member_t.t -> (unit, string) Lwt_result.t
(** Mutes the member, preventing them from speaking in voice chats. *)

val deafen : Member_t.t -> (unit, string) Lwt_result.t
(** Deafens the member, preventing them from hearing others in voice chats. *)

val unmute : Member_t.t -> (unit, string) Lwt_result.t
(** Opposite of {!mute}. *)

val undeafen : Member_t.t -> (unit, string) Lwt_result.t
(** Opposite of {!deafen}. *)

val nick : Member_t.t -> string option

val roles : Member_t.t -> Role_id.t list

val joined_at : Member_t.t -> string

val is_deaf : Member_t.t -> bool

val is_mute : Member_t.t -> bool

val user : Member_t.t -> User_t.t

val guild_id : Member_t.t -> Guild_id_t.t
