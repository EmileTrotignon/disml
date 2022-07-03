include module type of User_t

val tag : t -> string
(** The user tag. Equivalent to concatenating the username and discriminator, separated by a '#'. *)

val mention : t -> string
(** The mention string for the user. Equivalent to [<@USER_ID>]. *)

val default_avatar : t -> Endpoints.t
(** The default avatar for the user. *)

val face : t -> Endpoints.t
(** The avatar url of the user, falling back to the default avatar. *)

module Set : Core.Set.S with type Elt.t = t

module Map : Core.Map.S with type Key.t = t
