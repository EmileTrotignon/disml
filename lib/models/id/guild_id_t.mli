type t = [`Guild_id of Snowflake.t] [@@deriving sexp, yojson {exn= true}]

val compare : t -> t -> int

val hash : t -> int

val ( = ) : t -> t -> bool

val get_id : t -> Snowflake.t
