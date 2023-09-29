state("Game")
{
	// race_finish becomes 1 as soon as you see/hear "You win" on screen
	int race_finish : 0x52D78, 0xC;
	// this one becomes 1 during loading screen
	int in_race : 0xD06CC, 0x01AF6848;
	// this one becomes 1 after loading screen and race starts
	int in_race_two : 0x68F7C, 0x25C;
	// this one becomes 1 whenever you're in the menu screen
	int in_menu : 0x47240, 0x4C;
}

init
{
	print("init");
}

startup
{
	print("startup");
}

start
{
	if (current.in_menu != old.in_menu && current.in_menu == 0 && current.in_race == 0)
	{
		return true;
	}
}

split
{
	if (current.race_finish != old.race_finish && current.race_finish == 1 && current.in_race == 1)
	{
		return true;
	}
}

isLoading
{
	if (current.in_menu == 0 && current.in_race_two == 0)
	{
		return true;
	}
	else  
	{
		return false;
	}

}