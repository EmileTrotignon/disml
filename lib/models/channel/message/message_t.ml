open Core

type t = {
    id: Message_id.t;
    author: User_t.t;
    channel_id: Channel_id_t.t;
    member: Member_t.partial_member option [@default None];
    guild_id: Guild_id_t.t option [@default None];
    content: string;
    timestamp: string;
    edited_timestamp: string option [@default None];
    tts: bool;
    mention_everyone: bool;
    mentions: User_t.t list [@default []];
    mention_roles: Role_id.t list [@default []];
    attachments: Attachment.t list [@default []];
    embeds: Embed.t list [@default []];
    reactions: Reaction_t.t list [@default []];
    nonce: Snowflake.t option [@default None];
    pinned: bool;
    webhook_id: Snowflake.t option [@default None];
    kind: int [@key "type"];
} [@@deriving sexp, yojson { strict = false; exn = true }]