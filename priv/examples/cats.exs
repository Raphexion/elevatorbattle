require Logger
alias ElevatorBattle.Cat

cats = [Cat.start("hedda"),
	Cat.start("astrid")]

cats
|> Enum.map(&Cat.pet/1)

cats
|> Enum.map(&Cat.play_with/1)

cats
|> Enum.map(&Cat.laser/1)

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
