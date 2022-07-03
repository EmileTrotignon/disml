open Core
include User_id_t

let create_dm (`User_id id) =
  Http.create_dm (`Assoc [("recipient_id", Snowflake.to_yojson id)])

module Set = Set.Make (User_id_t)
module Map = Map.Make (User_id_t)
