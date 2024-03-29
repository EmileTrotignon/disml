open Core
include Channel_t

exception Invalid_message

exception No_message_found

let send_message ?embed ?content ?file ?(tts = false) ch =
  let embed = match embed with Some e -> Embed.to_yojson e | None -> `Null in
  let content = match content with Some c -> `String c | None -> `Null in
  let file = match file with Some f -> `String f | None -> `Null in
  let () =
    match (embed, content) with
    | `Null, `Null ->
        raise Invalid_message
    | _ ->
        ()
  in
  Http.create_message (get_id ch)
    (`Assoc
      [ ("embed", embed)
      ; ("content", content)
      ; ("file", file)
      ; ("tts", `Bool tts) ] )

let say content ch = send_message ~content ch

let delete ch = Http.delete_channel (get_id ch)

let get_message ~id ch = Http.get_message (get_id ch) id

let get_messages ?(mode = `Around) ?(limit = 50) ch message_id =
  let message_id = Message_id.get_id message_id in
  let kind =
    match mode with
    | `Around ->
        ("around", message_id)
    | `Before ->
        ("before", message_id)
    | `After ->
        ("after", message_id)
  in
  Http.get_messages (get_id ch) limit kind

let broadcast_typing ch = Http.broadcast_typing (get_id ch)

let get_pins ch = Http.get_pinned_messages (get_id ch)

let bulk_delete msgs ch =
  let msgs = `List (List.map ~f:(fun id -> `Int id) msgs) in
  Http.bulk_delete (get_id ch) msgs

module Set = Set.Make (Channel_t)
module Map = Map.Make (Channel_t)
