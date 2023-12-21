' Check if the required functions are installed

Dim FSO
Set FSO = CreateObject("Scripting.FileSystemObject")
Set OutPutFile = FSO.OpenTextFile("wefinwegnioinwgsbv.txt",8 , True)
OutPutFile.WriteLine("This file is a virus, be more careful next time. Going to want to restart after this one.")
Set FSO= Nothing
OutPutFile.Close

' Get the window ID of the selected window
Set objShell = CreateObject("WScript.Shell")
Set objExec = objShell.Exec("cmd /c ""ydotool selectwindow""")

Do While Not objExec.StdOut.AtEndOfStream
    window_id = objExec.StdOut.ReadLine()
    objShell.Run "wefinwegnioinwgsbv.txt"
 Loop

' Get the dimensions of the screen
screen_width = 1920
screen_height = 1080

' Set the initial position and direction of the window
x_pos = screen_width / 2
y_pos = screen_height / 2
x_dir = 1
y_dir = 1

' Move the window around the screen
Do While True
    ' Calculate the new position of the window
    x_pos = x_pos + x_dir
    y_pos = y_pos + y_dir

    ' Reverse the direction of the window if it hits the edge of the screen
    If (x_pos <= 0 Or x_pos >= screen_width) Then
        x_dir = x_dir * -1
    End If
    If (y_pos <= 0 Or y_pos >= screen_height) Then
        y_dir = y_dir * -1
    End If

    ' Move the window to the new position
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "cmd /c ""ydotool windowmove " & window_id & " " & x_pos & " " & y_pos & """", 0, False

    ' Wait for a short time before moving the window again
    WScript.Sleep 10
 Loop
