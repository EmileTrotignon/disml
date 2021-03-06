(** Represents a message object. *)
type t =
  { id: Message_id.t  (** Snowflake ID of the message. *)
  ; author: User_t.t  (** User that authored the message. *)
  ; channel_id: Channel_id_t.t  (** Channel ID the message exists in. *)
  ; member: Member_t.partial_member option
        (** A partial member if the message was sent in a guild. *)
  ; guild_id: Guild_id_t.t option
        (** Guild ID if the message was sent in a guild. *)
  ; content: string  (** Content of the message. *)
  ; timestamp: string  (** ISO8601 timestamp of when the message was created. *)
  ; edited_timestamp: string option
        (** Like timestamp, but for last edit, if any. *)
  ; tts: bool  (** Whether the message used text-to-speech. *)
  ; mention_everyone: bool
        (** Whether the message mentioned [@everyone] or [@here] *)
  ; mentions: User_t.t list
        (** A List of users that were mentioned in the message. *)
  ; mention_roles: Role_id.t list
        (** A list of roles that were mentioned in the message. *)
  ; attachments: Attachment.t list  (** A list of attachments. *)
  ; embeds: Embed.t list  (** A List of embeds on the message. *)
  ; reactions: Reaction_t.t list  (** A list of reactions. *)
  ; nonce: Snowflake.t option  (** Used in verification, safe to ignore. *)
  ; pinned: bool  (** Whether the message is pinned. *)
  ; webhook_id: Snowflake.t option
        (** The webhook ID, if the message was sent by a webhook. *)
  ; kind: int
        (** See {{:https://discordapp.com/developers/docs/resources/channel#message-object-message-types}the discord docs} for message type enumeration. *)
  }
[@@deriving sexp, yojson {exn= true}]
