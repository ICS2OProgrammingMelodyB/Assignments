-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Melody Berhane
-- Date: Nov 05, 2019
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )

----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------
 
-- The local variables for this scene
local CompanyLogo
local scrollXSpeed = 6
local jungleSounds = audio.loadSound("Sounds/animals144.mp3")
local jungleSoundsChannel
local bkg_image

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------

-- The function that moves the beetleship across the screen
local function moveCompanyLogo()
    CompanyLogo.x = CompanyLogo.x + scrollXSpeed
end

-- The function that will go to the main menu 


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

     -----------------------------------------------------------------------------------------
    -- BACKGROUND AND DISPLAY OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    display.setDefault("background", 47/255, 5/255, 255/255)

    --bkg_image = display.newImageRect("Images/background.png", display.contentWidth, display.contentHeight)
    --bkg_image.x = display.contentCenterX
    --bkg_image.y = display.contentCenterY
    --bkg_image.width = display.contentWidth
    --bkg_image.height = display.contentHeight

    -- Associating display objects with this scene 
    --sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    --bkg_image:toBack()

    -- Insert the beetleship image
    CompanyLogo = display.newImageRect("Images/CompanyLogoMelody@2x.png", 700, 700)

    -- set the initial x and y position of the beetleship
    CompanyLogo.x = 100
    CompanyLogo.y = display.contentHeight/2

    -- Insert objects into the scene group in order to ONLY be associated with this scene
    sceneGroup:insert( CompanyLogo )

end -- function scene:create( event )

--------------------------------------------------------------------------------------------

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

    elseif ( phase == "did" ) then
        -- start the splash screen music
        jungleSoundsChannel = audio.play(jungleSounds )

        -- Call the moveBeetleship function as soon as we enter the frame.
        Runtime:addEventListener("enterFrame", moveCompanyLogo)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        
        -- stop the jungle sounds channel for this screen
        audio.stop(jungleSoundsChannel)
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
