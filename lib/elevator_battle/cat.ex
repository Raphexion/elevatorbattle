defmodule ElevatorBattle.Cat do
  require Logger

  def start(name) do
    spawn(fn -> loop(:dont_give_crap, name) end)
  end

  def pet(cat) do
    ref = make_ref()
    send(cat, {self(), ref, :pet})
  end

  def play_with(cat) do
    ref = make_ref()
    send(cat, {self(), ref, :play_with})
  end

  def laser(cat) do
    ref = make_ref()
    send(cat, {self(), ref, :laser})
  end

  defp loop(:dont_give_crap, name) do
    Logger.debug("#{name} don't give a crap")
    receive do
      {pid, ref, :laser} ->
	send(pid, {ref, :going_crazy})
	loop(:go_crazy, name)
      {pid, ref, _msg} ->
	send(pid, {ref, :meh})
	loop(:dont_give_crap, name)
    end
  end

  defp loop(:go_crazy, name) do
    Logger.debug("#{name} is going crazy for the laser")
    :timer.sleep(5000)
    loop(:dont_give_crap, name)
  end

  defp loop(what, name) do
    Logger.error("#{name} got #{inspect what}")
  end
end
