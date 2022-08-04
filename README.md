# PhxLiveStorybookSample

Demo phoenix web application to showcase [phx_live_storybook](https://github.com/phenixdigital/phx_live_storybook/).

👉 [Available online here](https://phx-live-storybook-sample.fly.dev/storybook)

For a better developper experience (code reload), `phx_live_storybook` is symlinked as an umbrella app under `apps/phx_live_storybook`.

## Setup

- Clone `phx_live_storybook` alongside this repo (relative path from current repo: `../phx_live_storybook`)
- Install dependencies with `mix deps.get`
- Install storybook dependencies with `mix cmd --app phx_live_storybook mix deps.get`
- Install storybook JS dependencies: `npm i --prefix ../phx_live_storybook/assets`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000/storybook`](http://localhost:4000/storybook) from your browser.

## Deployment

First make sure your sample app is using an up-to-date storybook library:

```
MIX_ENV=prod mix deps.update phx_live_storybook
```

Then you can test your release locally with:

```
MIX_ENV=prod mix release
PHX_SERVER=true _build/prod/rel/phx_live_storybook_sample/bin/phx_live_storybook_sample start
```

Or go for production instead:

```
mix assets.build
flyctl deploy --no-cache
```
