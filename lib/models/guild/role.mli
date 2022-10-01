include module type of Role_t

val delete : t -> (unit, string) Lwt_result.t
(** Deletes the role. This is permanent. *)

val allow_mention : t -> (t, string) Lwt_result.t
(** Edits the role to allow mentions. *)

val disallow_mention : t -> (t, string) Lwt_result.t
(** Opposite of {!allow_mention} *)

val hoist : t -> (t, string) Lwt_result.t
(** Hoists the role. See {!Role.t.hoist}. *)

val unhoist : t -> (t, string) Lwt_result.t
(** Opposite of {!hoist}. *)

val set_colour : colour:int -> t -> (t, string) Lwt_result.t
(** Sets the colour of the role. *)

val set_name : name:string -> t -> (t, string) Lwt_result.t
(** Sets the name of the role. *)
