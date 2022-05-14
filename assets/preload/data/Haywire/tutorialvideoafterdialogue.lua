local playDialogue = true;
local playedVideo = true;
local allowCountdown = false
function onStartCountdown()
	if playDialogue and isStoryMode and not seenCutscene then -- Block the second countdown and start a timer of 0.8 seconds to play the dialogue
		playedVideo = false;
		playDialogue = false;
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;

		setProperty('camGame.zoom', 0.65);
		runTimer('startZoom', 0.75);
		runTimer('startDialogue', 2.75);
		return Function_Stop;
        elseif not playedVideo and isStoryMode and not seenCutscene then -- Block the first countdown and play video cutscene
		startVideo('testVideo');
		playDialogue = false;
		playedVideo = true;
		return Function_Stop;
	end
	return Function_Continue;
end

local fuck = 0

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue');
                playSound('w1d18');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
     fuck = fuck + 1
    if fuck == 2 then
      playSound('w1d19');
    elseif fuck == 4 then
      playSound('w1d20');
    elseif fuck == 6 then
      playSound('w1d21');
    elseif fuck == 7 then
      playSound('w1d22');
    elseif fuck == 9 then
      playSound('w1d23');
    elseif fuck == 11 then
      playSound('w1d24');
    elseif fuck == 14 then
      playSound('w1d25');
   end
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end