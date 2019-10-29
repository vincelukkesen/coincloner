defmodule Exercise do
  def repeat(_,0),do: nil
  def repeat(f,n) do
    f.()
    repeat(f,n-1)
  end

  def say(_,0),do: nil
  def say(m,n) do
    IO.puts(m)
    say(m,n-1)
    :timer.sleep(10000)
  end
end

spawn( fn -> Exercise.say("foo",10) end )
spawn( fn -> Exercise.say("bar",10) end )
:timer.sleep(1000)
