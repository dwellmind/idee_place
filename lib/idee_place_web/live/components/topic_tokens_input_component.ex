defmodule IdeePlaceWeb.TopicTokensInputComponent do
  use Phoenix.LiveComponent
  import Phoenix.HTML.Form

  @default_assigns %{
    label: nil,
    label_class: "",
    topics: []
  }

  def mount(socket) do
    assign_with_defaults =
      @default_assigns
      |> Map.merge(socket.assigns)
      |> Map.take(Map.keys(@default_assigns))

    {:ok, socket |> assign(assign_with_defaults)}
  end

  def render(assigns) do
    ~H"""
    <div class="mb-2">
      <%= if @label do %>
      <label class={@label_class}><%= @label %></label>
      <% end %>
      <div class="text-xl font-bold w-full p-1.5 border border-solid border-primary-300 rounded focus:outline-none">
        <%= for {topic, index} <- Enum.with_index(@topics) do %>
          <input type="text" hidden="true" name={"idea[topics][#{index}]"} value={topic.name}/>
          <div
            class= "inline-block select-none px-1 w-fit font-bold text-accent-500 hover:line-through focus:outline-none"
            phx-click="delete_topic"
            phx-value-topic_name={topic.name}
            phx-target={@myself}
          >
            #<%= topic.name %>
          </div>
        <% end %>
        <input
          class="w-fit px-1 text-primary-700 focus:outline-none"
          name="new_topic"
          type="text"
          autocomplete="off"
          phx-keydown="input_keypressed"
          onkeypress="if (event.keyCode == 13) return false;"
          phx-target={@myself}/>
      </div>
    </div>
    """
  end

  def handle_event("input_keypressed", %{"key" => key, "value" => value}, socket) do
    if value == "" do
      if key == "Backspace" do
        send self(), :delete_last_topic
      end
    else
      if key == "Enter" do
        if Enum.all?(socket.assigns.topics, fn topic -> topic.name != value end) do
          send self(), {:add_topic, value}
        end
      end
    end
    {:noreply, socket}
  end

  def handle_event("delete_topic", %{"topic_name" => topic_name}, socket) do
    send self(), {:delete_topic, topic_name}
    {:noreply, socket}
  end
end
