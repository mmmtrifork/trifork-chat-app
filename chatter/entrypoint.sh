#!/bin/sh

export MIX_ENV=prod
mix local.hex --force
mix local.rebar --force
mix deps.get
mix compile
mix ecto.create
mix phx.server
