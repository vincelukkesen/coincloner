defmodule Cards do

  defp numericValues(:jack), do: 11;
  defp numericValues(:queen), do: 12;
  defp numericValues(:king), do: 13;
  defp numericValues(:ace), do: 14;
  defp numericValues(n) when is_number(n), do: n;

  def higher?(x,y), do: numericValues(x) > numericValues(y)

end
