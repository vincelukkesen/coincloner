defmodule Util  do

  def range(a,b) when is_number(a) and a <= b, do: [a| range(a+1,b)]
  def range(a,b) when is_number(a), do: []
end
