function onCreate()
     health = (getProperty('health') * 50); 
     Lives = 0
     makeLuaText('Lives', 'x ' .. Lives, 150, 1000, 620)
     addLuaText('Lives')
     setTextSize('Lives', 40)
     makeLuaSprite('heart','Life',950,600)
     setLuaSpriteScrollFactor('heart',0,0)
     addLuaSprite('heart',true)
     scaleObject('heart',0.3,0.3)
     setObjectCamera('heart', 'hud');
end

function onUpdate()
    health = (getProperty('health') * 50); 
    setTextString('Lives', 'x ' .. Lives)
  if health <= 5 and Lives >= 1 then
    setProperty('health', 1);
    Lives = Lives - 1
  end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
   if noteType == 'Lifenote' then
       Lives = Lives + 1
    end
end