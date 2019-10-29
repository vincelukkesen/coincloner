defmodule Numbers do
  def even?(n) do
    rem(n,2) == 0
  end
  def odd?(n) do
    rem(n,2) != 0
  end
end
