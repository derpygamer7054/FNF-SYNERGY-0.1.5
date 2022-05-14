local healthDrop = 0;
local FUCKYOU = 0;

function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'glitchnote' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'glitchnote_assets');
                        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'nothing');

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'healnote' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'HPnote');
                        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'nothing');

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

function onUpdate()
    setProperty('health', getProperty('health') - healthDrop); 
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'glitchnote' then
		healthDrop = healthDrop + 0.000075;
                makeLuaSprite('flash', 'red', -500, -500);
                scaleObject('flash', 200, 150);
		setLuaSpriteScrollFactor('flash', 0, 0);
                doTweenAlpha('flash', 'flash', 0, 1, 'linear')
		addLuaSprite('flash', true);
		runTimer('flashaway', 1)
		if healthDrop == 0.000075 then
			runTimer('BITCHLMAO', 0.1 , 1);
                        playSound('fuzz', 0.6);
		triggerEvent('Play Animation', 'hurt', 'boyfriend')
		else 
			FUCKYOU = 0;
                        runTimer('BITCHLMAO', 0.1 , 1);
                        playSound('fuzz', 0.6);
		triggerEvent('Play Animation', 'hurt', 'boyfriend')
		end
    end
    if noteType == 'healnote' then
		healthDrop = 0;
		triggerEvent('Play Animation', 'cheer', 'girlfriend')
		playSound('happyMeal', 0.6);
    end
end

function onTimerCompleted(tag, loops, loopsLeft) 
	if name == 'flashaway' then
		removeLuaSprite('flash', true)
	end
end