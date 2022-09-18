defmodule Iden do
  def main(input) do
    input
    |> to_hash
    |> pick_color
  end

  def to_hash(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %Iden.Image{hex: hex}
  end
  def pick_color(image) do
    %Iden.Image{hex: hex_list} = image
    # %Iden.Image{hex:  [r, g, b | _tail] } = image
    [r, g, b | _tail] = hex_list
    %Iden.Image{image | color: {r,g,b}}



  end
end
