---
author: "Joshua Strobl"
categories:
- development
date: 2017-04-19T02:24:03+03:00
title: "Release of Budgie 10.3"
url: /2017/04/19/release-of-budgie-10-3
---

We're happy to announce the release of Budgie 10.3. Budgie 10.3 is the last incarnation of the 10.x series, with only minor updates to the 10.3 releases being planned, and opening the door for development of the Qt 5-based Budgie 11.

### Alt+Tab

{{< altimg "/2017/04/Budgie_AltTab.jpg" >}}

Budgie 10.3 features our new Alt+Tab implementation, eliminating previous issues with our alt+tab and enabling a faster, prettier, and more reliable window switching experience. This implementation is thanks to a significant community contribution, done during our first implementation competition that provided a monetary award of 500 EUR, and further improvements done to the user interface of it.

### Customization

{{< altimg "/2017/04/Budgie_ClockApplet.jpg" >}}

Clock Applet received customization options in this release, enabling the ability to show the date, seconds, as well as the option for 24 hour time.

{{< altimg "/2017/04/Budgie_Button_Layout.jpg" >}}

We have also added the ability to choose between left and right window button layouts via Budgie Settings.

### Fixes for GTK 3.22

Budgie 10.3 features numerous fixes for GTK 3.22. For starters, Budgie Menu and other popovers will no longer appear to move from the top to the bottom of your screen when the Budgie panel is located on the bottom. We have also resolved an animation issue from GTK 3.22 where popovers would animate twice.

{{< altimg "/2017/04/Budgie_RunDialog.jpg" >}}

Lastly, the Run Dialog will no longer appear "stumpy" on GTK 3.22.

### MPRIS Artwork

{{< altimg "/2017/04/Budgie_Spotify.jpg" >}}

In Budgie 10.3, we now support the downloading of artwork for our MprisClient and adding code to prevent such artwork from being loaded twice. This can be noticed the most when playing content via Spotify!

### Other Fixes and Improvements

On the Budgie applets front, we have:

- Resolved the inability to pin GNOME Twitch via the Icon Tasklist
- Resolved incorrect vertical alignment of the Clock Applet
- Now ensure tray icons are evenly spaced, as a result of syncing our natray with upstream gnome-panel.
- Improvements have been made to the Places applet
  - Support for encrypted volumes and remote (S/FTP, SMB) shares.
  - Clicking on S/FTP bookmarks now open them in the default file manager.

For Raven, we fixed the notification spam that'd occur during start up notifying the user they're connected to the network. No more red notification bell on startup!

For `budgie-wm`, a crash has been fixed that would occur when the current locale was deleted.