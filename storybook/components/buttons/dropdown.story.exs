defmodule Storybook.Components.Buttons.Dropdown do
  alias PhoenixStorybookSample.Components.Dropdown

  use PhoenixStorybook.Story, :component

  def function, do: &Dropdown.dropdown/1

  def variations do
    [
      %Variation{
        id: :default,
        description: "Default dropdown",
        attributes: %{
          text: "A dropdown"
        },
        slots: [
          ~s|<:entry path="#" text="Account settings"/>|,
          ~s|<:entry path="#" text="Support"/>|,
          ~s|<:entry path="#" text="License"/>|
        ]
      },
      %Variation{
        id: :primary_color,
        description: "A dropdown with primary color",
        attributes: %{
          text: "Primary",
          color: :primary
        },
        slots: [
          ~s|<:entry path="#" text="Account settings"/>|,
          ~s|<:entry path="#" text="Support"/>|,
          ~s|<:entry path="#" text="License"/>|
        ]
      }
    ]
  end
end
