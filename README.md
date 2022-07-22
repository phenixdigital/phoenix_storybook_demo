# PhxLiveStorybookSample

Demo phoenix web application to showcase [phx_live_storybook](https://github.com/phenixdigital/phx_live_storybook/).

For a better developper experience (code reload), `phx_live_storybook` is symlinked as an umbrella app under `apps/phx_live_storybook`.

## Setup

- Clone `phx_live_storybook` alongside this repo (relative path from current repo: `../phx_live_storybook`)
- Install dependencies with `mix deps.get`
- Install storybook asset dependencies: `cd apps/phx_live_storybook/assets && npm install`
- Watch storybook assets: `cd - && mix storybook.assets.watch`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000/storybook`](http://localhost:4000/storybook) from your browser.
