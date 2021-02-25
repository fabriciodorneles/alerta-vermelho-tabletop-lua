
-- deck = callLuaFunctionInOtherScriptWithParams(Global,'getDeck()')
-- deck = getObjectFromGUID('aed76c')

function setupCards()
    -- deck = Global.call("getDeck",eggMonsterDeckZone)
    print ( deck )
    deck.randomize()
    local buttonPos = self.getPosition()
    local xPos = buttonPos[1] + 3
    for i = 1, 5 do
        deck.takeObject({flip = true, position = {xPos, buttonPos[2], buttonPos[3]}})
        xPos = xPos +3    
    end
end