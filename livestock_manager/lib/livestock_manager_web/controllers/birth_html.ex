defmodule LivestockManagerWeb.BirthHTML do
  use LivestockManagerWeb, :html

  embed_templates "birth_html/*"

  @doc """
  Renders a birth form.

  The form is defined in the template at
  birth_html/birth_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def birth_form(assigns)
end
