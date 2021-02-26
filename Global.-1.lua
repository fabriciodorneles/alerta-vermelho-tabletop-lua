ponte1 = { -17.4, 1.38, 13.47 }
ponte2 = { 7.5, 1.38, 13.86 }
computador = { -23.3,1.36, 2.32 }
cozinha = { -2.98, 1.36, 3.85 }
refeitorio = { 6.69, 1.36, 3.94 }
sensor1 = { -34.84, 1.36, -0.97 }
sensor2 = { 15, 1.36, 13.83 }
sensor3 = { 15, 1.36, -15.42 }
ambulatorio = { 6.35, 1.36, -5.72 }
manutencao1 = {-12.9, 1.36, -5.97 }
manutencao2 = {25.69, 1.36, 0.013}
cabComandante = {-24.2, 1.36, 7.72}
recreacao = {19.9, 1.36, 8.63}
reatores = {35.0, 1.36, 2.59}
cabOficiais = {-17.16, 1.36, 3.95}
congelamento = {-21.31, 1.36, -4.74}
salaReuniao = {-12.16, 1.36, 3.58}
despensa = {1.20, 1.36, 7.88}
refeitorio = {6.78, 1.36, 4.46}
cozinha = {-2.92, 1.36, 4.12}
enfermaria = {12.37, 1.36, -4.77}
cabTripulacao1 = {-29.64, 1.36, 3.37}
cabTripulacao2 = {14.26, 1.36, -8.99}
cabTripulacao3 = {19.86, 1.36, -11.33}

BOARD_ZONE = "8df471"
EGG_MONSTER_POOL_ZONE = "f8619f"
BABY_MONSTER_POOL_ZONE = "266f7b"
ADULT_MONSTER_POOL_ZONE = "7b6e54"
FRAGMENT_MONSTER_POOL_ZONE = "52b551"
BOARD_ZONE = "8df471"

function onLoad()
      boardZone = getObjectFromGUID(BOARD_ZONE)
      eggMonsterZone = getObjectFromGUID(EGG_MONSTER_POOL_ZONE)
      babyMonsterZone = getObjectFromGUID(BABY_MONSTER_POOL_ZONE)
      adultMonsterZone = getObjectFromGUID(ADULT_MONSTER_POOL_ZONE)
end


function getDeck(zone)
      local zoneObjects = zone.getObjects()
      for _, item in ipairs(zoneObjects) do
            if item.tag == 'Deck' then
                  return item
            end 
      end
      for _, item in ipairs(zoneObjects) do
            if item.tag == 'Card' then
                  return item
            end 
      end
      return nil
end

function deckExists(zone)
      return getDeck(zone) != nil
end


function growBabies()

      print('Grow Babies!')
      local babyDeck = getDeck(babyMonsterZone)
      local adultDeck = getDeck(adultMonsterZone)
      local adultQuantity = 0
      if adultDeck != nil then            
            adultQuantity = adultDeck.getQuantity()
      end
      local limitCounter = 0
      boardObjects = boardZone.getObjects()

      for i=1, #boardObjects do
            if boardObjects[i].hasTag('Monster') and boardObjects[i].hasTag('Baby') and limitCounter < adultQuantity then
                  limitCounter = limitCounter + 1
                  local tempPos = boardObjects[i].getPosition()
                  adultDeck.takeObject({flip = true, position = tempPos})
                  babyDeck.putObject(boardObjects[i])
            end 
      end


end

function onChat()
    getDeck(eggMonsterZone).deal(1,"White")
end

function onObjectPickUp(player_color,picked_up_object)
    print ( picked_up_object.getPosition() )
    if  picked_up_object.getPosition()[3] > 26.0 then
          nome = picked_up_object.getName()
          if nome == 'Comandante'  or nome == 'Imediato' or nome == 'Navegador' then
                Player[player_color].pingTable( ponte1 )
                Player[player_color].pingTable( ponte2 )
          elseif nome == 'Of.Comun.' then
                Player[player_color].pingTable( ponte1 )
                Player[player_color].pingTable( ponte2 )
                Player[player_color].pingTable( computador )
          elseif nome == 'Of.Oper.' then
                Player[player_color].pingTable( congelamento )
                Player[player_color].pingTable( cabOficiais )
          elseif nome == 'Of.Eng.' then
                Player[player_color].pingTable( reatores )
                Player[player_color].pingTable( recreacao )
          elseif nome == 'Of.Suprim.' then
                Player[player_color].pingTable( salaReuniao )
                Player[player_color].pingTable( despensa )
          elseif nome == 'Doutor' then
                Player[player_color].pingTable( ambulatorio )
                Player[player_color].pingTable( recreacao )
          elseif nome == 'Cabo' then
                Player[player_color].pingTable( ponte1 )
                Player[player_color].pingTable( ponte2 )
                Player[player_color].pingTable( recreacao )
          elseif nome == 'Ajudante.1' or nome == 'Ajudante.2' then
                Player[player_color].pingTable( recreacao )
                Player[player_color].pingTable( ambulatorio )
          elseif nome == 'Sargento' then
                Player[player_color].pingTable( recreacao )
                Player[player_color].pingTable( refeitorio )
          elseif nome == 'Cozinheiro' then
                Player[player_color].pingTable( cozinha )
                Player[player_color].pingTable( salaReuniao )
          elseif nome == 'Enfermeiro' then
                Player[player_color].pingTable( ambulatorio )
                Player[player_color].pingTable( enfermaria )
          elseif nome == 'Tecnico' then
                Player[player_color].pingTable( sensor1 )
                Player[player_color].pingTable( sensor2 )
                Player[player_color].pingTable( sensor3 )
          elseif nome == 'Engenheiro' then
                Player[player_color].pingTable( reatores )
                Player[player_color].pingTable( manutencao1 )
                Player[player_color].pingTable( manutencao2 )
          elseif nome == 'Mecanico' then
                Player[player_color].pingTable( recreacao )
                Player[player_color].pingTable( manutencao1 )
                Player[player_color].pingTable( manutencao2 )
          elseif nome == 'Relator' then
                Player[player_color].pingTable( refeitorio )
                Player[player_color].pingTable( ambulatorio )
          elseif nome == 'Piloto' or nome == 'Co-piloto' then
                Player[player_color].pingTable( ponte1 )
                Player[player_color].pingTable( ponte2 )
                Player[player_color].pingTable( cabTripulacao1 )
                Player[player_color].pingTable( cabTripulacao2 )
                Player[player_color].pingTable( cabTripulacao3 )
          elseif nome == 'Robo' then
                Player[player_color].pingTable( manutencao1 )
                Player[player_color].pingTable( manutencao2 )
          elseif nome == 'Mascote' then
                Player[dplayer_color].pingTable( cabComandante )
          end
    end
end
