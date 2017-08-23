---
date: 2017-01-10T16:19:49+02:00
title: About
---

## General

Budgie Desktop is a desktop environment originally started in 2013. It aims to provide a familiar, modern and functional experience whilst getting out of the user’s way. Since its inception, the project has seen many enhancements and evolutions, as 
we continuously enhance the experience to better suit the growing needs of our users.

## History

### Budgie 2-7

Prior to version 8, the Budgie Desktop had the very simple requirements of providing a simpler, modern twist on the traditional desktop. As it gained traction, and thus users, these requirements evolved to fit the needs of the many, and not just the few.

As such, it was comprised of a tiny codebase which made heavy use of existing solutions to provide the desired experience. As those needs developed, it became clear that taking the simple non-configurable route wasn’t going to work in the long-run.

### Budgie 8

This release of Budgie was considered a major milestone in the history of the project, which sought to resolve the customisation issue. With this release, it was now possible to control various aspects of the desktop through the “Budgie Settings” 
application, as well as add and remove applets to and from the panel. This was definitely a step in the right direction, as now users could more readily “own” their desktop. Many of these new features were preview features, so that we could gain 
feedback on how best to implement them to suit the users.

### Budgie 10

In Budgie 10, we took everything we’d learned from the Budgie 2-7 days, and the feedback and knowledge of the Budgie 8 series, to fully implement the preview features. To do so, we first set about a “clean room” implementation, so that old mistakes 
wouldn’t reappear in the codebase. As a result, we gained support for multiple panels, the ability to have multiple instances of a widget on a panel, and per-widget configuration settings. Additionally, we introduced a new preview feature: Raven. This 
notifications + sidebar area was designed to solve the shortcomings of the previous Budgie Settings application, and provide more powerful notifications to the user.

## Where We’re Going

All development is incremental. When Budgie first started out way back in 2013, it had very very simple aims. It could quite easily sit on top of the GNOME 3.10 stack, and utilize all of the components with no issue. Along the way, we’ve grown, added new 
features, and improved the implementation of the desktop.

Whilst Budgie originally started out by being “lightweight”, this was never truly by design: it was simply a lack of features! Similarly, the “minimalist” look only existed due to lack of design input, as Budgie had no theming of its own.

Fast forward a few years, and Budgie is considerably more complex, with highly custom theming, animations, specific system components, as well as some preview features such as Raven that are yet to be fully integrated.

We’ve learned what we need to achieve the current goals of a familiar, beautiful, functional and modern desktop. Over time we’ve defined a very specific experience, and our vision of Budgie is still not yet met by the current iteration. As we look forward to 
the future, we look to technologies that can empower that vision.

As a result, Budgie 11, the next major release, will be built using Qt 5, C++, and Wayland. Using these technologies, we seek to provide a refined version of the experience you know and love, but with fluid, accelerated animations, a beautiful user interface, 
and full integration of Raven to be a first class component.

When we originally announced our intent to evolve Budgie by adopting Qt - we explicitly listed some technologies we wouldn’t initially use. The intent was to focus the discussion solely on Budgie itself, and not ancillary topics. This has in fact helped - and 
the conversation has been fruitful. With that said, we’ve evaluated a multitude of options, and the moral of the story is: Never say never. In terms of technical details, the “skin” of the Budgie Desktop (i.e. the UI layer itself) will be implemented using a mix of 
C++ and QtQuick, whilst all the “business logic” of Budgie will be in C++. This will allow us to take advantage of GPU-acceleration via a scene graph for a significantly richer user experience, with more elegant animations and interactions than what we 
currently have.