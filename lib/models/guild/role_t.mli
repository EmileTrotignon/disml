type role = {
    id: Role_id.t;
    name: string;
    colour: int;
    hoist: bool;
    position: int;
    permissions: int;
    managed: bool;
    mentionable: bool;
} [@@deriving sexp, yojson]

type t = {
    id: Role_id.t;
    name: string;
    colour: int;
    hoist: bool;
    position: int;
    permissions: int;
    managed: bool;
    mentionable: bool;
    guild_id: Guild_id_t.t;
} [@@deriving sexp, yojson]

val wrap : guild_id:Snowflake.t -> role -> t