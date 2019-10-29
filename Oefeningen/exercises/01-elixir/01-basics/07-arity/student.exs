defmodule Numbers do
  def maximum(a,b) do
    if a > b, do: a, else: b
  end
  def maximum(a,b,c) do
    if maximum(a,b) > c, do: maximum(a,b), else: c
  end
  def maximum(a,b,c,d) do
    if maximum(a,b,c) > d, do: maximum(a,b,c), else: d
  end
end
