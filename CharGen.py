#!/bin/python
#
#

import random
import copy
import csv


class GameOptions:
    def __init__(self):
        # Number of cleric spells to be added to the player's spell lists by level [ Level 1, 2, 3, 4, 5, 6, 7 ]
        # Consider these advanced options.  Edit at your own risk.
        self.ClericSpellsByLevel = [3,3,1,0,0,0,0]
        self.ClericSpellsByPlayerLevel = [ [1,0,0,0,0,0,0],[1,0,0,0,0,0,0],[0,1,0,0,0,0,0],[1,1,0,0,0,0,0],[0,1,1,0,0,0,0]]
        self.DruidSpellsByLevel = [4,3,2,0,0,0,0]
        self.DruidSpellsByPlayerLevel = [ [2,0,0,0,0,0,0],[0,1,0,0,0,0,0],[1,1,1,0,0,0,0],[1,0,1,0,0,0,0],[0,1,0,0,0,0,0] ]
        self.WizardSpellsByLevel = [4,2,1,0,0,0,0,0,0]
        self.WizardSpellsByPlayerLevel = [ [1,0,0,0,0,0,0,0,0],[1,0,0,0,0,0,0,0,0],[0,1,0,0,0,0,0,0,0],[1,1,0,0,0,0,0,0,0],[1,0,1,0,0,0,0,0,0] ]
        # Minimum total score, otherwise reroll stats
        self.MinReroll = 35
        self.EnforceStats = True
        # Number of characters to be generated
        self.CharactersGenerated = 15
        # Character generation weights - [Fighter,Cleric,Wizard,Thief,Druid,Paladin,Ranger]
        self.ClassWeight = [7,7,7,7,1,1,1]
        # Ignore the race restrictions when assigning classes.  0 to keep restrictions, 1 to disable
        self.IgnoreRaceRestrictions = 0

class Character:
    def __init__(self, GameOptions):
        # Get stats.  Returns a list by [STR CON INT WIS DEX CHA]
        RollStatsArray = rollStats(GameOptions)
        self.STR = RollStatsArray[0]
        self.CON = RollStatsArray[1]
        self.INT = RollStatsArray[2]
        self.WIS = RollStatsArray[3]
        self.DEX = RollStatsArray[4]
        self.CHA = RollStatsArray[5]

        # Slot for spells, will be empty on non-caster classes    
        self.SpellList = []

        #Slots for Resistance
        self.CharPoisonRes = []
        self.CharPetrifyRes = []
        self.CharWandRes = []
        self.CharBreathRes = []
        self.CharSpellRes = []

        # Get character class
        CharacterClass = getClass(self, GameOptions)
        self.Class = CharacterClass

        # Get the character race
        CharacterRace = getRace(self, GameOptions)
        self.Race = CharacterRace

        # Adjust stats for strength
        getSTRAdjustments(self)

        # if character is a thief, adjust the thief stats according to race and dex score
        if(self.Class.classString == "Thief"):
            getDEXThiefAdjustments(self)

        # If character is a cleric, get the cleric spells
        # Paladins roll from Cleric spells, future modders: take note
        if(self.Class.classString == "Cleric"):
            self.SpellList = getClericSpells(self, GameOptions)

        # If character is a druid, get the druid spells
        if(self.Class.classString == "Druid"):
            self.SpellList = getDruidSpells(self, GameOptions)
    
        # If character is a wizard, get wizard spells
        if(self.Class.classString == "Wizard"):
            self.SpellList = getWizardSpells(self, GameOptions)

        # Get inventory, weapon and armor
        self.Inventory = Inventory(self, GameOptions)
        # Adjust for armor AC
        armAC = self.Inventory.ArmorAC
        # Adjust for weapon AC (if weapon rolled has a shield)
        wepAC = self.Inventory.WeapAC

        # Put into variables, AC values come out of CSV as strings
        self.armAC = int(armAC)
        self.shieldAC = int(wepAC)
        
        # Adjust for Dexterity
        self.dexAC = getDEXAdjustments(self)
        
        # Get the "fluff" stuff: Name, Age, Gender, Weight, Height, Alignment.  Useful for RolePlaying, not so much for gameplay.
        self.Characteristics = FluffStuff(self,GameOptions)
        
        # Assign the AC stats
        self.AC = 10 + self.armAC + self.shieldAC + self.dexAC

class FluffStuff:
    def __init__(self, Character, GameOptions):
        self.Name = self.getName()
        self.Age = self.getAge(Character)
        self.Gender = self.getGender()
        returnWeightHeight = self.getHeight(Character)
        self.Weight = returnWeightHeight[1]
        self.Height = returnWeightHeight[0]
        self.Align = self.getAlign(Character)

    def getAlign(self, Character):
        # Import class
        Class = Character.Class.classString
        Align = ""

        # Lists filled with valid alignments.  Add to these lists for modding
        ClericAlign = ["Chaotic Good","Neutral Good","Lawful Good","Chaotic Neutral","Lawful Neutral","Chaotic Evil","Neutral Evil","Lawful Evil"]
        DruidAlign = ["Neutral"]
        FighterAlign = ["Chaotic Good","Neutral Good","Lawful Good","Chaotic Neutral","Neutral","Lawful Neutral","Chaotic Evil","Neutral Evil","Lawful Evil"]
        PaladinAlign = ["Lawful Good"]
        RangerAlign = ["Chaotic Good","Neutral Good","Lawful Good"]
        ThiefAlign = ["Neutral Good","Chaotic Neutral","Neutral","Lawful Neutral","Chaotic Evil","Neutral Evil","Lawful Evil"]
        WizardAlign = ["Chaotic Good","Neutral Good","Lawful Good","Chaotic Neutral","Neutral","Lawful Neutral","Chaotic Evil","Neutral Evil","Lawful Evil"]

        if (Class == "Cleric"):
            rollDice = random.randint(0,len(ClericAlign)-1)
            Align = ClericAlign.pop(rollDice)

        if (Class == "Druid"):
            rollDice = random.randint(0,len(DruidAlign)-1)
            Align = DruidAlign.pop(rollDice)        

        if (Class == "Fighter"):
            rollDice = random.randint(0,len(FighterAlign)-1)
            Align = FighterAlign.pop(rollDice)

        if (Class == "Paladin"):
            rollDice = random.randint(0,len(PaladinAlign)-1)
            Align = PaladinAlign.pop(rollDice)

        if (Class == "Ranger"):
            rollDice = random.randint(0,len(RangerAlign)-1)
            Align = RangerAlign.pop(rollDice)

        if (Class == "Thief"):
            rollDice = random.randint(0,len(ThiefAlign)-1)
            Align = ThiefAlign.pop(rollDice)

        if (Class == "Wizard"):
            rollDice = random.randint(0,len(WizardAlign)-1)
            Align = WizardAlign.pop(rollDice)


        return Align

    def getHeight(self, Character):
        Race = Character.Race.raceString
        Gender = self.Gender
        heightMod = 0
        weightMod = 0    
    
        HeightWeightList = []
        # Get height.  Done by race and gender.
        # Open up the height and weight file

        with open('HeightWeight/HeightWeight.csv',encoding='windows-1252') as f:
            HeightWeightObject = csv.reader(f,delimiter='|')
            for row in HeightWeightObject:
                HeightWeightList.append(row)

        # Kind of complicated.  
        # RaceGenderRow comes in as [Race,Gender,H Lower Roll,H Upper Roll,UnderHeight Lower,UnderHeight Upper,OverHeight Lower, OverHeight Upper, W Lower Roll, W Upper Roll, UnderWeight Lower, UnderWeight Upper, OverHeight Lower, OverHeight Upper, Height Base, Weight Base]
        # How this works is to match the race and then the gender of the character to the imported list. 
        for RaceGenderRow in HeightWeightList:
            # Match character race
            if RaceGenderRow[0] == Race:
                # Match character gender
                if RaceGenderRow[1] == Gender:
                    # Once a match is found, roll a dice 1-100
                    rollDice = random.randint(1,100)
                    # If dice roll is under the Height Lower Roll, character is shorter than average
                    if rollDice <= (int(RaceGenderRow[2]) - 1):
                        # Assign the height mod a random number from the chart in the range.  This needs to be a negative number to subtract from the base
                        heightMod = 0 - random.randint(int(RaceGenderRow[4]),int(RaceGenderRow[5]))
                    # If the dice roll is above the Height Lower Roll but under the Height Upper Roll, character is average height
                    if rollDice >= int(RaceGenderRow[2]) and rollDice <= int(RaceGenderRow[3]):
                        # Assign a 0 to height mod, character will get base height
                        heightMod = 0
                    # If the dice roll is above the Height Upper Roll, character is taller than average
                    if rollDice >= (int(RaceGenderRow[2]) + 1):
                        # Roll a dice assigned from taken from the chart and assign it as the height mod
                        heightMod = random.randint(int(RaceGenderRow[6]),int(RaceGenderRow[7]))
                    
                    # Repeat process with weight
                    rollDice = random.randint(1,100)
                    if rollDice <= int(RaceGenderRow[8]) - 1:
                        weightMod = 0 - random.randint(int(RaceGenderRow[10]),int(RaceGenderRow[11]))
                    if rollDice >= int(RaceGenderRow[8]) and rollDice <= int(RaceGenderRow[9]):
                        weightMod = 0
                    if rollDice >= int(RaceGenderRow[9]) + 1:
                        weightMod = random.randint(int(RaceGenderRow[12]),int(RaceGenderRow[13]))
        
                    # Add the height and weight mod to the base to get a final weight and height
                    height = int(RaceGenderRow[14]) + heightMod
                    weight = int(RaceGenderRow[15]) + weightMod
        # Return
        return [height,weight]

    def getGender(self):
        Gender = ""

        RollDice = random.randint(0,1)
        if RollDice == 0:
            Gender = "Male"
        else:
            Gender = "Female"

        return Gender

    def getAge(self, Character):
        Class = Character.Class.classString
        Race = Character.Race.raceString
        Sum = 0
        Age = 0

        # Get age by Race and Class.  Rolls are hardcoded: again, not the best way to do it, but eh

        if Race == "Dwarf":
            if Class == "Fighter":
                for i in range(0,4):
                    Sum = Sum + random.randint(1,10)
                Age = 40 + Sum
            
            if Class == "Thief":
                for i in range(0,2):
                    Sum = Sum + random.randint(1,6)
                Age = 75 + Sum

        if Race == "Elf":
            if Class == "Wizard":
                for i in range(0,4):
                    Sum = Sum + random.randint(1,6)
                Age = 150 + Sum

            if Class == "Thief":
                for i in range(0,4):
                    Sum = Sum + random.randint(1,6)
                Age = 100 + Sum

            if Class == "Fighter":
                for i in range(0,4):
                    Sum = Sum + random.randint(1,6)
                Age = 130 + Sum
    
        if Race == "Gnome":
            if Class == "Fighter":
                for i in range(0,4):
                    Sum = Sum + random.randint(1,4)
                Age = 60 + Sum
    
            if Class == "Thief":
                for i in range(0,4):
                    Sum = Sum + random.randint(1,4)
                Age = 80 + Sum

        if Race == "Half-Elf":
            if Class == "Cleric":
                for i in range(0,1):    
                    Sum = Sum + random.randint(1,4)
                Age = 40 + Sum    

            if Class == "Druid" or Class == "Wizard":
                for i in range(0,1):
                    Sum = Sum + random.randint(1,8)
                Age = 30 + Sum

            if Class == "Fighter" or Class == "Ranger":
                for i in range(0,2):
                    Sum = Sum + random.randint(1,4)
                Age = 22 + Sum

            if Class == "Thief":
                for i in range(0,2):
                    Sum = Sum + random.randint(1,8)
                Age = 22 + Sum

        if Race == "Halfling":
            if Class == "Fighter":
                for i in range(0,2):
                    Sum = Sum + random.randint(1,4)
                Age = 20 + Sum

            if Class == "Thief":
                for i in range(0,1):
                    Sum = Sum + random.randint(1,4)
                Age = 40 + Sum
        
        if Race == "Half-Orc":
            if Class == "Cleric":
                Sum = random.randint(1,4)
                Age = 20 + Sum
    
            if Class == "Fighter":
                Sum = random.randint(1,4)
                Age = 13 + Sum

            if Class == "Thief":
                for i in range(0,1):
                    Sum = Sum + random.randint(1,4)
                Age = 20 + Sum

        if Race == "Human":
            if Class == "Cleric":
                Sum = random.randint(1,4)
                Age = 18 + Sum        

            if Class == "Druid":
                Sum = random.randint(1,4)
                Age = 18 + Sum

            if Class == "Fighter":
                Sum = random.randint(1,4)
                Age = 15 + Sum

            if Class == "Paladin":
                Sum = random.randint(1,4)
                Age = 17 + Sum            

            if Class == "Ranger":
                Sum = random.randint(1,4)
                Age = 20 + Sum

            if Class == "Thief":
                Sum = random.randint(1,4)
                Age = 18 + Sum

            if Class == "Wizard":
                for i in range(0,1):
                    Sum = Sum + random.randint(1,8)
                Age = 24 + Sum
    
        return Age

    def getName(self):
        NameList = []

        # Names are imported from a CSV I found online.  Add to the CSV to add names.

        # Open the CSV for reading.
        with open("FluffStuff/Names.csv") as f:
            NameCSV = csv.reader(f, delimiter='|')
            for row in NameCSV:
                NameList.append(row)

        # roll for a first name and a last name
        RollDice = random.randint(0,len(NameList)-1)
        RollDice2 = random.randint(0,len(NameList)-1)
        
        # Add the names to variables, combine, and return
        firstName = str(NameList[RollDice]).replace("']","").replace("['","")
        lastName = str(NameList[RollDice2]).replace("']","").replace("['","")

        Name = firstName + " " + lastName
        return Name

# Character Classes
class Fighter:
    def __init__(self, Character):
        # Set the class string.  Used elsewhere for differentiating classes
        self.classString = "Fighter"
        # THAC0, a DND1 stat.  Hardcoded :(
        self.THAC0 = [20, 20, 18, 18, 16]
        
        # Roll for HP
        returnHP = self.getHP()
        self.HP = returnHP

        # Class saves.  The lower the better.  Hardcoded :(
        Character.CharPoisonRes = [14,14,13,13,11]
        Character.CharPetrifyRes = [15,15,14,14,12]
        Character.CharWandRes = [16,16,15,15,13]
        Character.CharBreathRes = [17,17,16,16,13]
        Character.CharSpellRes = [17,17,16,16,14]
        
        # Fighters dont get class features
        self.classFeatures = []
        self.classFeaturesPointer = "Features/FighterClassFeatures.csv"

    def getHP(self):
        # Set empty HP list and other vars
        HP = [0,0,0,0,0]
        Sum = 0
        rollDice = 0

        # Roll according to table from book.  Hardcoded :(
        for i in range(0,5):
            rollDice = random.randint(1,10)
            Sum = Sum + rollDice
            HP[i] = Sum
        return HP

class Ranger:
    def __init__(self, Character):

        # Set the class string.  Used elsewhere for differentiating classes
        self.classString = "Ranger"
        self.THAC0 = [20, 20, 18, 18, 16]
        
        # For the rest of these, see the Fighter comments.  
        returnHP = self.getHP()
        self.HP = returnHP

        Character.CharPoisonRes = [12,12,11,11,9]
        Character.CharPetrifyRes = [13,13,12,12,10]
        Character.CharWandRes = [14,14,13,13,11]
        Character.CharBreathRes = [15,15,14,14,11]
        Character.CharSpellRes = [15,15,14,14,12]

        # Class features Saved as a list for XML processing
        self.classFeatures = ['- You are a HUNTER OF GIANTS. You deal BONUS DAMAGE to GIANT MONSTERS. This bonus is +1 per level you have attained, in addition to any other bonuses.','- You are an EXPERT TRACKER. You can follow the trail of any person or monster.']
        self.classFeaturesPointer = "Features/RangerClassFeatures.csv"

    def getHP(self):
        HP = [0,0,0,0,0]
        Sum = 0
        rollDice = 0

        rollDice1 = random.randint(1,8)
        for i in range(0,5):
            rollDice = random.randint(1,8)
            Sum = Sum + rollDice + rollDice1
            rollDice1 = 0
            HP[i] = Sum
        return HP

class Paladin:
    def __init__(self, Character):
        self.classString = "Paladin"
        self.THAC0 = [20, 20, 18, 18, 16]
        
        returnHP = self.getHP()
        self.HP = returnHP

        Character.CharPoisonRes = [12,12,11,11,9]
        Character.CharPetrifyRes = [13,13,12,12,10]
        Character.CharWandRes = [14,14,13,13,11]
        Character.CharBreathRes = [15,15,14,14,11]
        Character.CharSpellRes = [15,15,14,14,12]
            
        #self.classFeatures = ['- You are A CHAMPION OF GOOD. If you CONCENTRATE, you can DETECT EVIL up to 60� around you. The DM will tell you approximately where any EVIL INFLUENCES are.','- You are A TRUE KNIGHT. If you LAY HANDS on a wounded person, they regain 2 HIT POINTS per LEVEL you have achieved. Also, you may CURE a person�s DISEASE completely. Each of these effects may only be used once.','- You are SWORN TO A RIGHTEOUS OATH. If you exhibit SINFUL GREED or commit EVIL DEEDS, you lose all PALADIN FEATURES immediately. Change your CLASS to OATHBREAKER, and henceforth take a -2 penalty to your SAVING THROWS. Your DM will tell you when you have crossed the line.']
        self.ClassFeaturesPointer = "Features/PaladinClassFeatures.csv"

    def getHP(self):
        HP = [0,0,0,0,0]
        Sum = 0
        rollDice = 0

        for i in range(0,5):
            rollDice = random.randint(1,10)
            Sum = Sum + rollDice
            HP[i] = Sum
        return HP

class Cleric:
    def __init__(self, Character):
        self.classString = "Cleric"
        self.THAC0 = [20, 20, 18, 18, 18]

        returnHP = self.getHP()
        self.HP = returnHP

        Character.CharPoisonRes = [10,10,10,9,9]
        Character.CharPetrifyRes = [13,13,13,12,12]
        Character.CharWandRes = [14,14,14,13,13]
        Character.CharBreathRes = [16,16,16,15,15]
        Character.CharSpellRes = [15,15,15,14,14]

        self.classFeatures = ['- You are AN EMPTY VESSEL, EMPOWERED BY YOUR GOD and can cast divine spells. See your SPELL REFERENCE SHEET for details.','- You CANNOT SPILL BLOOD. You cannot use EDGED or PIERCING weapons, but are more than welcome to BLUDGEON your enemies.','- You are HATED AND FEARED by THE UNDEAD. If you stand and REBUKE them, they might run away.']
        self.classFeaturesPointer = "Features/ClericClassFeatures.csv"
    
    def getHP(self):
        HP = [0,0,0,0,0]
        Sum = 0
        rollDice = 0

        for i in range(0,5):
            rollDice = random.randint(1,8)
            Sum = Sum + rollDice
            HP[i] = Sum
        return HP

class Druid:
    def __init__(self, Character):
        self.classString = "Druid"
        self.THAC0 = [20, 20, 18, 18, 18]

        returnHP = self.getHP()
        self.HP = returnHP

        Character.CharPoisonRes = [10,10,10,9,9]
        Character.CharPetrifyRes = [13,13,13,12,12]
        Character.CharWandRes = [14,14,14,13,13]
        Character.CharBreathRes = [16,16,16,15,15]
        Character.CharSpellRes = [15,15,15,14,14]
        
        self.classFeatures = ['- You are A KEEPER OF BALANCE, ATTUNED TO NATURE, and you can cast divine spells. See your SPELL REFERENCE SHEET for details.','- You are IN TOUCH WITH THE NATURAL WORLD and can identify plants and animals.','- THE TOUCH OF METAL IS COLD AND LIFELESS. You cannot wear metal armor.','- You are WELL-GROUNDED. If you need to make a SAVE because of an effect associated with FIRE or LIGHTNING, add a +2 bonus to your SAVING THROW.']
        self.classFeaturesPointer = "Features/DruidClassFeatures.csv"


    def getHP(self):
        HP = [0,0,0,0,0]
        Sum = 0
        rollDice = 0
        
        for i in range(0,5):
            rollDice = random.randint(1,8)
            Sum = Sum + rollDice
            HP[i] = Sum
        return HP
        
class Thief:
    def __init__(self, Character):
        self.classString = "Thief"

        # Thief only skills

        self.HP = self.getHP()

        ThiefSkillList = []

        # Base Thief skills from book.  Modified elsewhere in GetThiefDexAdjustments

        # Skills are imported from a CSV for easy editing.  The extra fluff around each statement is formatting it into an int
        # Each skill (and THAC0) come out in the form of [ LVL1, LVL2, LVL3, LVL4, LVL5 ] values.
        with open('Thief/ThiefSkills.csv',encoding='windows-1252') as f:
            ThiefObject = csv.reader(f, delimiter='|')
            for row in ThiefObject:
                ThiefSkillList.append(row)
        self.THAC0 = []
        self.THAC0.append( [ int(x) for x in ThiefSkillList[0] ] )
        self.THAC0 = self.THAC0[0]
    
        self.Steal = []
        self.Steal.append( [ int(x) for x in ThiefSkillList[1] ] )
        self.Steal = self.Steal[0]
    
        self.OpenDoor = []
        self.OpenDoor.append( [ int(x) for x in ThiefSkillList[2] ] )
        self.OpenDoor = self.OpenDoor[0]

        self.Trap = []
        self.Trap.append( [ int(x) for x in ThiefSkillList[3] ] )
        self.Trap = self.Trap[0]

        self.Sneak = []
        self.Sneak.append( [ int(x) for x in ThiefSkillList[4] ] )            
        self.Sneak = self.Sneak[0]        

        self.Hide = []
        self.Hide.append( [ int(x) for x in ThiefSkillList[5] ] )
        self.Hide = self.Hide[0]    

        self.Listen = []
        self.Listen.append( [ int(x) for x in ThiefSkillList[6] ] )
        self.Listen = self.Listen[0]        

        self.Climb = []
        self.Climb.append( [ int(x) for x in ThiefSkillList[7] ] )
        self.Climb = self.Climb[0]    

        self.Read = []
        self.Read.append( [ int(x) for x in ThiefSkillList[8] ] )
        self.Read = self.Read[0]

        Character.CharPoisonRes = [13,13,13,13,12]
        Character.CharPetrifyRes = [12,12,12,12,11]
        Character.CharWandRes = [14,14,14,14,12]
        Character.CharBreathRes = [16,16,16,16,15]
        Character.CharSpellRes = [15,15,15,15,13]

        self.classFeatures = ['- You are BETTER FROM BEHIND. You deal DOUBLE DAMAGE to an enemy if they are SURPRISED or if you can get BEHIND them.','- You gain the use of THIEF SKILLS. When you use a SKILL, roll d100 and compare to the correct SKILL below. Equal or lesser succeeds.']
        self.classFeaturesPointer = "Features/ThiefClassFeatures.csv"

    def getHP(self):
        HP = [0,0,0,0,0]
        Sum = 0
        rollDice = 0

        for i in range(0,5):
            rollDice = random.randint(1,6)
            Sum = Sum + rollDice
            HP[i] = Sum
        return HP

class Wizard:
    def __init__(self, Character):
        self.classString = "Wizard"
        self.THAC0 = [20, 20, 20, 20, 20]

        self.HP = self.getHP()

        Character.CharPoisonRes = [14,14,14,14,14]
        Character.CharPetrifyRes = [13,13,13,13,13]
        Character.CharWandRes = [11,11,11,11,11]
        Character.CharBreathRes = [15,15,15,15,15]
        Character.CharSpellRes = [12,12,12,12,12]

        self.classFeatures = ['- You are A STUDENT OF THE OCCULT AND THE ARCANE, and you can cast magic spells. See your SPELL REFERENCE SHEET for details.']
        self.classFeaturesPointer = "Features/WizardClassPointer"

    def getHP(self):
        HP = [0,0,0,0,0]
        Sum = 0
        rollDice = 0

        for i in range(0,5):
            rollDice = random.randint(1,4)
            Sum = Sum + rollDice
            HP[i] = Sum
        return HP

class Human:
    def __init__(self, Character):
        # raceString, used for identifying races
        self.raceString = "Human"
        if Character.Class.classString == "Fighter":
            # If a human fighter, the only features added
            self.raceFeatures = ['- You are completely ordinary, plain vanilla, no-frills; you have no additional features.']
            self.raceFeaturesPointer = "Features/HumanRaceFeatures"
        else:
            # Else, get the features from the race.
            self.raceFeatures = []
            self.raceFeaturesPointer = "Features/NullFeatures"

class Dwarf:
    def __init__(self, Character):
        self.raceString = "Dwarf"
        #self.raceFeatures = ['- You have INFRAVISION and can see even in COMPLETE DARKNESS, up to 60�.','- You are STOUT, and resistant to POISON and MAGIC.','- You are A MINER of GREAT SKILL, and can detect TUNNEL ODDITIES when UNDERGROUND.']
        self.raceFeaturesPointer = "Features/DwarfRaceFeatures"

class Elf:
    def __init__(self, Character):
        self.raceString = "Elf"
        #self.raceFeatures = ['- You have INFRAVISION and can see even in COMPLETE DARKNESS, up to 60�.','- You have a KEEN EYE FOR SECRETS, and can spot hidden doors 50% of the time. The DM will roll for you, when appropriate.','-    You are GOOD WITH BOWS, and add a bonus +1 to your ATTACK roll with a BOW, in addition to any other bonuses.','- You are A STUBBORN SPECIES and cannot be magically CHARMED or forced to SLEEP.']
        self.raceFeaturesPointer = "Features/ElfRaceFeatures"

class Gnome:
    def __init__(self, Character):
        self.raceString = "Gnome"
        #self.raceFeatures = ['- You have INFRAVISION and can see even in COMPLETE DARKNESS, up to 60�.','- You have MAGIC IN YOUR BLOOD, making you resistant to MAGIC.','- You are a DENIZEN OF THE MINES and can detect TUNNEL ODDITIES when UNDERGROUND.']
        self.raceFeaturesPointer = "Features/GnomeRaceFeatures"

class HalfElf:
    def __init__(self, Character):
        self.raceString = "Half-Elf"
        #self.raceFeatures = ['- You have INFRAVISION and can see even in COMPLETE DARKNESS, up to 60�.','- You have ELFIN BLOOD. You have a 30% chance of resisting magical CHARMS or SLEEP spells.','- You have a KEEN EYE FOR SECRETS, and can spot hidden doors 50% of the time. The DM will roll for you, when appropriate.']
        self.raceFeaturesPointer = "Features/HalfElfRaceFeatures"

class Halfling:
    def __init__(self, Character):
        self.raceString = "Halfling"
        #self.raceFeatures = ['- You have INFRAVISION and can see even in COMPLETE DARKNESS, up to 60�.','- You are UNEXPECTEDLY STURDY, and resistant to MAGIC and POISON.','- You move VERY QUIETLY, and are good at SURPRISING unwary enemies.']
        self.raceFeaturesPointer = "Features/HalflingRaceFeatures"

class HalfOrc:
    def __init__(self, Character):
        self.raceString = "Half-Orc"
        #self.raceFeatures = ['- You have INFRAVISION and can see even in COMPLETE DARKNESS, up to 60�.']
        self.raceFeaturesPointer = "Features/HalfOrcRaceFeatures"


class Inventory:
    def __init__(self, Character, GameOptions):
    
        self.Gold = self.getGold(Character, GameOptions)

        # Armor and weapons are received from getArmorAndWeapon (duh)
        ArmorReturn,WeaponReturn = self.getArmorAndWeapon(Character)
        # Inventory received from getInventory (duh)
        self.Inventory = self.getInventory(Character,GameOptions)    
        # Append the weapons and armor string name to the inventory list
        self.Inventory.append([WeaponReturn[0], 0])
        self.Inventory.append([ArmorReturn[0], 0])

        # Get armor string name
        self.Armor = ArmorReturn[0]
        # Get armor AC (is received from CSV as a string, need an integer for maths)
        self.ArmorAC = int(ArmorReturn[1])

        # Get weapon string name
        self.Weapon = WeaponReturn[0]
        # Following fields are essentially boolean (0 for false, 1 for true) and should be entered into the CSVs that way
        self.Shield = int(WeaponReturn[1])
        self.TwoHander = int(WeaponReturn[2])

        # Not a boolean, but a string
        self.WepDie = WeaponReturn[3]
        self.WeapAC = int(WeaponReturn[4])
        self.Ranged = int(WeaponReturn[5])

        # Add the appropriate ammo for ranged weapons.  Modders need to edit this.
        if self.Ranged == 1:
            if self.Weapon == "Sling":
                self.Inventory.append(["30 Sling Bullets",0])
                self.Inventory.append(["Sling Bullet Sack",0])
            if self.Weapon == "Longbow" or self.Weapon == "Shortbow":
                self.Inventory.append(["Quiver",0])
                self.Inventory.append(["30 Arrows",0])
            if self.Weapon == "Light Crossbow" or self.Weapon == "Heavy Crossbow":
                self.Inventory.append(["30 Crossbow Bolts",0])
                self.Inventory.append(["Quiver",0])
                
        # If the weapon is ranged, add a shield to the list
        if self.Shield == 1:
            self.Inventory.append(["Shield",0])


    def getGold(self, Character, GameOptions):
        rollDice = 0        

        if Character.Class.classString == "Cleric":
            for i in range(0,4):
                rollDice = rollDice + random.randint(1,6)
            
        elif Character.Class.classString == "Figher":
            for i in range(0,6):
                rollDice = rollDice + random.randint(1,4)

        elif Character.Class.classString == "Thief":
            for i in range(0,3):
                rollDice = rollDice + random.randint(1,6)

        else:
            for i in range(0,3):
                rollDice = rollDice + random.randint(1,4)
    
        Gold = rollDice * 10
        return Gold

    def getInventory(self, Character, GameOptions):
        InventoryList = []
        PlayerInventoryList = []

        # Open the items list for appending items
        with open("Items/Items.csv") as f:
            InventoryObject = csv.reader(f,delimiter='|')
            for row in InventoryObject:
                InventoryList.append(row)

        # Roll for 2 items, add to inventory list
        for i in range(0,2):
            RollDice = random.randint(0,len(InventoryList)-1)
            PlayerInventoryList.append(InventoryList.pop(RollDice))
            
        return PlayerInventoryList
    
    def getArmorAndWeapon(self, Character):
        ArmorList = []
        Armor = []
        WeaponList = []
        Weapon = []
            
        # Find the class of the character, and set the location to get the weapons and armor from
        if Character.Class.classString == "Fighter":
            ArmorLocation = "Armor/FighterArmor.csv"
            WeaponLocation = "Weapons/FighterWeapons.csv"

        elif Character.Class.classString == "Cleric":
            ArmorLocation = "Armor/ClericArmor.csv"
            WeaponLocation = "Weapons/ClericWeapons.csv"

        elif Character.Class.classString == "Thief":
            ArmorLocation = "Armor/ThiefArmor.csv"
            WeaponLocation = "Weapons/ThiefWeapons.csv"

        elif Character.Class.classString == "Wizard":
            ArmorLocation = "Armor/WizardArmor.csv"
            WeaponLocation = "Weapons/WizardWeapons.csv"

        elif Character.Class.classString == "Druid":
            ArmorLocation = "Armor/DruidArmor.csv"
            WeaponLocation = "Weapons/DruidWeapons.csv"

        elif Character.Class.classString == "Paladin":
            ArmorLocation = "Armor/PaladinArmor.csv"
            WeaponLocation = "Weapons/PaladinWeapons.csv"

        elif Character.Class.classString == "Ranger":
            ArmorLocation = "Armor/RangerArmor.csv"
            WeaponLocation = "Weapons/RangerWeapons.csv"

        # Open the armor file that was set above
        with open(ArmorLocation) as f:
            # Get the entire list (Not the most efficient way to do this I know)
            ArmorPiece = csv.reader(f, delimiter='|')
            # Iterate over every item in the list
            for row in ArmorPiece:
                # Append item to list
                ArmorList.append(row)
            # Roll a dice from 0-length of the armor list
            RollDice = random.randint(0,len(ArmorList)-1)
            # Select a piece of the armor
            Armor = ArmorList.pop(RollDice)

        # Open the weapon file that was set above
        with open(WeaponLocation) as e:
            # Get the entire list (Again, I know)
            WeaponPiece = csv.reader(e, delimiter='|')
            # Iterate over every item in the list
            for row in WeaponPiece:
                # Append weapon to the list 
                WeaponList.append(row)
            # Roll a dice from 0-length of the weapon list
            RollDice = random.randint(0,len(WeaponList)-1)
            # Select a random weapon
            Weapon = WeaponList.pop(RollDice)
        # Return the armor and weapon
        return [Armor,Weapon]

def getClericSpells(Character,GameOptions):
    SpellList = []
    PlayerSpellsByPlayerLevel = []
    PlayerSpellsByLevelTemp = []

    ## !! All spells are chosen in this manner.  Read this to understand the structure, won't be commenting the other spell structures.
    ## Modders take note, if inserting other classes, follow this structure

    # Spell level and player level are different ! 

    # Get spells from CSV file and make a list of them
    with open('Spells/ClericSpells.csv',encoding='windows-1252') as f:
        SpellObject = csv.reader(f, delimiter='|')
        for row in SpellObject:
            SpellList.append(row)

    # Get the number of spells by player level, a list of lists.  i is the inner list of spells to be added by level
    # see the game options file for the structure of the list
    for i in GameOptions.ClericSpellsByPlayerLevel:
        level = 1
        # Cycle through the inner list.  j will be the number of spells to be added at the level of its position in i.  
        for j in i:
            # If there are still spells to be added that level, continue the loop
            while j > 0:
                # While a spell is still being searched for, 
                spellFound = True
                while spellFound:
                    # Roll a dice for a spell, continue to do so until a spell of the appropriate spell level is found.
                    # Not the most efficient way to do it, but it prevents having to perform the logic of picking by spell, and ensuring the CSV is sorted
                    rollDice = random.randint(0,len(SpellList)-1)
                    if int(SpellList[rollDice][0]) == level:
                        spellFound = False
                # Assign to a temp file, so that the final product will be another list of lists
                PlayerSpellsByLevelTemp.append(SpellList[rollDice])
                # Remove the spell from the list so it is not chosen again
                SpellList.pop(rollDice)
                # Decrement the spell counter per level.  If this goes to 0, stop adding spells for this level
                j = j - 1
            # Increase the spell level to be searched for
            level = level + 1
        # Append the temporary spell list to the main spell list.
        PlayerSpellsByPlayerLevel.append(PlayerSpellsByLevelTemp)
        # Clear the temp list
        PlayerSpellsByLevelTemp = []

    # Return the spell list
    return PlayerSpellsByPlayerLevel

def getWizardSpells(Character,GameOptions):
    SpellList = []
    PlayerSpellsByPlayerLevel = []
    PlayerSpellsByLevelTemp = []
    
    with open('Spells/WizardSpells.csv',encoding='windows-1252') as f:
        SpellObject = csv.reader(f, delimiter='|')
        for row in SpellObject:
            SpellList.append(row)
    
    for i in GameOptions.WizardSpellsByPlayerLevel:
        level = 1
        for j in i:
            while j > 0:
                spellFound = True
                while spellFound:
                    rollDice = random.randint(0,len(SpellList)-1)
                    if int(SpellList[rollDice][0]) == level:
                        spellFound = False
                PlayerSpellsByLevelTemp.append(SpellList[rollDice])
                SpellList.pop(rollDice)
                j = j - 1
            level = level + 1
        PlayerSpellsByPlayerLevel.append(PlayerSpellsByLevelTemp)
        PlayerSpellsByLevelTemp = []
        
    return PlayerSpellsByPlayerLevel

def getDruidSpells(Character,GameOptions):
    SpellList = []
    PlayerSpellsByPlayerLevel = []
    PlayerSpellsByLevelTemp = []

    with open('Spells/DruidSpells.csv',encoding='windows-1252') as f:
        SpellObject = csv.reader(f,delimiter='|')
        for row in SpellObject:
            SpellList.append(row)
    
    for i in GameOptions.DruidSpellsByPlayerLevel:
        level = 1
        for j in i:
            while j > 0:
                spellFound = True
                while spellFound:
                    rollDice = random.randint(0,len(SpellList)-1)
                    if int(SpellList[rollDice][0]) == level:
                        spellFound = False
                PlayerSpellsByLevelTemp.append(SpellList[rollDice])
                SpellList.pop(rollDice)
                j = j - 1
            level = level + 1
        PlayerSpellsByPlayerLevel.append(PlayerSpellsByLevelTemp)
        PlayerSpellsByLevelTemp = []
    
    return PlayerSpellsByPlayerLevel

## Method for rolling player ststs, returns an array of length 6 to the Character class
def rollStats(gameOptions):
    RollingSum = 0
    StatArray = []
    DiceRoll = 0
    StatSum = 0
    MinStatRoll = True

    # Roll until a score of atleast the min stat reroll is received
    # Edit the min stat reroll to increase or decrease the average player strength and for fun!
    while(MinStatRoll):
        for j in range(0,6):
            for k in range(0,3):
                DiceRoll = random.randint(1,6)
                RollingSum = RollingSum + DiceRoll
            StatArray.append(RollingSum)
            DiceRoll = 0
            RollingSum = 0
    
        for i in StatArray:
            StatSum = StatSum + i

        if (StatSum >= gameOptions.MinReroll):
            MinStatRoll = False
            break
        else:
            StatSum = 0

    return StatArray


def getClass(Character,GameOptions):
    characterClass = 0
    weightSum = 0 

    # Get weights from gameOptions
    for i in GameOptions.ClassWeight:
        weightSum = i + weightSum

    # Easier to read this way
    FighterWeight = GameOptions.ClassWeight[0]
    ClericWeight = GameOptions.ClassWeight[1] + FighterWeight
    WizardWeight = GameOptions.ClassWeight[2] + ClericWeight
    ThiefWeight = GameOptions.ClassWeight[3] + WizardWeight
    DruidWeight = GameOptions.ClassWeight[4] + ThiefWeight
    PaladinWeight = GameOptions.ClassWeight[5] + DruidWeight
    RangerWeight = GameOptions.ClassWeight[6] + PaladinWeight
    # Follow the pattern to mod in other classes if you want or something idk

    # Roll a dice from 0 to the total weight
    DiceRoll = random.randint(0,weightSum-1)
    
    # If 0 to Weight of Fighter, roll a fighter
    if (0 <= DiceRoll <= FighterWeight-1):
        characterClass = Fighter(Character)
        minPointer = "MinClassStats/FighterMinStats.csv"


    # If 7-13, roll a cleric (7/31 Chance)
    elif (FighterWeight <= DiceRoll <= ClericWeight-1):
        characterClass = Cleric(Character)
        minPointer = "MinClassStats/ClericMinStats.csv"

    # If 14-20, roll a Wizard (7/31 Chance)
    elif (ClericWeight <= DiceRoll <= WizardWeight-1):
        characterClass = Wizard(Character)
        minPointer = "MinClassStats/WizardMinStats.csv"
    
    # If 21-27, roll a Thief (7/31 Chance)
    elif (WizardWeight <= DiceRoll <= ThiefWeight-1):
        characterClass = Thief(Character)
        minPointer = "MinClassStats/ThiefMinStats.csv"

    # If 28, roll a Druid (1/31 Chance)
    elif (ThiefWeight <= DiceRoll <= DruidWeight-1):
        characterClass = Druid(Character)
        minPointer = "MinClassStats/DruidMinStats.csv"

    # If 29, roll a Paladin (1/31 Chance)
    elif (DruidWeight <= DiceRoll <= PaladinWeight-1):
        characterClass = Paladin(Character)
        minPointer = "MinClassStats/PaladinMinStats.csv"

    # if 30, roll a Ranger (1/31 Chance)
    elif (PaladinWeight <= DiceRoll <= RangerWeight-1):
        characterClass = Ranger(Character)
        minPointer = "MinClassStats/RangerMinStats.csv"

    minPointerList = []

    if (GameOptions.EnforceStats == True):
        with open(minPointer, encoding="windows-1252") as f:
            minPointerObject = csv.reader(f,delimiter="|")
            for row in minPointerObject:
                minPointerList.append(row)

        for row in minPointerList:
            statToBeModified = str(row[0])

            if statToBeModified == "CON":
                Character.CON == int(row[1])

            if statToBeModified == "INT":
                Character.INT = int(row[1])

            if statToBeModified == "WIS":
                Character.WIS = int(row[1])

            if statToBeModified == "DEX":
                Character.DEX = int(row[1])

            if statToBeModified == "CHA":
                Character.CHA = int(row[1])

            if statToBeModified == "STR":
                Character.STR = int(row[1])

        
    return characterClass


def getRace(Character,GameOptions):

    raceList = []
    workingRaceList = []

    with open("RaceSelection/RaceChart.csv",encoding="windows-1252") as f:
        RaceObject = csv.reader(f,delimiter="|")
        for row in RaceObject:
            raceList.append(row)

    f.close()


    #  Format:
    #           Human Dwarf  Elf    Gnome   HalfElf   Halfling  HalfOrc
    #  Fighter
    #  Druid
    #  Paladin
    #  Cleric
    #  Ranger
    #  Thief
    #  Wizard

    if Character.Class.classString == "Fighter":
        workingRaceList = raceList[0]
    elif Character.Class.classString == "Druid":
        workingRaceList = raceList[1]
    elif Character.Class.classString == "Paladin":
        workingRaceList = raceList[2]
    elif Character.Class.classString == "Cleric":
        workingRaceList = raceList[3]
    elif Character.Class.classString == "Ranger":
        workingRaceList = raceList[4]
    elif Character.Class.classString == "Thief":
        workingRaceList = raceList[5]
    elif Character.Class.classString == "Wizard":
        workingRaceList = raceList[6]

    i = 0
    RacesAvailableList = []

    if GameOptions.IgnoreRaceRestrictions == 0:
        for column in workingRaceList:
            if int(column) == 1:
                RacesAvailableList.append(i)
            i = i + 1
    else:
        RacesAvailableList = [1,1,1,1,1,1,1]

    RaceIndex = random.choice(RacesAvailableList)

    if RaceIndex == 0:
        CharacterRace = Human(Character)
    elif RaceIndex == 1:
        CharacterRace = Dwarf(Character)
    elif RaceIndex == 2:
        CharacterRace = Elf(Character)
    elif RaceIndex == 3:
        CharacterRace = Gnome(Character)
    elif RaceIndex == 4:
        CharacterRace = HalfElf(Character)
    elif RaceIndex == 5:
        CharacterRace = Halfling(Character)
    elif RaceIndex == 6:
        CharacterRace = HalfOrc(Character)

    return CharacterRace

def getSTRAdjustments(Character):
    STR = Character.STR

    # Adjust the stats by the Strength stat.  Statistics are taken from tables in the book.  Hardcoded :(
    StrList = []


    with open("StatAdjust\StrAdjust.csv",encoding='windows-1252') as f:
        StrObject = csv.reader(f,delimiter='|')
        for row in StrObject:
            StrList.append(row)

    for row in StrList:
        if int(row[0]) == STR:
            ToHit = row[1]
            Damage = row[2]
            OpenDoors = row[3]
            BbLg = row[4]
            break

    Character.ToHit = ToHit
    Character.Damage = Damage
    Character.OpenDoors = OpenDoors
    Character.BbLg = BbLg

def getDEXAdjustments(Character):

    DEX = Character.DEX
    DexList = []

    with open("StatAdjust\DexAdjust.csv",encoding='windows-1252') as f:
        DexObject = csv.reader(f,delimiter='|')
        for row in DexObject:
            DexList.append(row)


    for row in DexList:
        if int(row[0]) == DEX:
            AC = row[1]
            break

    AC = int(AC)

    return AC


def getDEXThiefAdjustments(Character):
    DEX = Character.DEX
    DexAdjustmentList = []

    # Adjust the thief skills by Dex.  Only sort of hardcoded now!
    with open('Thief/DexSkills.csv',encoding='windows-1252') as f:
        DexObject = csv.reader(f,delimiter='|')
        for row in DexObject:
            DexAdjustmentList.append(row)

    #         Steal, Lock, Trap, Sneak, Hide
    DexSkillMods = [0,0,0,0,0]

    # SkillAdjustment will have the form: [DexScoreValue,StealMod,LockMod,TrapMod,SneakMod,HideMod]
    # 
    # Confusing I know, but I was drunk when I wrote this, so lay off me
    for SkillAdjustment in DexAdjustmentList:
        if (DEX == int(SkillAdjustment[0])):
            DexSkillMods[0] = int(SkillAdjustment[1])
            DexSkillMods[1] = int(SkillAdjustment[2])
            DexSkillMods[2] = int(SkillAdjustment[3])
            DexSkillMods[3] = int(SkillAdjustment[4])
            DexSkillMods[4] = int(SkillAdjustment[5])
            break

    f.close()

    Race = Character.Race.raceString
    # Ensure that the adjustment list is initialized with 0s, otherwise if the race is not found in the adjustment list,
    # it will cause errors when summing at the end.
    # Format for RaceSkillsMod = [Steal, Doors, Traps, Sneak, Hide, Listen, Climb, Read]
    RaceSkillsMod = [0,0,0,0,0,0,0,0]
    # Format for RaceAdjustmentList (after assignment) = [Race, Steal, Doors, Traps, Sneak, Hide, Listen, Climb, Read]
    RaceAdjustmentList = []

    with open('Thief/RaceSkills.csv',encoding='windows-1252') as f:
        RaceObject = csv.reader(f,delimiter='|')
        for row in RaceObject:
            RaceAdjustmentList.append(row)

    for RaceAdjustment in RaceAdjustmentList:
        if (Race == RaceAdjustment[0]):
            RaceSkillsMod[0] = int(RaceAdjustment[1])
            RaceSkillsMod[1] = int(RaceAdjustment[2])
            RaceSkillsMod[2] = int(RaceAdjustment[3])
            RaceSkillsMod[3] = int(RaceAdjustment[4])
            RaceSkillsMod[4] = int(RaceAdjustment[5])
            RaceSkillsMod[5] = int(RaceAdjustment[6])
            RaceSkillsMod[6] = int(RaceAdjustment[7])
            RaceSkillsMod[7] = int(RaceAdjustment[8])
            break    
    f.close()
    
    # Run through a for loop to modify all elements of the arrays.  
    Character.Class.Steal = [int(x) + DexSkillMods[0] + RaceSkillsMod[0] for x in Character.Class.Steal]
    Character.Class.OpenDoor = [x + DexSkillMods[1] + RaceSkillsMod[1] for x in Character.Class.OpenDoor]
    Character.Class.Trap = [x + DexSkillMods[2] + RaceSkillsMod[2] for x in Character.Class.Trap]
    Character.Class.Sneak = [x + DexSkillMods[3] + RaceSkillsMod[3] for x in Character.Class.Sneak]
    Character.Class.Hide = [x + DexSkillMods[4] + RaceSkillsMod[4] for x in Character.Class.Hide]
    Character.Class.Listen = [x + RaceSkillsMod[5] for x in Character.Class.Listen]
    Character.Class.Climb = [x + RaceSkillsMod[6] for x in Character.Class.Climb]
    Character.Class.Read = [x + RaceSkillsMod[7] for x in Character.Class.Read]

    # Ensure that there are no negative stats for each skill, which can happen for a low dex score and a bad thief race
    count = 0
    for x in Character.Class.Steal:
        if x < 0:
            Character.Class.Steal[count] = 0
        count = count + 1
    
    count = 0
    for x in Character.Class.OpenDoor:
        if x < 0:
            Character.Class.OpenDoor[count] = 0
        count = count + 1

    count = 0
    for x in Character.Class.Trap:
        if x < 0:
            Character.Class.Trap[count] = 0
        count = count + 1    

    count = 0
    for x in Character.Class.Sneak:
        if x < 0:
            Character.Class.Sneak[count] = 0
        count = count + 1    

    count = 0
    for x in Character.Class.Hide:
        if x < 0:
            Character.Class.Hide[count] = 0
        count = count + 1

    count = 0    
    for x in Character.Class.Listen:
        if x < 0:
            Character.Class.Listen[count] = 0
        count = count + 1    

    count = 0    
    for x in Character.Class.Climb:
        if x < 0:
            Character.Class.Climb[count] = 0
        count = count + 1

    count = 0    
    for x in Character.Class.Read:
        if x < 0:
            Character.Class.Read[count] = 0
        count = count + 1

# Main method for generating the XML output
def importToCharSheet(Character):
    FileWrite = ""

    # Get Class and Race string
    Class = Character.Class.classString
    Race = Character.Race.raceString

    # Caster and Skilled are conditionals for importing spells and thief skills.  If 0, do not add
    if Class == "Wizard" or Class == "Druid" or Class == "Cleric":
        Caster = 1
    else:
        Caster = 0
    if Class == "Thief":
        Skilled = 1
    else:
        Skilled = 0

    # Not currently implemented
    XP = [0,0,0,0,0]
    
    # Get the features listing
    Features = getFeatures(Character)

    # Get the base Class, Race,
    FileWrite = importBase(Class, Race, Caster, Skilled, XP, Features)

    Name = Character.Characteristics.Name
    Gender = Character.Characteristics.Gender
    Age = Character.Characteristics.Age
    Ht = Character.Characteristics.Height
    Wt = Character.Characteristics.Weight
    Align = Character.Characteristics.Align

    FileWrite = FileWrite + importFluff(Name,Gender,Age,Ht,Wt,Align)
    
    Str = Character.STR
    Con = Character.CON
    Int = Character.INT
    Wis = Character.WIS
    Dex = Character.DEX
    Cha = Character.CHA
    
    FileWrite = FileWrite + importStats(Str,Con,Int,Wis,Dex,Cha)

    Poison = Character.CharPoisonRes
    Petrify = Character.CharPetrifyRes
    Wand = Character.CharWandRes
    Breath = Character.CharBreathRes
    Spell = Character.CharBreathRes

    FileWrite = FileWrite + importResist(Poison,Petrify,Wand,Breath,Spell)

    Hp = Character.Class.HP
    THAC0 = Character.Class.THAC0
    Damage = Character.Damage
    totalAC = Character.AC
    shieldAC = Character.shieldAC
    armAC = Character.armAC
    dexAC = Character.dexAC
    Doors = Character.OpenDoors
    LGBB = Character.BbLg

    FileWrite = FileWrite + importAttrib(Hp,THAC0,Damage,totalAC,shieldAC,armAC,dexAC,Doors,LGBB)    

    InventoryList = Character.Inventory.Inventory
    Gold = Character.Inventory.Gold
    Wdie = Character.Inventory.WepDie

    FileWrite = FileWrite + importProps(InventoryList, Gold, Wdie)

    if Skilled == 1:
        Pockets = Character.Class.Steal
        Locks = Character.Class.OpenDoor
        Traps = Character.Class.Trap
        Sneak = Character.Class.Sneak
        Hide = Character.Class.Hide
        Listen = Character.Class.Listen
        Climb = Character.Class.Climb
        Read = Character.Class.Read
    
        FileWrite = FileWrite + importSkills(Pockets, Locks, Traps, Sneak, Hide, Listen, Climb, Read)
    
    if Caster == 1:
        SpellList = Character.SpellList
        FileWrite = FileWrite + importSpells(SpellList)

    FileWrite = FileWrite + importCharacterClose()

    FileName = 'XMLFile/Characters.xml'    

    f = open(FileName, 'a+')
    f.write(FileWrite)
    f.close()

def getFeatures(Character):
    #raceFeatures = getRaceFeatures(Character)
    #classFeatures = Character.Class.classFeatures
    #Features = raceFeatures + classFeatures
    return []

def getRaceFeatures(Character):
    f = open(Character.Class.classFeaturesPointer)

def importBase(Class,Race,Caster,Skilled,Xp,Features):
    FileWrite = ""
    FileWrite = FileWrite + '\t<character>\n'
    FileWrite = FileWrite + '\t\t<base>\n'
    FileWrite = FileWrite + '\t\t\t<class>' + str(Class) + '</class>\n'
    FileWrite = FileWrite + '\t\t\t<race>' + str(Race) + '</race>\n'
    FileWrite = FileWrite + '\t\t\t<caster>' + str(Caster) + '</caster>\n'

    FileWrite = FileWrite + '\t\t\t<skilled>' + str(Skilled) + '</skilled>\n'
    FileWrite = FileWrite + '\t\t\t<xp>\n'
    FileWrite = FileWrite + '\t\t\t\t<xp1>' + str(Xp[0]) + '</xp1>\n'
    FileWrite = FileWrite + '\t\t\t\t<xp2>' + str(Xp[1]) + '</xp2>\n'
    FileWrite = FileWrite + '\t\t\t\t<xp3>' + str(Xp[2]) + '</xp3>\n'
    FileWrite = FileWrite + '\t\t\t\t<xp4>' + str(Xp[3]) + '</xp4>\n'
    FileWrite = FileWrite + '\t\t\t\t<xp5>' + str(Xp[4]) + '</xp5>\n'
    FileWrite = FileWrite + '\t\t\t</xp>\n'
    FileWrite = FileWrite + '\t\t\t<features>\n'
    
    FeaturesWrite = ''
    for i in Features:
        FeaturesWrite = FeaturesWrite + '\t\t\t\t<feature>' + str(i) + '</feature>\n'
    FeaturesWrite = FeaturesWrite.replace('&','&amp;')
    FileWrite = FileWrite + FeaturesWrite + '\t\t\t</features>\n'

    FileWrite = FileWrite + '\t\t</base>\n'
    return FileWrite


def importFluff(Name, Gender, Age, Ht, Wt, Align):
    FileWrite = "" 
    FileWrite = FileWrite + '\t\t<fluff>\n'
    FileWrite = FileWrite + '\t\t\t<name>' + str(Name) + '</name>\n'
    if Gender == "Male":
        FileWrite = FileWrite + '\t\t\t<gender>&#x2642;</gender>'
    else:
        FileWrite = FileWrite + '\t\t\t<gender>&#x2640;</gender>'
    FileWrite = FileWrite + '\t\t\t<age>' + str(Age) + '</age>\n'
    FileWrite = FileWrite + '\t\t\t<ht>' + str(Ht) + '</ht>\n'
    FileWrite = FileWrite + '\t\t\t<wt>' + str(Wt) + '</wt>\n'
    FileWrite = FileWrite + '\t\t\t<align>' + str(Align) + '</align>\n'
    FileWrite = FileWrite + '\t\t</fluff>\n'
    return FileWrite

def importStats(Str,Con,Int,Wis,Dex,Cha):
    FileWrite = ""
    FileWrite = FileWrite + '\t\t<stats>\n'
    FileWrite = FileWrite + '\t\t\t<STR>' + str(Str) + '</STR>\n'
    FileWrite = FileWrite + '\t\t\t<CON>' + str(Con) + '</CON>\n'
    FileWrite = FileWrite + '\t\t\t<INT>' + str(Int) + '</INT>\n'
    FileWrite = FileWrite + '\t\t\t<WIS>' + str(Wis) + '</WIS>\n'
    FileWrite = FileWrite + '\t\t\t<DEX>' + str(Dex) + '</DEX>\n'
    FileWrite = FileWrite + '\t\t\t<CHA>' + str(Cha) + '</CHA>\n'
    FileWrite = FileWrite + '\t\t</stats>\n'
    return FileWrite

def importResist(Poison,Petrify,Wand,Breath,Spell):
    FileWrite = ""
    FileWrite = '\t\t<saves>\n'

    FileWrite = FileWrite + '\t\t\t<poison>\n'
    FileWrite = FileWrite + '\t\t\t\t<pois1>' + str(Poison[0]) + '</pois1>\n'
    FileWrite = FileWrite + '\t\t\t\t<pois2>' + str(Poison[1]) + '</pois2>\n'
    FileWrite = FileWrite + '\t\t\t\t<pois3>' + str(Poison[2]) + '</pois3>\n'
    FileWrite = FileWrite + '\t\t\t\t<pois4>' + str(Poison[3]) + '</pois4>\n'
    FileWrite = FileWrite + '\t\t\t\t<pois5>' + str(Poison[4]) + '</pois5>\n'
    FileWrite = FileWrite + '\t\t\t</poison>\n'

    FileWrite = FileWrite + '\t\t\t<petrify>\n'

    FileWrite = FileWrite + '\t\t\t\t<petr1>' + str(Petrify[0]) + '</petr1>\n'
    FileWrite = FileWrite + '\t\t\t\t<petr2>' + str(Petrify[1]) + '</petr2>\n'
    FileWrite = FileWrite + '\t\t\t\t<petr3>' + str(Petrify[2]) + '</petr3>\n'
    FileWrite = FileWrite + '\t\t\t\t<petr4>' + str(Petrify[3]) + '</petr4>\n'
    FileWrite = FileWrite + '\t\t\t\t<petr5>' + str(Petrify[4]) + '</petr5>\n'
    FileWrite = FileWrite + '\t\t\t</petrify>\n'

    FileWrite = FileWrite + '\t\t\t<wand>\n'
    FileWrite = FileWrite + '\t\t\t\t<wand1>' + str(Wand[0]) + '</wand1>\n'
    FileWrite = FileWrite + '\t\t\t\t<wand2>' + str(Wand[1]) + '</wand2>\n'
    FileWrite = FileWrite + '\t\t\t\t<wand3>' + str(Wand[2]) + '</wand3>\n'
    FileWrite = FileWrite + '\t\t\t\t<wand4>' + str(Wand[3]) + '</wand4>\n'
    FileWrite = FileWrite + '\t\t\t\t<wand5>' + str(Wand[4]) + '</wand5>\n'
    FileWrite = FileWrite + '\t\t\t</wand>\n'

    FileWrite = FileWrite + '\t\t\t<breath>\n'
    FileWrite = FileWrite + '\t\t\t\t<brea1>' + str(Breath[0]) + '</brea1>\n'
    FileWrite = FileWrite + '\t\t\t\t<brea2>' + str(Breath[1]) + '</brea2>\n'
    FileWrite = FileWrite + '\t\t\t\t<brea3>' + str(Breath[2]) + '</brea3>\n'
    FileWrite = FileWrite + '\t\t\t\t<brea4>' + str(Breath[3]) + '</brea4>\n'
    FileWrite = FileWrite + '\t\t\t\t<brea5>' + str(Breath[4]) + '</brea5>\n'
    FileWrite = FileWrite + '\t\t\t</breath>\n'

    FileWrite = FileWrite + '\t\t\t<spell>\n'
    FileWrite = FileWrite + '\t\t\t\t<spel1>' + str(Spell[0]) + '</spel1>\n'
    FileWrite = FileWrite + '\t\t\t\t<spel2>' + str(Spell[1]) + '</spel2>\n'
    FileWrite = FileWrite + '\t\t\t\t<spel3>' + str(Spell[2]) + '</spel3>\n'
    FileWrite = FileWrite + '\t\t\t\t<spel4>' + str(Spell[3]) + '</spel4>\n'
    FileWrite = FileWrite + '\t\t\t\t<spel5>' + str(Spell[4]) + '</spel5>\n'
    FileWrite = FileWrite + '\t\t\t</spell>\n'

    FileWrite = FileWrite + '\t\t</saves>\n'
    return FileWrite

def importAttrib(Hp,THAC0,Damage,totalAC,shieldAC,armAC,dexAC,Doors,LGBB):
    FileWrite = ""
    FileWrite = '\t\t<attrib>\n'

    FileWrite = FileWrite + '\t\t\t<hpval>\n'
    FileWrite = FileWrite + '\t\t\t\t<hp1>' + str(Hp[0]) + '</hp1>\n'
    FileWrite = FileWrite + '\t\t\t\t<hp2>' + str(Hp[1]) + '</hp2>\n'
    FileWrite = FileWrite + '\t\t\t\t<hp3>' + str(Hp[2]) + '</hp3>\n'
    FileWrite = FileWrite + '\t\t\t\t<hp4>' + str(Hp[3]) + '</hp4>\n'
    FileWrite = FileWrite + '\t\t\t\t<hp5>' + str(Hp[4]) + '</hp5>\n'
    FileWrite = FileWrite + '\t\t\t</hpval>\n'

    FileWrite = FileWrite + '\t\t\t<thac0>\n'
    FileWrite = FileWrite + '\t\t\t\t<thac01>' + str(THAC0[0]) + '</thac01>\n'
    FileWrite = FileWrite + '\t\t\t\t<thac02>' + str(THAC0[1]) + '</thac02>\n'
    FileWrite = FileWrite + '\t\t\t\t<thac03>' + str(THAC0[2]) + '</thac03>\n'
    FileWrite = FileWrite + '\t\t\t\t<thac04>' + str(THAC0[3]) + '</thac04>\n'
    FileWrite = FileWrite + '\t\t\t\t<thac05>' + str(THAC0[4]) + '</thac05>\n'
    FileWrite = FileWrite + '\t\t\t</thac0>\n'



    FileWrite = FileWrite + '\t\t\t<damage>' + str(Damage) + '</damage>\n'

    FileWrite = FileWrite + '\t\t\t<ac>\n'
    FileWrite = FileWrite + '\t\t\t\t<totalac>' + str(totalAC) + '</totalac>\n'
    FileWrite = FileWrite + '\t\t\t\t<shieldac>' + str(shieldAC) + '</shieldac>\n'
    FileWrite = FileWrite + '\t\t\t\t<armorac>' + str(armAC) + '</armorac>\n'
    FileWrite = FileWrite + '\t\t\t\t<dexac>' + str(dexAC) + '</dexac>\n'
    FileWrite = FileWrite + '\t\t\t</ac>\n'

    FileWrite = FileWrite + '\t\t\t<doors>' + str(Doors) + '</doors>\n'
    FileWrite = FileWrite + '\t\t\t<lgbb>' + str(LGBB) + '</lgbb>\n'
    FileWrite = FileWrite + '\t\t</attrib>\n'
    return FileWrite

def importProps(InvList, gold, wdie):
    FileWrite = ""
    FileWrite = '\t\t<props>\n'
    InventoryList = ""
    FileWrite = FileWrite + '\t\t\t<invlist>\n'
    for i in InvList:
        FileWrite = FileWrite + '\t\t\t\t<item>' + str(i[0]) + '</item>\n'
    FileWrite = FileWrite + '\t\t\t</invlist>\n'

    FileWrite = FileWrite + '\t\t\t<gold>' + str(gold) + '</gold>\n'
    FileWrite = FileWrite + '\t\t\t<wdie>' + str(wdie) + '</wdie>\n'
    FileWrite = FileWrite + '\t\t</props>\n'
    FileWrite = FileWrite.replace('&','&amp;')
    return FileWrite


def importSpells(SpellListByLevel):
    FileWrite = ""
    FileWrite = FileWrite + '\t\t<spells>\n'

    for i in range(0,5):
        FileWrite = FileWrite + '\t\t\t<L' + str(i+1) + '>\n'
        for j in SpellListByLevel[i]:
            FileWrite = FileWrite + '\t\t\t\t<spell>\n'
            FileWrite = FileWrite + '\t\t\t\t\t<s_name>' + str(j[2]) + '</s_name>\n'
            FileWrite = FileWrite + '\t\t\t\t\t<s_text>' + str(j[3]) + '</s_text>\n'
            FileWrite = FileWrite + '\t\t\t\t\t<s_cast>' + str(j[4]) + '</s_cast>\n'
            FileWrite = FileWrite + '\t\t\t\t\t<s_dura>' + str(j[5]) + '</s_dura>\n'
            FileWrite = FileWrite + '\t\t\t\t\t<s_save>' + str(j[7]) + '</s_save>\n'
            FileWrite = FileWrite + '\t\t\t\t</spell>\n'
        FileWrite = FileWrite + '\t\t\t</L' + str(i+1) + '>\n'
    FileWrite = FileWrite + '\t\t</spells>\n'
    FileWrite = FileWrite.replace('&','&amp;')
    return FileWrite

def importSkills(Pockets,Locks,Traps,Sneak,Hide,Listen,Climb,Read):
    FileWrite = ""
    FileWrite = FileWrite + '\t\t<skills>\n'

    FileWrite = FileWrite + '\t\t\t<pockets>\n'
    FileWrite = FileWrite + '\t\t\t\t<pock1>' + str(Pockets[0]) + '</pock1>\n'
    FileWrite = FileWrite + '\t\t\t\t<pock2>' + str(Pockets[1]) + '</pock2>\n'
    FileWrite = FileWrite + '\t\t\t\t<pock3>' + str(Pockets[2]) + '</pock3>\n'
    FileWrite = FileWrite + '\t\t\t\t<pock4>' + str(Pockets[3]) + '</pock4>\n'
    FileWrite = FileWrite + '\t\t\t\t<pock5>' + str(Pockets[4]) + '</pock5>\n'
    FileWrite = FileWrite + '\t\t\t</pockets>\n'

    FileWrite = FileWrite + '\t\t\t<locks>\n'
    FileWrite = FileWrite + '\t\t\t\t<lock1>' + str(Locks[0]) + '</lock1>\n'
    FileWrite = FileWrite + '\t\t\t\t<lock2>' + str(Locks[1]) + '</lock2>\n'
    FileWrite = FileWrite + '\t\t\t\t<lock3>' + str(Locks[2]) + '</lock3>\n'
    FileWrite = FileWrite + '\t\t\t\t<lock4>' + str(Locks[3]) + '</lock4>\n'
    FileWrite = FileWrite + '\t\t\t\t<lock5>' + str(Locks[4]) + '</lock5>\n'
    FileWrite = FileWrite + '\t\t\t</locks>\n'

    FileWrite = FileWrite + '\t\t\t<traps>\n'
    FileWrite = FileWrite + '\t\t\t\t<trap1>' + str(Traps[0]) + '</trap1>\n'
    FileWrite = FileWrite + '\t\t\t\t<trap2>' + str(Traps[1]) + '</trap2>\n'
    FileWrite = FileWrite + '\t\t\t\t<trap3>' + str(Traps[2]) + '</trap3>\n'
    FileWrite = FileWrite + '\t\t\t\t<trap4>' + str(Traps[3]) + '</trap4>\n'
    FileWrite = FileWrite + '\t\t\t\t<trap5>' + str(Traps[4]) + '</trap5>\n'
    FileWrite = FileWrite + '\t\t\t</traps>\n'

    FileWrite = FileWrite + '\t\t\t<sneak>\n'
    FileWrite = FileWrite + '\t\t\t\t<sneak1>' + str(Sneak[0]) + '</sneak1>\n'
    FileWrite = FileWrite + '\t\t\t\t<sneak2>' + str(Sneak[1]) + '</sneak2>\n'
    FileWrite = FileWrite + '\t\t\t\t<sneak3>' + str(Sneak[2]) + '</sneak3>\n'
    FileWrite = FileWrite + '\t\t\t\t<sneak4>' + str(Sneak[3]) + '</sneak4>\n'
    FileWrite = FileWrite + '\t\t\t\t<sneak5>' + str(Sneak[4]) + '</sneak5>\n'
    FileWrite = FileWrite + '\t\t\t</sneak>\n'

    FileWrite = FileWrite + '\t\t\t<hide>\n'
    FileWrite = FileWrite + '\t\t\t\t<hide1>' + str(Hide[0]) + '</hide1>\n'
    FileWrite = FileWrite + '\t\t\t\t<hide2>' + str(Hide[1]) + '</hide2>\n'
    FileWrite = FileWrite + '\t\t\t\t<hide3>' + str(Hide[2]) + '</hide3>\n'
    FileWrite = FileWrite + '\t\t\t\t<hide4>' + str(Hide[3]) + '</hide4>\n'
    FileWrite = FileWrite + '\t\t\t\t<hide5>' + str(Hide[4]) + '</hide5>\n'
    FileWrite = FileWrite + '\t\t\t</hide>\n'

    FileWrite = FileWrite + '\t\t\t<listen>\n'
    FileWrite = FileWrite + '\t\t\t\t<listen1>' + str(Listen[0]) + '</listen1>\n'
    FileWrite = FileWrite + '\t\t\t\t<listen2>' + str(Listen[1]) + '</listen2>\n'
    FileWrite = FileWrite + '\t\t\t\t<listen3>' + str(Listen[2]) + '</listen3>\n'
    FileWrite = FileWrite + '\t\t\t\t<listen4>' + str(Listen[3]) + '</listen4>\n'
    FileWrite = FileWrite + '\t\t\t\t<listen5>' + str(Listen[4]) + '</listen5>\n'
    FileWrite = FileWrite + '\t\t\t</listen>\n'

    FileWrite = FileWrite + '\t\t\t<climb>\n'
    FileWrite = FileWrite + '\t\t\t\t<climb1>' + str(Climb[0]) + '</climb1>\n'
    FileWrite = FileWrite + '\t\t\t\t<climb2>' + str(Climb[1]) + '</climb2>\n'
    FileWrite = FileWrite + '\t\t\t\t<climb3>' + str(Climb[2]) + '</climb3>\n'
    FileWrite = FileWrite + '\t\t\t\t<climb4>' + str(Climb[3]) + '</climb4>\n'
    FileWrite = FileWrite + '\t\t\t\t<climb5>' + str(Climb[4]) + '</climb5>\n'
    FileWrite = FileWrite + '\t\t\t</climb>\n'

    FileWrite = FileWrite + '\t\t\t<read>\n'
    FileWrite = FileWrite + '\t\t\t\t<read1>' + str(Read[0]) + '</read1>\n'
    FileWrite = FileWrite + '\t\t\t\t<read2>' + str(Read[1]) + '</read2>\n'
    FileWrite = FileWrite + '\t\t\t\t<read3>' + str(Read[2]) + '</read3>\n'
    FileWrite = FileWrite + '\t\t\t\t<read4>' + str(Read[3]) + '</read4>\n'
    FileWrite = FileWrite + '\t\t\t\t<read5>' + str(Read[4]) + '</read5>\n'
    FileWrite = FileWrite + '\t\t\t</read>\n'    

    FileWrite = FileWrite + '\t\t</skills>\n'
    return FileWrite

def importCharacterClose():
    FileWrite = ""
    FileWrite = '\t</character>\n'
    return FileWrite

def importFooter():
    FileWrite = ""
    FileWrite = '</chargen>\n'
    return FileWrite

def importHeader():
    FileWrite = ""
    FileWrite = '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n'
    FileWrite = FileWrite + '<?xml-stylesheet type=\"text/xsl\" href=\"charsheet.xsl\"?>\n'
    FileWrite = FileWrite + '<chargen>'
    return FileWrite

def main():
    
    gameOptions = GameOptions()
    header = importHeader()
    f = open('XMLFile/Characters.xml','a+')
    f.write(header)
    f.write('\n')
    f.close()

    for i in range(0,gameOptions.CharactersGenerated):
        Player = Character(gameOptions)
        importToCharSheet(Player)

    footer = importFooter()
    f = open('XMLFile/Characters.xml','a+')
    f.write(footer)
    f.close()
    
if __name__ == "__main__": main()
