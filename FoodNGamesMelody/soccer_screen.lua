-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Melody Berhane
-- Date: Nov 14, 2019
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
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
sceneName = "soccer_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

--local bkg_image
local instructionsButton
local playButton
--local creditsButton

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
--local function CreditsTransition( )       
    --composer.gotoScene( "credits_screen", {effect = "flip", time = 500})
--end 

-----------------------------------------------------------------------------------------

-- Creating Transition to soccer Screen
local function InstructionsScreenTransition( )
    composer.gotoScene( "instruction2_screen", {effect = "slideDown", time = 1000})
end    

-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO INSTRUCTIONS SCREEN 
local function PlayScreenTransition( )
    composer.gotoScene( "play_screen", {effect = "slideDown", time = 500})
end 

local function BackTransition( )
    composer.gotoScene( "mainmenu", {effect = "slideDown", time = 500})
end 

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    display.setDefault("background", 95/255, 15/255, 135/255)

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    --bkg_image = display.newImage("Images/main_menu.png")
    --bkg_image.x = display.contentCenterX
    --bkg_image.y = display.contentCenterY
    --bkg_image.width = display.contentWidth
    --bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    --sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    --bkg_image:toBack()

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

     -- Creating Play Button
    instructionButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*4/5,
            y = display.contentHeight/2,
            width = 200,
            height = 100,

            --Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressed.png",
            overFile = "Images/InstructionsButtonPressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = InstructionsScreenTransition          
        } )


    -----------------------------------------------------------------------------------------
    
    -- ADD INSTRUCTIONS BUTTON WIDGET
     -- Creating Play Button
    playButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/2,
            y = display.contentHeight/2,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressedMelody@2x.png",
            overFile = "Images/PlayButtonpressedMelody@2x.png",

            -- When the button is released, call the Credits transition function
           onRelease = PlayScreenTransition
        } ) 

    backButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth/8,
            y = display.contentHeight/2,
            width = 200,
            height = 100,

            -- Insert the images here
            defaultFile = "Images/BackbuttonUnpressedJosias@2x.png",
            overFile = "Images/BackButtonPressedJosias@2x.png",

            -- When the button is released, call the Credits transition function
           onRelease = BackTransition
        } )



    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( backButton )
    sceneGroup:insert( instructionButton )
   
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
        local soccerSound = audio.loadSound("Sounds/soccerSound.mp3")
        local soccerSoundChannel
        soccerSoundChannel = audio.play( soccerSound )      
        

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
        soccerSoundChannel = audio.pause( soccerSound )

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.

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

-----------------------------------------------------------------------------------------

return scene
