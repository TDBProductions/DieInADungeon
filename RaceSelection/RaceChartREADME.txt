This file is used for determining the race of a player.  The class is chosen first, then an eligible race is selected from this chart.

If you would like to ignore this chart and have the program freely choose a race, set the IgnoreRaceRestrictions flag in the GameOptions class to 1.
	26 > self.IgnoreRaceRestrictions = 1
Keeping this flag set to 0 will make the program read the chart when deciding character race.
	26 > self.IgnoreRaceRestrictions = 0

This chart is in the form as follows

	Human	Dwarf	Elf	Gnome	HalfElf	Halfling  HalfOrc
Fighter
Druid
Paladin
Cleric
Ranger
Thief
Wizard

A "1" in the box indicates that the race can be selected, a "0" indicates that the race is not available for selection.
