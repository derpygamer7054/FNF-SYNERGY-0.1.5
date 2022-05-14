local allowCountdown = false
local fuck = 0
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'tea-time');
                playSound('w1d1');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
      fuck = fuck + 1
    if fuck == 2 then
      playSound('w1d2');
    elseif fuck == 4 then
      playSound('w1d3');
    elseif fuck == 6 then
      playSound('w1d4');
    elseif fuck == 7 then
      playSound('w1d5');
    elseif fuck == 9 then
      playSound('w1d6');
    elseif fuck == 11 then
      playSound('w1d7');
   end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end