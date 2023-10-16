# PhoenixStorybookSample

Demo phoenix web application to showcase [phoenix_storybook](https://github.com/phenixdigital/phoenix_storybook/).

👉 [Available online here](https://phoenix-storybook-demo.fly.dev)

## Setup

- Install dependencies with `mix deps.get`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000/storybook`](http://localhost:4000/storybook) from your browser.

## Deployment

First make sure your sample app is using an up-to-date storybook library:

```
MIX_ENV=prod mix deps.update phoenix_storybook
```

Then you can test your release locally with:

```
MIX_ENV=prod mix release
PHX_SERVER=true _build/prod/rel/phoenix_storybook_sample/bin/phoenix_storybook_sample start
```

Or go for production instead:

```
fly deploy --no-cache
```
