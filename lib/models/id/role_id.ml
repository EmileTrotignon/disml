open Core

type t = [`Role_id of Snowflake.t] [@@deriving sexp]

let compare (`Role_id t) (`Role_id t') = Snowflake.compare t t'

let hash (`Role_id t) = Snowflake.hash t

let ( = ) t1 t2 = compare t1 t2 = 0

let of_yojson a : (t, string) result =
  match Snowflake.of_yojson a with
  | Ok id ->
      Ok (`Role_id id)
  | Error err ->
      Error err

let of_yojson_exn a : t = `Role_id (Snowflake.of_yojson_exn a)

let to_yojson (`Role_id id) = Snowflake.to_yojson id

let get_id (`Role_id id) = id
