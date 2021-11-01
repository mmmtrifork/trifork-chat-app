# # Extend from the official Elixir image
# FROM elixir:latest

# # Create app directory and copy the Elixir projects into it
# RUN mkdir /app
# COPY . /app
# WORKDIR /app

# # Install hex package manager
# # By using --force, we don’t need to type “Y” to confirm the installation
# RUN mix local.hex --force

# # Compile the project
# RUN mix deps.get
# RUN mix do compile

# CMD ["/app/entrypoint.sh"]

FROM bitwalker/alpine-elixir-phoenix:latest

# Set mix env and ports
ENV MIX_ENV=prod \
    PORT=4000

# Cache elixir deps
# ADD mix.exs mix.lock ./
# RUN mix do deps.get, deps.compile

# ADD . .

# # Run frontend build, compile, and digest assets
# RUN mix do compile, phx.digest
RUN mix local.hex --force

# Compile the project
RUN mix deps.get
RUN mix do compile

CMD ["mix", "phx.server"]