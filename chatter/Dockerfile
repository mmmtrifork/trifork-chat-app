FROM elixir:latest

EXPOSE 4000

RUN mkdir /app
WORKDIR /app
COPY ./ /app/
ENTRYPOINT ["./entrypoint.sh"]
