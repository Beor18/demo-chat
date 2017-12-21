# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :demo_chat,
  ecto_repos: [DemoChat.Repo]

# Configures the endpoint
config :demo_chat, DemoChat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "drlPszl1sTFWV25t//L/CWzkAo7QEH1sodoJ6e8veKc3n8a6hegCCS1m5O/wP0Vw",
  render_errors: [view: DemoChat.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DemoChat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
