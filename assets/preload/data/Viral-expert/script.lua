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
                playSound('w1d8');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
      fuck = fuck + 1
    if fuck == 2 then
      playSound('w1d9');
    elseif fuck == 3 then
      playSound('w1d10');
    elseif fuck == 5 then
      playSound('w1d11');
    elseif fuck == 6 then
      playSound('w1d12');
    elseif fuck == 7 then
      playSound('w1d13');
    elseif fuck == 9 then
      playSound('w1d14');
    elseif fuck == 10 then
      playSound('w1d15');
    elseif fuck == 11 then
      playSound('w1d16');
    elseif fuck == 13 then
      playSound('w1d17');
   end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end