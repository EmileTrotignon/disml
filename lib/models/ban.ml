type t = {
    id: Snowflake.t;
    user: User.t;
} [@@deriving yojson]