open Core
open Printf

let gateway = "/gateway"

let gateway_bot = "/gateway/bot"

let channel = sprintf "/channels/%d"

let channel_messages = sprintf "/channels/%d/messages"

let channel_message = sprintf "/channels/%d/messages/%d"

let channel_reaction_me = sprintf "/channels/%d/messages/%d/reactions/%s/@me"

let channel_reaction = sprintf "/channels/%d/messages/%d/reactions/%s/%d"

let channel_reactions_get = sprintf "/channels/%d/messages/%d/reactions/%s"

let channel_reactions_delete = sprintf "/channels/%d/messages/%d/reactions"

let channel_bulk_delete = sprintf "/channels/%d"

let channel_permission = sprintf "/channels/%d/permissions/%d"

let channel_permissions = sprintf "/channels/%d/permissions"

let channels = "/channels"

let channel_call_ring = sprintf "/channels/%d/call/ring"

let channel_invites = sprintf "/channels/%d/invites"

let channel_typing = sprintf "/channels/%d/typing"

let channel_pins = sprintf "/channels/%d/pins"

let channel_pin = sprintf "/channels/%d/pins/%d"

let guilds = "/guilds"

let guild = sprintf "/guilds/%d"

let guild_channels = sprintf "/guilds/%d/channels"

let guild_members = sprintf "/guilds/%d/members?limit=1000"

let guild_member = sprintf "/guilds/%d/members/%d"

let guild_member_role = sprintf "/guilds/%d/members/%d/roles/%d"

let guild_bans = sprintf "/guilds/%d/bans"

let guild_ban = sprintf "/guilds/%d/bans/%d"

let guild_roles = sprintf "/guilds/%d/roles"

let guild_role = sprintf "/guilds/%d/roles/%d"

let guild_prune = sprintf "/guilds/%d/prune"

let guild_voice_regions = sprintf "/guilds/%d/regions"

let guild_invites = sprintf "/guilds/%d/invites"

let guild_integrations = sprintf "/guilds/%d/integrations"

let guild_integration = sprintf "/guilds/%d/integrations/%d"

let guild_integration_sync = sprintf "/guilds/%d/integrations/%d/sync"

let guild_embed = sprintf "/guilds/%d/embed"

let guild_emojis = sprintf "/guilds/%d/emojis"

let guild_emoji = sprintf "/guilds/%d/emojis/%d"

let webhooks_guild = sprintf "/guilds/%d/webhooks"

let webhooks_channel = sprintf "/channels/%d/webhooks"

let webhook = sprintf "/webhooks/%d"

let webhook_token = sprintf "/webhooks/%d/%s"

let webhook_git = sprintf "/webhooks/%d/%s/github"

let webhook_slack = sprintf "/webhooks/%d/%s/slack"

let user = sprintf "/users/%d"

let me = "/users/@me"

let me_guilds = "/users/@me/guilds"

let me_guild = sprintf "/users/@me/guilds/%d"

let me_channels = "/users/@me/channels"

let me_connections = "/users/@me/connections"

let invite = sprintf "/invites/%s"

let regions = "/voice/regions"

let application_information = "/oauth2/applications/@me"

let group_recipient = sprintf "/channels/%d/recipients/%d"

let guild_me_nick = sprintf "/guilds/%d/members/@me/nick"

let guild_vanity_url = sprintf "/guilds/%d/vanity-url"

let guild_audit_logs = sprintf "/guilds/%d/audit-logs"

let cdn_embed_avatar = sprintf "/embed/avatars/%s.png"

let cdn_emoji = sprintf "/emojis/%s.%s"

let cdn_icon = sprintf "/icons/%d/%s.%s"

let cdn_avatar = sprintf "/avatars/%d/%s.%s"

let cdn_default_avatar = sprintf "/embed/avatars/%d"
