#maxThreadsPerHotkey, 2
GrinderMaxBuyAmount := 100
GrinderSellAmount := 0
TargetMeseta := 0
ExcubeLimit := 0
toggle := false
toogle1 := false




WinGet, programid, List, Phantasy Star Online 2
Gui, Main:add, Text,r5 x15 y5 w225 Center vStatus,Idle.... `n Press F1 to insta-focus this program `n Press F4 to force close this program. `n Press F2 to see instuctions and script. `n Press F6 to reload program.
Gui, Main:Add, Radio, vLimitRadioGroup1 gExcubeLimit, Excube Limit (max 2100) -
Gui, Main:Add, Radio, vLimitRadioGroup2 gMesetaLimit, Meseta Target (in millions) -
SetFormat,float,0
VarEdit = 0
Var:=(varedit*100)
Gui, Main:Add, Edit, x170 y72 w50 right number readonly vVar,%var%
Gui, Main:Add, UpDown, -2 hp x+0 wrap vExcubeTarget gVarEdit Range0-21,%varedit%
Gui, Main:Add, Edit, x180 y97 w40 right number readonly
Gui, Main:Add, UpDown, vTargetMeseta Range0-25, 0
Gui, Main:add, button, x15 y120 w100 h25 vBuyBtn gStartBuying, Start Buying
Gui, Main:add, button, x130 y120 w100 h25 vBreakBtn gBreak, Stop Buying
Gui, Main:Default
Gui, -sysmenu
gui, Main:show,,PSO2 Grinders Buying
GuiControl,Disable,ExcubeTarget
GuiControl,Disable,TargetMeseta


return

VAREDIT:
var:=(ExcubeTarget*100)
GuiControl,,var,%var%
RETURN

ExcubeLimit:
GuiControl,Enable,ExcubeTarget
GuiControl,Disable,TargetMeseta
GuiControl,, TargetMeseta, 0
return

MesetaLimit:
GuiControl,Disable,ExcubeTarget
GuiControl,Enable,TargetMeseta
GuiControl,, ExcubeTarget, 0
GuiControl,,var,0
return



StartBuying: ;Button Action
GuiControl,Disable,LimitRadioGroup1
GuiControl,Disable,LimitRadioGroup2
GuiControl,Disable,BuyBtn
GuiControlGet, TargetMeseta
GuiControlGet, ExcubeTarget
If (TargetMeseta > 0){
	TargetMeseta := TargetMeseta*1000000
	GrinderMaxBuyAmount := (TargetMeseta//399600)+1
	UpdateStatus("Target Meseta Amount - " . RegExReplace(TargetMeseta, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " `n Buying " . GrinderMaxBuyAmount * 990 . " More Grinders...")
	GuiControl,Disable,TargetMeseta
}
	else if (ExcubeTarget > 0){
	ExcubeTarget := ExcubeTarget*100
	GrinderMaxBuyAmount := (ExcubeTarget//33)
	UpdateStatus("Target Excube Amount - " . RegExReplace(ExcubeTarget, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " `n Buying " . GrinderMaxBuyAmount * 990 . " More Grinders...")
	GuiControl,Disable,ExcubeTarget
	}
	else {
	UpdateStatus("Buying " . GrinderMaxBuyAmount * 990 . " More Grinders...")
	GuiControl,Disable,TargetMeseta
	GuiControl,Disable,ExcubeTarget
}
toggle := true
	While toggle = true
		if (GrinderMaxBuyAmount > 0){
			ControlSend,, {e}, ahk_id %programid1%;Open NPC
			Sleep, 1000
			ControlSend,, {Enter}, ahk_id %programid1% ;Open Shop (Server Action)
			Sleep, 1750
			ControlSend,, {Left}, ahk_id %programid1% ;Max Buy
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1% ;Purchase
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1% ;Confirm Purchase (Server Action)
			Sleep, 600
			ControlSend,, {Enter}, ahk_id %programid1% ;Close Purchase Complete
			Sleep, 300
			ControlSend,, {Esc}, ahk_id %programid1% ;Close Shop
			Sleep, 300
			ControlSend,, {Esc}, ahk_id %programid1% ;Close NPC	
			Sleep, 300
			ControlSend,, {i}, ahk_id %programid1% ;Open Inventory
			Sleep, 450
			ControlSend,, {Shift}{Enter}, ahk_id %programid1% ;Select all of first item stack
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1% ;Open item menu
			Sleep, 300
			ControlSend,, {Enter}, ahk_id %programid1% ;Deposit
			Sleep, 450
			ControlSend,, {Esc}, ahk_id %programid1% ;Close menu for re-run
			Sleep, 300
			--GrinderMaxBuyAmount
			++GrinderSellAmount
			UpdateStatus("Buying " . RegExReplace(GrinderMaxBuyAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,")   . " More Grinders... `n" . RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " grinders bought `n" . RegExReplace(GrinderSellAmount*990*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " meseta worth `n" . RegExReplace(GrinderSellAmount*33, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " excubes used"  )
			}
		else {
			UpdateStatus("Ready to sell " . RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " Grinders `n" . RegExReplace(GrinderSellAmount*990*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " meseta worth `n" . RegExReplace(GrinderSellAmount*33, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " excubes used" )
			GuiControl,Disable,BuyBtn
			MsgBox, 0, Grinders Bought!,% RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") " Grinders bought"
			Return
			}
	; This case needed in case the loop is interrupted by a toggle
	UpdateStatus("Ready to sell " . RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " Grinders `n" . RegExReplace(GrinderSellAmount*990*400, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") . " meseta worth"  )
	MsgBox, 0, Grinders Bought!,% RegExReplace(GrinderSellAmount*990, "(\G|[^\d.])\d{1,3}(?=(\d{3})+(\D|$))", "$0,") " Grinder bought"
	Return

Break: ;Button Action
toggle := false ;while loop will stop with this
return

Reload: ;reload function
reload
return

UpdateStatus("Idle.... `n Press F1 to insta-focus this program `n Press F4 to force close this program. `n Press F2 to see instuctions and script. `n Press F6 to reload program.")
GuiControl,Enable,BuyBtn
GuiControl,Enable,BreakBtn
GuiControl,Enable,TargetMeseta
GuiControl,Enable,ExcubeTarget
toggle := false ;while loop will stop with this
return

UpdateStatus(status)
{
	GuiControl,,Status,%status%
}

#WinActivateForce
F1::WinActivate, PSO2 Grinders Buying
return

F2::Run https://github.com/NatsumeLS/PSO2-AHK-Grinders-Buying-Selling/blob/master/readme.md
return 

F4::ExitApp

F6:: Reload
