---
author: "Ikey Doherty"
categories:
- development
date: 2017-01-25T00:15:01Z
title: "Kicking off Budgie 11"
url: /2017/01/25/kicking-off-budgie-11
---

With the Budgie website now up and running, let us turn our focus to the development of Budgie 11 itself. It's no secret that we've been very busy over in Solus land, focusing on the base layers of the operating
system. We did also promise we'd be kicking off the year with a focus on the next major release in the Budgie Desktop project, with version 11.

However, we've also thought long and hard about exactly what we want Budgie 11 to be, how it looks, and how we want to deliver the best experience to our users. It's also no secret that for a while we've planned to
decouple Budgie from GNOME over a series of releases.

## Explaining the deGNOMEing

Originally, Budgie intended to integrate with GNOME applications. What actually happened is that it then fully integrated into the GNOME stack. We got our integration, but at a heavy cost. Over time, as GNOME has evolved,
every single major release of GNOME has caused issues for Budgie. This is from 3.10, when Budgie first began, all the way through to GNOME 3.22. Whether it's API or ABI changes, components eating other components (such
as Mutter folding in `cogl` and `clutter`), many, many theme and widget breakages, `GdkScreen` APIs no longer functioning the same, or even segfaults caused due to the behaviour of `GSettings` relocatable schemas being
changed.. You get the idea.

Let it be known, this post is not designed to insult or belittle GNOME. The fact of the matter is, as a project, I have tremendous respect for GNOME. They have a vision and intend to see it through. Unfortunately, this has
made it difficult for a project with the complexity of Budgie to then reuse those same components of GNOME. For simpler projects, reusing parts of the GNOME stack is very trivial, as we know from our own origins. However,
once you grow in complexity, have deep settings & configurability, multiple panels, a stable ABI and a proper plugin API system with support for dynamic applets that may also have per instance data, the picture quickly becomes
far more complicated.

At this moment in time, the core remaining reason for Budgie even "working" on the GNOME stack, is that it expends an awful lot of effort pretending to be GNOME Shell. To give an architectural insight, consider this small example.
To display device & volume notifications, the GNOME Settings Daemon sends a message to the `org.gnome.Shell` name on D-BUS. In our case this has to be `budgie-wm`, which has to pretend to be `org.gnome.Shell` for keyboard layouts
and shortcuts to work with GNOME Settings Daemon.. Unfortunately, you cannot provide normal GTK+ widgets within the Mutter process (`budgie-wm`), so then we forward this notification onto the GTK+ process, `budgie-daemon`.
The same is also true for the `EndSessionDialog`, and various other pieces.

It didn't start out like this of course, but as the GNOME platform evolves, so must derived desktops to maintain the integration. As such, our roadmap for Budgie 11 set the priority of undoing this deep coupling to the GNOME
stack, and moving away from Vala, to regain control over the experience, feature-set, and stability, of the Budgie Desktop.

## Retrospective Q&A.

After many, many, many back and forth discussions, we asked ourselves some important questions. These would help us in turn to determine exactly what we were happy to use and work with.

**Is the C vs C++ comparison valid?**

I've long said that I personally prefer C to C++ and would rather avoid C++. However, we are not talking about _pure_ C here. What we are talking about, is mostly `C89` glib code, with enormous amounts of boilerplate, defunct concepts (in modern C),
and a great deal more time to develop than "normal C" (i.e. `C11` / `C99`).

**Does GTK+ do what we need?**

Ish. We actually do need a more powerful toolkit for the desktop, and GTK+ clearly develops in the direction of the parent GNOME Desktop experience (such as internal GNOME Shell knowledge + interactions within GTK).

Ideally, we want a more powerful toolkit for graphics, effects, OpenGL, shaders, etc. Blingbits aside, the layout system of GTK+ is woefully limited, with a lazy caching approach to widget position and sizes, making real time animations, or panel
based child windows, difficult. Implementing an effective, custom layout suitable to panels also involves an excessive amount of boiler plate by rolling your own `GtkContainer`.

Recent API additions to GTK+ over the last few years have also remained within the closed loop of GTK+ itself, making them inaccessible (and in certain cases, useless) to external developers, such as GTK+ CSS nodes, Wayland positioning of windows,
GtkPopover having an explicit private relationship to the internals of a `GtkWindow`, etc.

**Does Mutter do what we need?**

In as much as it provides window management and a compositor, yes. Long term, supporting a multiprocess architecture with external panels, and the ability to extend the Wayland protocols, it does not. Plugging in features such as quarter tiling, or 
indeed even panel placement under Wayland, is not possible.

**Do we want GNOME integration?**

Yes and no. We still really love and want the GNOME applications. We want to approach integration from a better architectural stance. We don't necessarily want to piggyback on cherry-picked elements of the GNOME ecosystem that are designed 
for the GNOME Desktop experience.

**Do we want a custom toolkit?**

While it would be lovely in an ideal world to have a tiny "shell toolkit", as it were, this is certainly not sustainable. There are other options out there.

**Why not fork GTK/GNOME?**

Unnecessary technical debt. The amount of work required would be an ongoing nightmare, as the first thing we'd be doing is ripping out years of legacy support code and attempting modernisation. Best to reuse good technology where possible, 
and for the other bits we can port the older code/concepts of Budgie 10 to clean, modern code. Forking isn't always the solution. We certainly don't want or need to be maintaining general purpose toolkits to then only use in Budgie.

## The candidates

**EFL/Enlightenment**

Highly efficient toolkit, very capable. Unfortunately, by default the appearance would require a tremendous amount of effort to be visually acceptable for use in Budgie, and the API has similar ugly issues to GLib 
(such as the use of custom boolean types, additionally, macro based `main()` functions, etc.)

**Qt**

Very popular, very capable. Much larger than the alternatives, because it is a _platform_, not a _toolkit_. It is C++ though, and there are less readily usable/available bindings.

## Picking a winner: Qt

In the end, Qt fits the needs most readily for Budgie, going forward. It should be made clear though, that a number of things **won't** be happening through the adoption of Qt:

- ~~We will not be using QML. The desktop core should not be using JS, C++ only.~~ Further details on usage of QML on our [About](/about) page.
- This restriction will not apply to third party widget authors. We're focusing on a lean and mean core.
- We will not be using KDE libraries. Budgie has a specific focus and plan.
- We do not intend to provide Plasma compatibility, we are still going to look to GNOME applications.
- We will also ensure that there is desktop consistency, nothing will feel "out of place".

I really do hope that this post is not misconstrued, we're picking here based on what is the most appropriate solution for Budgie Desktop, for a stable, reliable, performant experience in line with our roadmap and intended features.

As I previously said, I have a great deal of respect for GNOME as a project, and have contributed both financially and through code (I actually wrote the `GtkStackSidebar` widget) - and have advocated the use of the GNOME platform, 
and to not fork, with Budgie being an example of this.

However, Budgie has grown _significantly_ over the last 3 years, and we find our needs at loggerheads with the needs and direction of GNOME. Instead of being ungrateful, we graciously bow our heads in respect to GNOME, and 
upscale the stack to meet the requirements of the Budgie Desktop in 2017.

In closing, I'd like to thank everyone for their continued support of Budgie, and I know the Budgie crew are really excited/impatient to get the ball rolling. We look forward to implementing this transition, **effective immediately**, 
to deliver to you the desktop experience you deserved all along.

Get ready, for Budgie 11!