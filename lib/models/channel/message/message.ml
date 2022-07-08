open Core
open Async
include Message_t

let add_reaction msg (emoji : Emoji.t) =
  let (`Message_id id) = msg.id in
  let (`Channel_id channel_id) = msg.channel_id in
  let e =
    match emoji.id with
    | Some i ->
        Printf.sprintf "%s:%d" emoji.name i
    | None ->
        emoji.name
  in
  Http.create_reaction channel_id id e

let remove_reaction msg (emoji : Emoji.t) (user : User_t.t) =
  let (`Message_id id) = msg.id in
  let (`Channel_id channel_id) = msg.channel_id in
  let (`User_id user_id) = user.id in
  let e =
    match emoji.id with
    | Some i ->
        Printf.sprintf "%s:%d" emoji.name i
    | None ->
        emoji.name
  in
  Http.delete_reaction channel_id id e user_id

let clear_reactions msg =
  let (`Message_id id) = msg.id in
  let (`Channel_id channel_id) = msg.channel_id in
  Http.delete_reactions channel_id id

let delete msg =
  let (`Message_id id) = msg.id in
  let (`Channel_id channel_id) = msg.channel_id in
  Http.delete_message channel_id id

let pin msg =
  let (`Message_id id) = msg.id in
  let (`Channel_id channel_id) = msg.channel_id in
  Http.pin_message channel_id id

let unpin msg =
  let (`Message_id id) = msg.id in
  let (`Channel_id channel_id) = msg.channel_id in
  Http.unpin_message channel_id id

let reply msg content = Channel_id.say content msg.channel_id

let reply_with ?embed ?content ?file ?tts msg =
  Channel_id.send_message ?embed ?content ?file ?tts msg.channel_id

let set_content msg cont =
  let (`Message_id id) = msg.id in
  let (`Channel_id channel_id) = msg.channel_id in
  to_yojson {msg with content= cont} |> Http.edit_message channel_id id

let set_embed msg embed =
  let (`Message_id id) = msg.id in
  let (`Channel_id channel_id) = msg.channel_id in
  to_yojson {msg with embeds= [embed]} |> Http.edit_message channel_id id

let link msg =
  let (`Channel_id channel_id) = msg.channel_id in
  let (`Message_id msg_id) = msg.id in
  match msg.guild_id with
  | None ->
      sprintf "https://discord.com/channels/@me/%i/%i" channel_id msg_id
  | Some (`Guild_id guild_id) ->
      sprintf "https://discord.com/channels/%i/%i/%i" guild_id channel_id msg_id
