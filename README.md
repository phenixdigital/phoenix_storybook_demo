# PhxLiveStorybookSample

Demo phoenix web application to showcase [phx_live_storybook](https://github.com/phenixdigital/phx_live_storybook/).

👉 [Available online here](https://phx-live-storybook-sample.fly.dev/storybook)

## Setup

- Install dependencies with `mix deps.get`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000/storybook`](http://localhost:4000/storybook) from your browser.

## Deployment

First make sure your sample app is using an up-to-date storybook library:

```
MIX_ENV=prod mix deps.update phx_live_storybook
MIX_ENV=prod mix release
```

Then you can test your release locally with:

```
PHX_SERVER=true _build/prod/rel/phx_live_storybook_sample/bin/phx_live_storybook_sample start
```

Or go for production instead:

```
mix assets.build
fly deploy
```
