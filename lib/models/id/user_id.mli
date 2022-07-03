include module type of User_id_t

val create_dm : [< `User_id of int] -> Channel_t.t Async.Deferred.Or_error.t

module Set : Core.Set.S with type Elt.t = t

module Map : Core.Map.S with type Key.t = t