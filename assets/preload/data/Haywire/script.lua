local allowEndShit = false

function onEndSong()
 if not allowEndShit and isStoryMode and not seenCutscene then
  setProperty('inCutscene', true);
  allowEndShit = true;
  startDialogue('dialogue2');
  return Function_Stop;
 end
 return Function_Continue;
end