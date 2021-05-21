# PSO2 Grinders Buying
![Screenshot](/Screenshot.png?raw=true "Screenshot")

# Important
Run this script as administrator for NA version if virtual keypresses are not picked up by the game.

# Updates from upstream
- Excube limit mode is added
- Fixed calculation mistake in code which was counting grinder bought per loop as 999 when in reality you only buy 990 grinder each time in the game
- Added excube used information to various status texts

# My Modifications
- Adjusted Server Action Delay by 1000ms
- Change targeted storage to Default Storage
- Removed Selling Function

# Important note
- It is best to bring this program to foreground with F1 to perform tasks while you're in the game.
- Because alt tabbing might mess up with selections in the game.
- And it is important that you don't input anything into the game while the script is running.

# How To use

Buying Process
- Walk to EX-Cube Exchanger NPC
- Position yourself where interaction is targeted.
- Click Start Buying.

*You must set your inventory to material tab and have no items prior to starting this script. 

You can set how much meseta you want firstly and the script will only buy enough grinders to reach your targeted meseta.
- 1 means 1 million meseta target
- 0 means no target and the script will buy the max amount of grinders
- Maximum is 25 milliions target because that's around the maximum amount of grinders your mat stroage can handle.

*You can also see the amount of grinders you have bought and meseta amount of it in the GUI so if you're only buying for a small amount of money you can end the buying process sooner by clicking Stop Buying button.

Selling Process
- Go to any NPC where you can sell items.
- Sell Items from Storage > Material Storage
- Have grinders as your selection
- Click Start Selling.
