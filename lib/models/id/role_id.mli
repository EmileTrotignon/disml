type t = [`Role_id of Snowflake.t] [@@deriving sexp, yojson {exn= true}]

val get_id : t -> Snowflake.t

val hash : t -> int

val compare : t -> t -> int

val ( = ) : t -> t -> bool
