require Logger
alias ElevatorBattle.Dog

dogs = [Dog.start("bengt"),
	Dog.start("arne")]

dogs
|> Enum.map(&Dog.pet/1)

dogs
|> Enum.map(&Dog.squirrel/1)

defmodule Receiver do
  def loop() do
    receive do
      msg ->
	Logger.warn("got: #{inspect msg}")
	loop()
    after 2000 ->
	Logger.debug("no more messages")
    end
  end
end

Receiver.loop()
