defmodule ShiftKeyIssueWeb.FooLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <a id="foo" phx-click="foo"><%= @label %></a>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, label: "Shift-click me")}
  end

  def handle_event("foo", %{"shiftKey" => true}, socket) do
    {:noreply, assign(socket, label: "Thank you")}
  end
end
