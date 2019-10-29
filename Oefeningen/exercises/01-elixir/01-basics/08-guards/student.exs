defmodule Numbers do
  def even?(n) do
    if is_number(n), do: rem(n,2) == 0, else: raise FunctionClauseError
  end
  def odd?(n) do
    if is_number(n), do: rem(n,2) != 0, else: raise FunctionClauseError
  end
end
