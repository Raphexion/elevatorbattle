alias ElevatorBattle.Pingis

pinger = spawn(fn -> Pingis.ping() end)
ponger = spawn(Pingis, :pong, [])

send(ponger, {pinger, :ping})

IO.puts "Waiting"
:timer.sleep(5000)
send(pinger, :stop)
send(ponger, :stop)
