# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :webchat,
  ecto_repos: [Webchat.Repo]

# Configures the endpoint
config :webchat, Webchat.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8/LhC1m6WWI1WZndi7M2Akw5Exf7Lc4OsoO57051PtetBblD3XIpKC9UB1kNYe3+",
  render_errors: [view: Webchat.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Webchat.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :guardian, Guardian,
       allowed_algos: ["HS512"], # optional
       verify_module: Guardian.JWT,  # optional
       issuer: "Webchat",
       ttl: { 30, :days },
       allowed_drift: 2000,
       verify_issuer: true, # optional
       secret_key: "r3yY4NVDLFcUCcRjU7SD1FoPkNfwlBJuvyhH1/F6oksyAG3S0L4iHaviUbT3hl1A",
       serializer: Webchat.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
