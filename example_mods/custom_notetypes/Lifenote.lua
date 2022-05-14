function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Lifenote' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Lifenote');
                        setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'nothing');

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Lifenote' then
		characterPlayAnim('girlfriend', 'cheer', true);
		playSound('happyMeal', 0.6);
    end
end