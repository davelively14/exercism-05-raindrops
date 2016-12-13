defmodule Raindrops do
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @factors [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}]

  @spec convert(pos_integer) :: String.t
  def convert(number, factors \\ @factors), do: check_all(number, factors, "")

  def check_all(number, [], result) do
      if result == "", do: Integer.to_string(number), else: result
  end

  def check_all(number, [{prime, string} | tail], result) do
    if rem(number, prime) == 0 do
      check_all(number, tail, result <> string)
    else
      check_all(number, tail, result)
    end
  end

  # when rem(number, 3) == 0, do: "Pling"
  # def convert(number) when rem(number, 5) == 0, do: "Plang"
  # def convert(number) when rem(number, 7) == 0, do: "Plong"
  # def convert(number), do: number
end
