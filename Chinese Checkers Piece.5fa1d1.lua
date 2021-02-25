function putBackEggs()
    zone = getObjectFromGUID('2f06b0')
    zoneObjects = zone.getObjects()
    deck = Global.call("getDeck")
    for i = 1, 5 do
        deck.putObject(zoneObjects[i])
    end    
end