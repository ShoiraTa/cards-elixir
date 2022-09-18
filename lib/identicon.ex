defmodule Iden do
  def main(input) do
    input
    |> to_hash
    |> pick_color
    |> build_grid
    |> filter_odd_squares
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

  def build_grid(%Iden.Image{hex: hex} = image) do
    grid =
      hex
      |> Enum.chunk(3)
      |> Enum.map(&mirror_row/1)
      |> List.flatten
      |> Enum.with_index
    %Iden.Image{image | grid: grid}
  end

  def filter_odd_squares(%Iden.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn ({code, _index}) ->
      rem(code, 2) == 0
    end

    %Iden.Image{image | grid: grid}
  end

  def mirror_row(row) do
    [first, second | _tail] = row
    row ++ [second, first]
  end


end
