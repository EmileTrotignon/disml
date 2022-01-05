open Async

include module type of Role_t

(** Deletes the role. This is permanent. *)
val delete : t -> unit Deferred.Or_error.t

(** Edits the role to allow mentions. *)
val allow_mention : t -> t Deferred.Or_error.t

(** Opposite of {!allow_mention} *)
val disallow_mention : t -> t Deferred.Or_error.t

(** Hoists the role. See {!Role.t.hoist}. *)
val hoist : t -> t Deferred.Or_error.t

(** Opposite of {!hoist}. *)
val unhoist : t -> t Deferred.Or_error.t

(** Sets the colour of the role. *)
val set_colour : colour:int -> t -> t Deferred.Or_error.t

(** Sets the name of the role. *)
val set_name : name:string -> t -> t Deferred.Or_error.t

val id : t-> Role_id.t

val name : t ->  string

val colour : t ->  int

val is_hoist : t ->  bool

val position : t ->  int

val permissions : t ->  Permissions.t

val is_managed : t ->  bool

val is_mentionable : t ->  bool

val guild_id : t ->  Guild_id_t.t