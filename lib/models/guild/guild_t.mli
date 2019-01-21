type pre = {
    id: Snowflake.t;
    name: string;
    icon: string option;
    splash: string option;
    owner_id: Snowflake.t;
    region: string;
    afk_channel_id: Snowflake.t option;
    afk_timeout: int;
    embed_enabled: bool option;
    embed_channel_id: Snowflake.t option;
    verification_level: int;
    default_message_notifications: int;
    explicit_content_filter: int;
    roles: Role_t.role list;
    emojis: Emoji.t list;
    features: string list;
    mfa_level: int;
    application_id: Snowflake.t option;
    widget_enabled: bool option;
    widget_channel: Channel_t.channel_wrapper option;
    system_channel: Channel_t.channel_wrapper option;
    large: bool;
    unavailable: bool;
    member_count: int option;
    members: Member_t.member list;
    channels: Channel_t.channel_wrapper list;
} [@@deriving sexp, yojson]

type t = {
    id: Snowflake.t;
    name: string;
    icon: string option;
    splash: string option;
    owner_id: Snowflake.t;
    region: string;
    afk_channel_id: Snowflake.t option;
    afk_timeout: int;
    embed_enabled: bool option;
    embed_channel_id: Snowflake.t option;
    verification_level: int;
    default_message_notifications: int;
    explicit_content_filter: int;
    roles: Role_t.t list;
    emojis: Emoji.t list;
    features: string list;
    mfa_level: int;
    application_id: Snowflake.t option;
    widget_enabled: bool option;
    widget_channel: Channel_t.t option;
    system_channel: Channel_t.t option;
    large: bool;
    unavailable: bool;
    member_count: int option;
    members: Member_t.t list;
    channels: Channel_t.t list;
} [@@deriving sexp, yojson]

val wrap : pre -> t