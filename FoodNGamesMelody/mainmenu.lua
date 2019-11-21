-----------------------------------------------------------------------------------------
--
-- mainmenu.lua
-- Created by: Melody Berhane
-- Date: Nov 14, 2019
-- Description: This is the main menu, displaying the credits, soccer, back & bake buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "mainmenu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local bakeButton
local soccerButton
local MuteButton
local UnmuteButton
local creditsButton


-----------------------------------------------------------------------------------------
-- LOCAL SOUND
-----------------------------------------------------------------------------------------
local mainmenuSound = audio.loadSound("Sounds/mainmenuSound.mp3")
local mainmenuSoundChannel

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "flip", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to soccer Screen
local function SoccerScreenTransition( )
    composer.gotoScene( "soccer_screen", {effect = "slideDown", time = 1000})
end    

-- Creating Transition to bake Screen 
local function BakeScreenTransition( )
    composer.gotoScene( "bake_screen", {effect = "slideDown", time = 500})
end

-- making the music to pause when the mute button is clicked
local function MuteListener(touch)
    if (touch.phase == "ended") then
        UnmuteButton.isVisible = true
        MuteButton.isVisible = false
        -- Play the correct soud on any available channel
        mainmenuSoundChannel = audio.pause( mainmenuSound )
    end
end

-- making the music to play when the unmute button is clicked
local function UnmuteListener(touch)
    if (touch.phase == "ended") then
        UnmuteButton.isVisible = false
        MuteButton.isVisible = true
        -- Play the correct soud on any available channel
        mainmenuSoundChannel = audio.play( mainmenuSound )
    end
end 

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    --creating the unmute button
    UnmuteButton = display.newImageRect("Images/UnmuteButtonMelody@2x.png", 198, 98)
    UnmuteButton.x = display.contentWidth/2
    UnmuteButton.y = display.contentHeight*1/10
    UnmuteButton.isVisible = false

    -- creating the mute button
    MuteButton = display.newImageRect("Images/MuteButtonMelody@2x.png", 198, 98)
    MuteButton.x = display.contentWidth/2
    MuteButton.y = display.contentHeight*1/10
    MuteButton.isVisible = true

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuLogan@2x.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating soccer Button
    soccerButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*4/5,
            y = display.contentHeight/2,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/SoccerButtonUnpressedMelody@2x.png",
            overFile = "Images/SoccerButtonPressedMelody@2x.png",

            -- When the button is released, call the soccer screen transition function
            onRelease = SoccerScreenTransition          
        } )

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            --Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight/2,
            width = 200,
            height = 100,

            --Insert the images here
            defaultFile = "Images/CreditsButtonUnPressedJosias@2x.png",
            overFile = "Images/CreditsButtonPressedJosias@2x.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 
    
     -- Creating bake Button
    bakeButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/8,
            y = display.contentHeight/2,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/BakingButtonUnpressedMelody@2x.png",
            overFile = "Images/BakingButtonPressedMelody@2x.png",

            -- When the button is released, call the bake transition function
            onRelease = BakeScreenTransition
        } ) 

    

    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( soccerButton )
    sceneGroup:insert( bakeButton )
    sceneGroup:insert( MuteButton )
    sceneGroup:insert( UnmuteButton )
   
    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP

end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).   
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then 
        mainmenuSoundChannel = audio.play( mainmenuSound, {loops = -1} )
        MuteButton:addEventListener("touch", MuteListener) 
        UnmuteButton:addEventListener("touch", UnmuteListener)      
        

    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
     local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        mainmenuSoundChannel = audio.pause( mainmenuSound ) 
        MuteButton:removeEventListener("touch", MuteListener)
        UnmuteButton:removeEventListener("touch", UnmuteListener)

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.\ 
    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
----------------------------------------------------------------------------------------
return scene
