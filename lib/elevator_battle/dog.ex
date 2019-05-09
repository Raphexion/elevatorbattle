defmodule ElevatorBattle.Dog do
  require Logger

  def start(name) do
    spawn(fn -> loop(:bark, name) end)
  end

  def pet(dog) do
    send(dog, :pet)
  end

  def squirrel(dog) do
    send(dog, :squirrel)
  end

  def loop(:bark, name) do
    Logger.debug("#{name} barks")
    receive do
      :pet ->
	loop(:wag_tail, name)
      _ ->
	Logger.debug("#{name} looks confused")
	loop(:bark, name)
    end
  end

  def loop(:wag_tail, name) do
    Logger.debug("#{name} wags tail")
    receive do
      :pet ->
	loop(:sit, name)
      _ ->
	Logger.debug("#{name} looks confused")
	loop(:bark, name)
    after 2000 ->
	loop(:bark, name)
    end
  end

  def loop(:sit, name) do
    Logger.debug("#{name} sits")
    receive do
      :squirrel ->
	Logger.debug("#{name} sees squirrel")
	loop(:bark, name)
      _ ->
	Logger.debug("#{name} looks confused")
	loop(:bark, name)
    after 2000 ->
	loop(:bark, name)
    end
  end

end
