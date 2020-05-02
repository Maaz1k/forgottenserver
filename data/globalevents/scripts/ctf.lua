function onTime()
     captureTheFlag.close()
     captureTheFlag.start()
     addEvent(captureTheFlag.round, 10*60*1000)
     broadcastMessage("Capture the Flag event will start in 10 minutes, entrance in Event Room.", MESSAGE_STATUS_WARNING)
     addEvent(broadcastMessage, 5 * 60 * 1000, "Capture the Flag event will start in 5 minutes, entrance in Event Room.", MESSAGE_STATUS_WARNING)
     addEvent(broadcastMessage, 8 * 60 * 1000, "Capture the Flag event will start in 2 minutes, entrance in Event Room .", MESSAGE_STATUS_WARNING)
end