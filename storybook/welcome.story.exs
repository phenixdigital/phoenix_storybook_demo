defmodule Storybook.MyPage do
  # See https://hexdocs.pm/phx_live_storybook/PhxLiveStorybook.Story.html for full story
  # documentation.
  use PhxLiveStorybook.Story, :page

  def description, do: "Your very first steps into using Phoenix Storybook"

  # Declare an optional tab-based navigation in your page:
  def navigation do
    [
      {:welcome, "Welcome", {:fa, "hand-wave", :thin}},
      {:components, "Components", {:fa, "toolbox", :thin}},
      {:sandboxing, "Sandboxing", {:fa, "box-check", :thin}},
      {:icons, "Icons", {:fa, "icons", :thin}}
    ]
  end

  # This is a dummy fonction that you should replace with your own HEEx content.
  def render(assigns = %{tab: :welcome}) do
    ~H"""
    <div class="lsb-welcome-page">
      <p>
        We generated your storybook with an example of a page and a component.
        Feel free to explore the generated <code class="inline">*.story.exs</code> files generated into your
        project folder, and start adding yours: <strong>just drop new story & index files into your
        </strong><code class="inline">/storybook</code> <strong>folder</strong> and refresh your storybook.
      </p>

      <p>
        Here are a few docs you might be interested in:
      </p>

      <.description_list items={[
        {"Stories overview", doc_link("Story")},
        {"Describe components with Variations", doc_link("Stories.Variation")},
        {"And stack them with VariationGroups", doc_link("Stories.VariationGroup")},
        {"Pimp your sidebar with Index files", doc_link("Index")},
      ]}/>

      <p>
        This should be enough to get you started but you might also <strong>checkout advanced guides
        </strong>(tabs in the upper-right corner of this page).
      </p>
    </div>
    """
  end

  def render(assigns = %{tab: guide}) when guide in ~w(components sandboxing icons)a do
    assigns = assign(assigns, guide: PhxLiveStoryBook.Guides.markup("#{guide}.md"))

    ~H"""
    <p class="md:text-lg leading-relaxed text-slate-400 w-full text-left mb-4 mt-2 italic text-left ">
      <a class="hover:text-indigo-700" href={"https://hexdocs.pm/phx_live_storybook/#{guide}.html"} target="_blank">
        This guide is also available on Hexdocs among others.
      </a>
    </p>
    <div class="lsb-welcome-page lsb-border-t lsb-border-gray-200 lsb-pt-4">
      <%= Phoenix.HTML.raw(@guide) %>
    </div>
    """
  end

  defp description_list(assigns) do
    ~H"""
    <div class="w-full md:px-8">
      <div class="md:border-t border-gray-200 px-4 py-5 sm:p-0 md:my-6 w-full ">
        <dl class="sm:divide-y sm:divide-gray-200">
          <%= for {dt, {link_href, link_label}} <- @items do %>
            <div class="py-4 sm:grid sm:grid-cols-3 sm:gap-4 sm:py-5 sm:px-6">
              <dt class="text-base font-medium text-indigo-700">
                <%= dt %>
              </dt>
              <dd class="mt-1 text-base text-slate-400 sm:col-span-2 sm:mt-0 group cursor-pointer">
                <a class="group-hover:text-indigo-700 truncate" href={link_href} target="_blank" %>
                  <%= link_label %>
                </a>
              </dd>
            </div>
          <% end %>
        </dl>
      </div>
    </div>
    """
  end

  defp doc_link(page) do
    {
      "https://hexdocs.pm/phx_live_storybook/PhxLiveStorybook.#{page}.html",
      "hexdocs.pm/.../PhxLiveStorybook.#{page}"
    }
  end
end
