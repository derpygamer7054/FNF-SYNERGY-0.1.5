function onCreate()
	-- background shit
    makeLuaSprite('foreground', 'minecraff', -600, -300);
	setScrollFactor('foreground', 0.9, 0.9);

	addLuaSprite('foreground', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end