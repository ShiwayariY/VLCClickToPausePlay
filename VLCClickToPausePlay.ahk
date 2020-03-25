vlcclickenable := 1

vlcconditions() {
	WinGetActiveTitle, title
	StringRight, titleend, title, 16
	if (titleend = "VLC media player") {
		MouseGetPos, , , , ctrl
		StringLeft, ctrlstart, ctrl, 16
		if (ctrlstart = "VLC video output" or ctrl = "QWidget7") {
			return 1
		}
	}
	return 0
}

#If WinActive("ahk_exe vlc.exe") && vlcconditions() = 1

LButton::
if(vlcclickenable = 1) { ;prevent double-click to fullscreen
	Click
	vlcclickenable = 0
	SetTimer, vlcclicktimer, -800
}
Send {Space}
return

vlcclicktimer:
vlcclickenable = 1
return

#If

~^!r::
Menu, Tray, Icon
Reload
return

~^!y::
Menu, Tray, NoIcon
return