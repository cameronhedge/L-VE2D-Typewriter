-- TypeWriter CLASS THAT WILL RENDER TEXT TO THE SCREEN IN A TypeWriter STYLE, GIVEN A WIDTH IT WILL ALSO WRAP THE TEXT --
-- CREATED BY: C HEDGECOCK 2021 --

TypeWriter = Class{}

function TypeWriter:init(x, y, text, width, linespace, font)
  self.x = x or 0
  self.y = y or 0
  self.fullText = text
  self.width = width
  self.linespace = linespace or 0
  self.font = font or love.graphics.getFont()
    _, self.wrappedText = self.font:getWrap(self.fullText, self.width)
  self.text = {}
  for i = 1, #self.wrappedText do
    self.text[i] = {}
  end
  -- Keeping track of time and position --
  self.counter = 1
  self.row = 1
  self.timer = 0
  -- Delay times --
  self.defaultDelayTime = 0.05
  -- Table with delayCharacters defined along with their respective delay times --
  self.delayCharacter = {['.'] = 0.2, [','] = 0.2}
end

function TypeWriter:update(dt)
  -- Simple calculation with DT as a timer --
  self.timer = self.timer + dt
    -- Only repeat as many times as the string is long --
    if #self.text[self.row] == string.len(self.wrappedText[self.row]) then
     self.row = math.min(self.row + 1, #self.wrappedText)
    end
    for i = 1, string.len(self.fullText) do
        -- Sets the current letter at the position 'counter' in the string --
        local currentLetter = string.sub(self.fullText, self.counter, self.counter)
        local waitTime = self.defaultDelayTime
        -- Checks if the current letter is a delayCharacter as defined in the delayCharacter table then sets relevant delay time --
        for i, c in pairs(self.delayCharacter) do
          if currentLetter == i then
            waitTime = c
          end
        end
        -- Each time the timer reaches the set waitTime then the next table entry is added as that letter --
        if self.timer > waitTime then
          table.insert(self.text[self.row], currentLetter)
          self.counter = self.counter + 1
          self.timer = 0
        end
    end
end

function TypeWriter:render()
  -- Prints the current TypeWriter text --
  for row, text in pairs(self.text) do
    love.graphics.setFont(self.font)
    love.graphics.print(text, self.x, self.y + ((row - 1) * self.linespace))
  end
end
