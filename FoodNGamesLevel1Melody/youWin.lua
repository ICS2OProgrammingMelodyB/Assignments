-----------------------------------------------------------------------------------------
--
-- youWin.lua
-- Created by: Melody Berhane
-- Date: Nov. 25th, 2019
-- Description: This is the you win screen
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
sceneName = "youWin"

-- Creating Scene Object
local scene = composer.newScene( sceneName ) -- This function doesn't accept a string, only a variable containing a string

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local homeButton
local bkg_image
local bottomLeft
local bottonMiddle1
local bottonMiddle2
local bottomRight
local middleleft
local middleMiddle
local middleRight
local topLeft
local topRight

----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------------------------------------
-- Creating Transition to play Screen
local function HomeTransition( )
    composer.gotoScene( "mainmenu", {effect = "slideDown", time = 500})
end 

-----------------------------------------------------------------------------------------
-- DISPLAY OBJECTS
-----------------------------------------------------------------------------------------


-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/youWin.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight

    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Credits Button
    homeButton = widget.newButton( 
        {
            --Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*7/8,
            width = 200,
            height = 100,

            --Insert the images here
            defaultFile = "Images/HomeUnpressedMelody@2x.png",
            overFile = "Images/HomePressedMelody@2x.png",

            -- When the button is released, call the Credits transition function
            onRelease = HomeTransition
        } ) 

    sceneGroup:insert( homeButton )

    -- Insert the platforms
    bottomLeft = display.newImageRect("Images/CakeBottomLeft.png", 300, 200)
    bottomLeft.x = display.contentWidth *  7.75 / 10
    bottomLeft.y = display.contentHeight * 8.5 / 10
    bottomLeft.isVisible = true
        
    sceneGroup:insert( bottomLeft )

    -- Insert the platforms
    bottonMiddle1 = display.newImageRect("Images/BowlMelody@2x.png", 150, 150)
    bottonMiddle1.x = display.contentWidth * 1 / 10
    bottonMiddle1.y = display.contentHeight * 2 / 4
    bottonMiddle1.isVisible = true
        
    sceneGroup:insert( bottonMiddle1 )
    

    bottonMiddle2 = display.newImageRect("Images/BowlMelody@2x.png", 150, 150)
    bottonMiddle2.x = display.contentWidth * 1 / 10
    bottonMiddle2.y = display.contentHeight * 2 / 4
    bottonMiddle2.isVisible = true
   
    sceneGroup:insert(bottonMiddle2)

    -- Insert the platforms
    bottomRight = display.newImageRect("Images/BowlFilledMelody@2x.png", 150, 150)
    bottomRight.x = display.contentWidth * 1 / 10
    bottomRight.y = display.contentHeight * 2 / 4
    bottomRight.isVisible = true
        
    sceneGroup:insert( bottomRight )

    -- Insert the platforms
    middleleft = display.newImageRect("Images/EggMelody@2x.png", 100, 100)
    middleleft.x = display.contentWidth * 3 / 10
    middleleft.y = display.contentHeight * 2 / 4
    middleleft.isVisible = true
        
    sceneGroup:insert( middleleft )

    -- Insert the platforms
    middleMiddle = display.newImageRect("Images/EggMelody@2x.png", 100, 100)
    middleMiddle.x = display.contentWidth * 2 / 10
    middleMiddle.y = display.contentHeight * 2 / 4
    middleMiddle.isVisible = true
        
    sceneGroup:insert( middleMiddle )

    -- Insert the platforms
    middleRight= display.newImageRect("Images/ButterMelody@2x.png", 100, 100)
    middleRight.x = display.contentWidth * 6 / 10
    middleRight.y = display.contentHeight * 2 / 4
    middleRight.isVisible = true
        
    sceneGroup:insert( middleRight )

    -- Insert the platforms
    topLeft = display.newImageRect("Images/SugarMelody@2x.png", 100, 100)
    topLeft.x = display.contentWidth * 7 / 10
    topLeft.y = display.contentHeight * 2 / 4
    topLeft.isVisible = true
        
    sceneGroup:insert( topLeft)

    -- Insert the platforms
    topRight = display.newImageRect("Images/MilkMelody@2x.png", 100, 100)
    topRight.x = display.contentWidth * 5 / 10
    topRight.y = display.contentHeight * 2 / 4
    topRight.isVisible = true
        
    sceneGroup:insert( topRight )

end

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
        

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        local Win = audio.loadSound("Sounds/yabbadabbalaugh.wav")
        local WinChannel
        WinChannel = audio.play( Win )
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
        gameOverChannel = audio.stop( win )

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end --function scene:destroy( event )

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