open Async

type t =
  { text_channels: Channel_t.guild_text Channel_id.Map.t
  ; voice_channels: Channel_t.guild_voice Channel_id.Map.t
  ; categories: Channel_t.category Channel_id.Map.t
  ; groups: Channel_t.group Channel_id.Map.t
  ; private_channels: Channel_t.dm Channel_id.Map.t
  ; guilds: Guild_t.t Guild_id.Map.t
  ; presences:
      Presence.t User_id.Map.t (* ; messages: Channel_id_t.t Guild_id.Map.t *)
  ; unavailable_guilds: Guild_t.unavailable Guild_id.Map.t
  ; user: User_t.t option
  ; users: User_t.t User_id.Map.t }

let create () =
  { text_channels= Channel_id.Map.empty
  ; voice_channels= Channel_id.Map.empty
  ; categories= Channel_id.Map.empty
  ; groups= Channel_id.Map.empty
  ; private_channels= Channel_id.Map.empty
  ; guilds= Guild_id.Map.empty
  ; presences= User_id.Map.empty
  ; unavailable_guilds= Guild_id.Map.empty
  ; user= None
  ; users= User_id.Map.empty }

let cache =
  let m = Mvar.create () in
  Mvar.set m (create ()) ;
  m

let guild cache = Guild_id.Map.find cache.guilds

let text_channel cache = Channel_id.Map.find cache.text_channels

let voice_channel cache = Channel_id.Map.find cache.voice_channels

let category cache = Channel_id.Map.find cache.categories

let dm cache = Channel_id.Map.find cache.private_channels

let group cache = Channel_id.Map.find cache.groups

let channel cache id =
  let check = Channel_id.Map.find in
  match check cache.text_channels id with
  | Some c ->
      Some (`GuildText c)
  | None -> (
    match check cache.voice_channels id with
    | Some c ->
        Some (`GuildVoice c)
    | None -> (
      match check cache.categories id with
      | Some c ->
          Some (`Category c)
      | None -> (
        match check cache.private_channels id with
        | Some c ->
            Some (`Private c)
        | None -> (
          match check cache.groups id with
          | Some c ->
              Some (`Group c)
          | None ->
              None ) ) ) )
