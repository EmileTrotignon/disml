(** Represents a single reaction as received over the gateway. *)
type reaction_event = {
    user_id: User_id_t.t;
    channel_id: Channel_id_t.t;
    message_id: Message_id.t;
    guild_id: Guild_id_t.t option;
    emoji: Emoji.partial_emoji;
} [@@deriving sexp, yojson { exn = true }]

(** Represents a number of emojis used as a reaction on a message. *)
type t = {
    count: int;
    emoji: Emoji.t;
} [@@deriving sexp, yojson { exn = true }]