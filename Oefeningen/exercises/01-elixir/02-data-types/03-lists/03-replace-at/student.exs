defmodule Util do
  def replace_at([_|xs],0,y), do: [y|xs]
  def replace_at([x|xs], i, y) when i > 0, do: [x| replace_at(xs, i-1, y)]
end
