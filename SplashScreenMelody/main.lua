-----------------------------------------------------------------------------------------
--Title: SplashScreen
-- Name:  Melody Berhane
-- Course: ICS2O
-- This program calls the splash screen of the app to load itself.
-- main.lua
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )
