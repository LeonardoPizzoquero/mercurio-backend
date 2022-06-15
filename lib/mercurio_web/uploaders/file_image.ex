defmodule Mercurio.FileImage do
  use Waffle.Definition
  use Waffle.Ecto.Definition

  # Include ecto support (requires package waffle_ecto installed):
  # use Waffle.Ecto.Definition

  @versions [:original, :thumb]

  # Whitelist file extensions:
  def validate({file, _}) do
    file_extension = file.file_name |> Path.extname() |> String.downcase()

    case Enum.member?(~w(.jpg .jpeg .gif .png), file_extension) do
      true -> :ok
      false -> {:error, "invalid file type"}
    end
  end

  def filename(version, _) do
    version
  end

  def storage_dir(_, {_file, user}) do
    "uploads/avatars/#{user.id}"
  end
end
