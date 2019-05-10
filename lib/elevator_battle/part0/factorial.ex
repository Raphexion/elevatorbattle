defmodule ElevatorBattle.Part0.Factorial do

  defmodule NonTailCall do
    def calc(0) do
      1
    end

    def calc(n) do
      n * calc(n-1)
    end
  end

  defmodule TailCall do

    def calc(n) do
      calc(n, 1)
    end

    defp calc(0, prod) do
      prod
    end
    defp calc(n, prod) do
      calc(n-1, n*prod)
    end
  end
end
