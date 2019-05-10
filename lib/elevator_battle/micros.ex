defmodule ElevatorBattle.Micros do

  def inbox() do
    receive do
      msg ->
	IO.puts "#{inspect msg}"
    after 1000 ->
	IO.puts "no messages"
    end
  end

  # Try these two diffent version
  # alias ElevatorBattle.Micros
  # > spawn(fn -> Micros.die_soon() end)
  # > spawn_link(fn -> Micros.die_soon() end)
  def die_soon() do
    :timer.sleep(1000)
    die()
  end

  defp die() do
    1 / 0
  end
end
