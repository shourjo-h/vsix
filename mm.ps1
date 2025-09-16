Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class MouseMover {
    [DllImport("user32.dll", CharSet = CharSet.Auto, CallingConvention = CallingConvention.StdCall)]
    public static extern void mouse_event(uint dwFlags, int dx, int dy, uint cButtons, uint dwExtraInfo);

    private const uint MOUSEEVENTF_MOVE = 0x0001;

    public static void MoveMouse() {
        mouse_event(MOUSEEVENTF_MOVE, 1, 0, 0, 0);
        mouse_event(MOUSEEVENTF_MOVE, -1, 0, 0, 0);
    }
}
"@

while ($true) {
    [MouseMover]::MoveMouse()
    Start-Sleep -Seconds 10
}
