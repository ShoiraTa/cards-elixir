defmodule Iden do
def main(input) do
  input
  |> to_hash
end

def to_hash(input) do
  :crypto.hash(:md5, input)
  |> :binary.bin_to_list
end
end
