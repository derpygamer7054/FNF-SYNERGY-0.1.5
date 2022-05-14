function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-pixel-dead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Deadlol'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end

function onGameOver()

    setProperty('health', -500);

    playSound('lmao')

end