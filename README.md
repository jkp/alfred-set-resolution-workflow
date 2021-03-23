# Set Resolution Workflow for Alfred App

_Note this fork is a WIP; it attempts to update to work with Alfred 4_

Handy workflow to change between available screen resolutions, even between normal and HiDPI mode (Retina).

It allows you to list and search available resolutions for each connected display, and action the result to do the change. The change persists between logout (ex: restart, shutdown, etc).

It filter's out duplicated resolutions where a retina resolution is available, for example, if you have available 1280x960 in both retina and non-retina, you'll only see the retina option; no need to set the pixelated one.

## Usage

Type the keyword ```setresolution``` to show a list of resolutions. You'll see that the first result is actually a non-actionable result which shows the current resolution.

![list](https://raw.github.com/ramiroaraujo/alfred-set-resolution-workflow/master/screenshots/list.png)

If you have more than one display, you'll see instead the displays to select, and by actioning on any display the workflow will reload with the display index and after the keyword, and ready to search/select the proper resolutions. When using multiple displays, the display index _is_ needed, but you can write it down yourself to make it faster, like ```setresolution 1 1280``` to search for 1280 on display index 1 (the second from the list)

![displays](https://raw.github.com/ramiroaraujo/alfred-set-resolution-workflow/master/screenshots/displays.png)

You can also type after the space to search for resolutions (searches the numbers).

![search](https://raw.github.com/ramiroaraujo/alfred-set-resolution-workflow/master/screenshots/search.png)

The available resolutions list is usually quite large. You can delete available resolutions from the list by actioning the result while holding the ```⌥ (alt)``` key.

![remove](https://raw.github.com/ramiroaraujo/alfred-set-resolution-workflow/master/screenshots/remove.png)

If you connect a different display, or want to undo a deleted resolution you need to reset the list by actioning the keyword ```resetresolution```

![reset](https://raw.github.com/ramiroaraujo/alfred-set-resolution-workflow/master/screenshots/reset.png)

## Installation
Download the [alfred-set-resolution.alfredworkflow](https://github.com/jkp/alfred-set-resolution-workflow/raw/master/alfred-set-resolution.alfredworkflow) and import to Alfred 2.

## Credits

Build around a modified version [(my fork)](https://github.com/ramiroaraujo/ResolutionMenu) of a fork of Robbert Klarenbeek's [ResolutionMenu](https://github.com/robbertkl/ResolutionMenu) app, by [Anthony Dervish](https://github.com/antmd/ResolutionMenu).

## Changelog
* _2021-03-23_ - Ported to Alfred 4
* _2014-02-24_ - Released
