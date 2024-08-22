--[[
Boltheads: The Digital Trading Card Game
]]

GAME = {
  players = {}, --player array
  playspace = {},
  turn = 0,
  phase = 0,
  rsa = {} -- rule setting abilites
}

--Player constructing stuff

PLAYER = {}
PLAYER.__index = PLAYER

function PLAYER.new()
  local instance = setmetatable({}, PLAYER)
  table.insert(GAME.players, instance)
  return #GAME.players
end