defmodule ElevatorBattle.Pingis do
  require Logger

  @wait 1000

  def pong() do
    :timer.sleep(@wait)

    receive do
      {pinger, :ping} ->
	Logger.debug("got ping")
	send(pinger, {self(), :pong})
	pong()

      :stop ->
	Logger.debug("stop playing")
    end
  end

  def ping() do
    :timer.sleep(@wait)

    receive do
      {ponger, :pong} ->
	Logger.debug("got pong")
	send(ponger, {self(), :ping})
	ping()

      :stop ->
	Logger.debug("stop playing")
    end
  end
end
