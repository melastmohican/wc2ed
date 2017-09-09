# wc2ed - Warcarft II Save Editor v1.0 (c) 1996 MSJ

Blizzard's Warcraft II save file editor (Beyond the Dark Portal support under construction). Changes unit & object characteristics. Also gold, lumber, and oil values for all active sides & neutral creatures and objects can be modified. 


Player Information:

It seems like the game was originally designed for about playing up to 15/16 players! However, at the moment in the game maybe eight players - marked by color: red, blue, marine, violet, orange, gray, white and yellow. All data about players is written in this order.
 
Under 2F4h..2FBh offsets we have status information for everyone from the players. 00h means that the player of this color controled by you; 01h - player is computer controlled; 03h - the competitor of this color does not exist.
 
Information about gold / wood / oil resources for first player (red) are located at offset 1F4h / 1B4h / 234h. For the next player (blue) we add 04h, for another again 04h, etc. Values are written in four bytes, but FF FF FFh should suffice.
 
The 4E6h..5D4h offset bytes contain information on the relationship between players (war / peace). It does not make it much more difficult to decipher it, entering zeros immediately makes peace between all the competitors (the computer does nothing, even when we attack it).
 
Information about facilities:
 
The file can contain up to 600 objects (units, buildings, etc.). Information about each object is 132 bytes. Data of the first object begins with offset 5A156h, the second - from 5A0D2h (132 bytes earlier), last - 46C7Ah.
 
Bytes under offset + 41h, + 43h and + 47h are information about object type
(Footman, Gryphon Rider, Watch Tower, etc.). In all three bytes you can
Type in SAME values from 00h to 68h (others are e.g. decaying corpse, building during construction, etc.). Even values referring to people, odd - to orc:

Ground units:
Ground units:                         Buildings:
00h     FOOTMAN                       3Ah     FARM
01h     GRUNT                         3Bh     PIG FARM
02h     PEASANT                       3Ch     BARRACKS
03h     PEON                          3Dh     BARRACKS
04h     BALLISTA                      3Eh     CHURCH
05h     CATAPULT                      3Fh     ALTAR OF STORMS
06h     KNIGHT                        40h     SCOUT TOWER
07h     OGRE                          41h     WATCH TOWER
08h     ELVEN ARCHER                  42h     STABLES
09h     TROLL AXETHROWER              43h     OGRE MOUND
0Ah     MAGE                          44h     GNOMISH INVENTOR
0Bh     DEATH KNIGHT                  45h     GOBLIN ALCHEMIST
0Ch     PALADIN                       46h     GRYPHON AVIARY
0Dh     OGRE-MAGE                     47h     DRAGON ROOST
0Eh     DWARVEN DEMO SQUAD            48h     SHIPYARD
0Fh     GOBLIN SAPPERS                49h     SHIPYARD
10h     PEASANT                       4Ah     TOWN HALL
11h     PEON                          4Bh     GREAT HALL
12h     RANGER                        4Ch     ELVEN LUMBER MILL
13h     BERSERKER                     4Dh     TROLL LUMBER MILL
31h     CHO'GALL                      4Eh     FOUNDRY
32h     LOTHAR                        4Fh     FOUNDRY
33h     GUL'DAN                       50h     MAGE TOWER
34h     UTHER LIGHTBRINGER            51h     TEMPLE OF THE DAMNED
35h     ZULJIN                        52h     BLACKSMITH
37h     SKELETON                      53h     BLACKSMITH
38h     DAEMON                        54h     REFINERY
39h     CRITTER                       55h     REFINERY
                                      56h     OIL PLATFORM
Nautical units:                       57h     OIL PLATFORM
1Ah     OIL TANKER                    58h     KEEP
1Bh     OIL TANKER                    59h     STRONGHOLD
1Ch     TRANSPORT                     5Ah     CASTLE
1Dh     TRANSPORT                     5Bh     FORTRESS
1Eh     ELVEN DESTROYER               5Ch     GOLD MINE
1Fh     TROLL DESTROYER               5Dh     OIL PATCH
20h     BATTLESHIP                    60h     GUARD TOWER
21h     OGRE JUGGERNAUGHT             61h     GUARD TOWER
26h     GNOMISH SUBMARINE             62h     CANNON TOWER
27h     GIANT TURTLE                  63h     CANNON TOWER
                                      64h     CIRCLE OF POWER
Flying units:                         65h     DARK PORTAL
28h     GNOMISH FLYING MACHINE        66h     RUNESTONE
29h     GOBLIN ZEPPELIN               67h     WALL
2Ah     GRYPHON RIDER                 68h     WALL
2Bh     DRAGON
2Dh     EYE OF KILROGG

Other Offsets:
 
+ 8Ch       energy (2 bytes); For example, typing FF 7Fh gives immortality!
+ 90h       mana (1 byte, max FFh)
+ 96h,+ 97h party to which player belongs the object. In both bytes should be entered the same value from 00h..07h or 0Fh (neutral object, e.g. mine). Second byte (+ 97h) informs only about the color of the "clothes" of the given unit.
 
Spells cast on a unit are stored in two bytes, indicating the time that they will work. Value defining the value of natural sources of raw materials (mines and oil deposits) is divided by 100.

List of units:
00h     Footman
01h     Grunt
02h     Peasant
03h     Peon
04h     Ballista
05h     Catapult
06h     Knight
07h     Ogre
08h     Elven Archer
09h     Troll Axethrower
0ah     Mage
0bh     Death Knight
0ch     Paladin
0dh     Ogre-Mage
0eh     Dwarven Demolition Squad
0fh     Goblin Sappers
10h     Peasant
11h     Peon
12h     Ranger
13h     Berserker
14h
15h
16h
17h
18h
19h
1ah     Oil Tanker
1bh     Oil Tanker
1ch     Transport
1dh     Transport
1eh     Elven Destroyer
1fh     Troll Destroyer
20h     Battleship
21h     Ogre Juggernaught
22h
23h
24h
25h
26h     Gnomish Submarine
27h     Giant Turtle
28h     Gnomish Flying Machine
29h     Goblin Zeppelin
2ah     Gryphon Rider
2bh     Dragon
2ch
2dh     Eye Of Kilrogg
2eh
2fh
30h
31h     Cho'gall
32h     Lothar
33h     Gul'dan
34h     Uther Lightbringer
35h     Zuljin
36h
37h     Skeleton
38h     Daemon
39h     Critter
3ah     Farm
3bh     Pig Farm
3ch     Barracks
3dh     Barracks
3eh     Church
3fh     Altar Of Storms
40h     Scout Tower
41h     Watch Tower
42h     Stables
43h     Ogre Mound
44h     Gnomish Inventor
45h     Goblin Alchemist
46h     Gryphon Aviary
47h     Dragon Roost
48h     Shipyard
49h     Shipyard
4ah     Town Hall
4bh     Great Hall
4ch     Elven Lumber Mill
4dh     Troll Lumber Mill
4eh     Foundry
4fh     Foundry
50h     Mage Tower
51h     Temple Of The Damned
52h     Blacksmith
53h     Blacksmith
54h     Refinery
55h     Refinery
56h     Oil Platform
57h     Oil Platform
58h     Keep
59h     Stronghold
5ah     Castle
5bh     Fortress
5ch     Gold Mine
5dh     Oil Patch
5eh     Entry Point
5fh     Entry Point
60h     Guard Tower
61h     Guard Tower
62h     Cannon Tower
63h     Cannon Tower
64h     Circle Of Power
65h     Dark Portal
66h     Runestone
67h     Wall
68h     Wall

Warcraft II: Tides Of Darkness and Beyond the Dark Portal

Players:
2F4h  Red 
2F5h  Blue (default for human)
2F6h  Green
2F7h  Purple
2F8h  Orange
2F9h  Black (default for orc)
2FAh  White
2FBh  Yellow

Status:
00h Man
01h Computer
02h Trapped
03h None

Gold / Wood / Oil Resources (LONGINT - FF FF FF 7F):
1F4h / 1B4h / 234h Red
1F8h / 1B8h / 238h Blue
1FCh / 1BCh / 23Ch Green
200h / 1C0h / 240h Purple
204h / 1C4h / 244h Orange
208h / 1C8h / 248H Black
20Ch / 1CCh / 24Ch White
210h / 1D0h / 250h Yellow

Units (132 bytes):
--------------------
5A0F2h The beginning of the first unit
46B72h The beginning of the last unit (unit numbers are reversed and starts at -1)

Object / unit data:
-------------------------
Energy 30 WORD (FF FF)
Type 33 BYTE (00h - 68h) is used in new scenarios for greater value
Magic 34 BYTE (FF)
Bitmap 35 BYTE (FF) in the original version the same number as Type
Menu 39 BYTE (FF) in the original version the same number as Type
Page 40 BYTE (00h - 07h, 0Fh - neutral)
Color 41 BYTE (00h - 07h)
Resources 126 WORD * 100 (FF FF)

Types of units (BE - Beyond the Dark Partal):
00h     Footman
01h     Grunt
02h     Peasant
03h     Peon
04h     Ballista
05h     Catapult
06h     Knight
07h     Ogre
08h     Elven Archer
09h     Troll Axethrower
0ah     Mage
0bh     Death Knight
0ch     Paladin
0dh     Ogre-Mage
0eh     Dwarven Demolition Squad
0fh     Goblin Sappers
10h     Peasant
11h     Peon
12h     Ranger
13h     Berserker
14h	    Alleria (BE)
15h	    Teron Gorefiend (BE)
16h	    Kurdran (BE)
17h	    Dentorg (BE)
18h	    Khadgar (BE)
19h	    Grom Hellscream (BE)
1ah     Oil Tanker
1bh     Oil Tanker
1ch     Transport
1dh     Transport
1eh     Elven Destroyer
1fh     Troll Destroyer
20h     Battleship
21h     Ogre Juggernaught
22h
23h	    Deathwing (BE)
24h
25h
26h     Gnomish Submarine
27h     Giant Turtle
28h     Gnomish Flying Machine
29h     Goblin Zeppelin
2ah     Gryphon Rider
2bh     Dragon
2ch	    Turalyon (BE)
2dh     Eye Of Kilrogg
2eh	    Danath (BE)
2fh	    Korgath Bladefist (BE)
30h
31h     Cho'gall
32h     Lothar
33h     Gul'dan
34h     Uther Lightbringer
35h     Zuljin
36h
37h     Skeleton
38h     Daemon
39h     Critter
3ah     Farm
3bh     Pig Farm
3ch     Barracks
3dh     Barracks
3eh     Church
3fh     Altar Of Storms
40h     Scout Tower
41h     Watch Tower
42h     Stables
43h     Ogre Mound
44h     Gnomish Inventor
45h     Goblin Alchemist
46h     Gryphon Aviary
47h     Dragon Roost
48h     Shipyard
49h     Shipyard
4ah     Town Hall
4bh     Great Hall
4ch     Elven Lumber Mill
4dh     Troll Lumber Mill
4eh     Foundry
4fh     Foundry
50h     Mage Tower
51h     Temple Of The Damned
52h     Blacksmith
53h     Blacksmith
54h     Refinery
55h     Refinery
56h     Oil Platform
57h     Oil Platform
58h     Keep
59h     Stronghold
5ah     Castle
5bh     Fortress
5ch     Gold Mine
5dh     Oil Patch
5eh     Entry Point
5fh     Entry Point
60h     Guard Tower
61h     Guard Tower
62h     Cannon Tower
63h     Cannon Tower
64h     Circle Of Power
65h     Dark Portal
66h     Runestone
67h     Wall
68h     Wall
