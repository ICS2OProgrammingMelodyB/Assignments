-----------------------------------------------------------------------------------------
--
-- play_screen.lua
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
sceneName = "Level1_screen"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local egg
local egg2
local bakingSoda
local sugar
local milk
local flour
local butter
local bowl

local eggTouched = false
local egg2Touched = false
local bakingSodaTouched = false
local sugarTouched = false
local milkTouched = false
local flourTouched = false
local butterTouched = false

local eggPreviousX
local egg2PreviousX
local bakingSodaPreviousX
local sugarPreviousX
local milkPreviousX
local flourPreviousX
local butterPreviousX

local eggPreviousY
local egg2PreviousY
local bakingSodaPreviousY
local sugarPreviousY
local milkPreviousY
local flourPreviousY
local butterPreviousY

local BowlPlaceholder

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
----------------------------------------------------------------------------------------- 

-- INSERT LOCAL FUNCTION DEFINITION THAT GOES TO BACK SCREEN

local function TouchEgg(touch)
    --only work if none of the other boxes have been touched
    if (egg2Touched == false) and 
        (bakingSodaTouched == false) and
        (sugarTouched == false) and
        (milkTouched == false) and
        (flourTouched == false) and
        (butterTouched == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            eggTouched = true

        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            
            egg.x = touch.x
            egg.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            eggTouched = false

              -- if the number is dragged into the userAnswerBox, place it in the center of it
            if (((BowlPlaceholder.x - BowlPlaceholder.width/2) < egg.x ) and
                ((BowlPlaceholder.x + BowlPlaceholder.width/2) > egg.x ) and 
                ((BowlPlaceholder.y - BowlPlaceholder.height/2) < egg.y ) and 
                ((BowlPlaceholder.y + BowlPlaceholder.height/2) > egg.y ) ) then

                -- setting the position of the number to be in the center of the box
                egg.x = BowlPlaceholder.x
                egg.y = BowlPlaceholder.y
                egg.isVisible = false
                
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            else
                egg.x = BowlPlaceholderX
                egg.y = BowlPlaceholderY

            end
        end
    end                
end 














local function AddAnswerBoxEventListeners()
    egg:addEventListener("touch", TouchEgg)
    --alternateAnswerBox1:addEventListener("touch", TouchListenerAnswerBox1)
    --alternateAnswerBox2:addEventListener("touch", TouchListenerAnswerBox2)
    --alternateAnswerBox3:addEventListener("touch", TouchListenerAnswerBox3)
end 



local function RemoveAnswerBoxEventListeners()
    egg:removeEventListener("touch", TouchEgg)
    --alternateAnswerBox1:removeEventListener("touch", TouchListenerAnswerBox1)
    --alternateAnswerBox2:removeEventListener("touch", TouchListenerAnswerBox2)
    --alternateAnswerBox3:removeEventListener("touch", TouchListenerAnswerBox3)
end 

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/Level1ScreenMelody@2x.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight
    -- show overlay with math question
    --composer.showOverlay( "level1question_screen", { isModal = true, effect = "fade", time = 100})


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -- Send the background image to the back layer so all other objects can be on top
    bkg_image:toBack()

    -- Insert the platforms
    egg = display.newImageRect("Images/EggMelody@2x.png", 100, 100)
    egg.x = display.contentWidth * 3 / 10
    egg.y = display.contentHeight * 2 / 4
        
    sceneGroup:insert( egg )

    -- Insert the platforms
    egg2 = display.newImageRect("Images/EggMelody@2x.png", 100, 100)
    egg2.x = display.contentWidth * 2 / 10
    egg2.y = display.contentHeight * 2 / 4
        
    sceneGroup:insert( egg2 )

    -- Insert the platforms
    butter= display.newImageRect("Images/ButterMelody@2x.png", 100, 100)
    butter.x = display.contentWidth * 6 / 10
    butter.y = display.contentHeight * 2 / 4
        
    sceneGroup:insert( butter )

    -- Insert the platforms
    sugar = display.newImageRect("Images/SugarMelody@2x.png", 100, 100)
    sugar.x = display.contentWidth * 7 / 10
    sugar.y = display.contentHeight * 2 / 4
        
    sceneGroup:insert( sugar)

    -- Insert the platforms
    milk = display.newImageRect("Images/MilkMelody@2x.png", 100, 100)
    milk.x = display.contentWidth * 5 / 10
    milk.y = display.contentHeight * 2 / 4
        
    sceneGroup:insert( milk )

    -- Insert the platforms
    flour = display.newImageRect("Images/FlourMelody@2x.png", 100, 100)
    flour.x = display.contentWidth * 4 / 10
    flour.y = display.contentHeight * 2 / 4
        
    sceneGroup:insert( flour )

    -- Insert the platforms
    bowl = display.newImageRect("Images/BowlMelody@2x.png", 100, 100)
    bowl.x = display.contentWidth * 1 / 10
    bowl.y = display.contentHeight * 2 / 4
        
    sceneGroup:insert( bowl )

    BowlPlaceholder = display.newImageRect("Images/BowlMelody@2x.png", 150, 150)
    BowlPlaceholder.x = display.contentWidth * 1 / 10
    BowlPlaceholder.y = display.contentHeight * 2 / 4

    sceneGroup:insert(BowlPlaceholder)

    -- Insert the platforms
    bakingSoda = display.newImageRect("Images/BakingSodaMelody@2x.png", 150, 150)
    bakingSoda.x = display.contentWidth * 8 / 10
    bakingSoda.y = display.contentHeight * 2 / 4

        
    sceneGroup:insert( bakingSoda )


    -----------------------------------------------------------------------------------------

    -- Associating button widgets with this scene


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
        AddAnswerBoxEventListeners()

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

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        RemoveAnswerBoxEventListeners()
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
