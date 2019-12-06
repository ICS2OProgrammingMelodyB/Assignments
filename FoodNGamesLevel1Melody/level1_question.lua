-----------------------------------------------------------------------------------------
--
-- level1_screen.lua
-- Created by: Melody Berhane
-- Date: December 5, 2019
-- Description: This is the level 1 screen of the game. the charater can be dragged to move
--If character goes off a certain araea they go back to the start. When a user interactes
--with piant a trivia question will come up. they will have a limided time to click on the answer
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Libraries
local composer = require( "composer" )
local widget = require( "widget" )
local physics = require( "physics")


-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "level1_question"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

-- The local variables for this scene
local randomQuestion

local questionText

local letter1
local letter2
local letter3

local correctLetter1 
local correctLetter2 
local correctLetter3 

local userLetter1
local userLetter2
local userLetter3

local numLettersCompleted = 0
local points = 0
local lives = 3


local letter1Touched = false
local letter2Touched = false
local letter3Touched = false

local letter1PreviousX
local letter2PreviousX
local letter3PreviousX

local placeholderL1
local placeholderL2
local placeholderL3

local placeholderL1Filled = false
local placeholderL2Filled = false
local placeholderL3Filled = false

local answerPosition = 1
local bkg
local cover

local X1 = display.contentWidth*2/7
local X2 = display.contentWidth/2
local X3 = display.contentWidth*5/7
local Y1 = display.contentHeight*1/3
local Y2 = display.contentHeight*2/3

local textTouched = false

-----------------------------------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

--making transition to next scene
local function BackToLevel1() 
    composer.hideOverlay("crossFade", 400 )
  
    ResumeLevel1()
end 


local function CheckUserAnswerInput()
    if (userLetter1.text == correctLetter1.text) and
        (userLetter2.text == correctLetter2.text) and
        (userLetter3.text == correctLetter3.text) then
        print ("****correct")
        -- They got it right
        points = points + 1
        points.text = "Points = " .. points + 1
        if (points == 5)then
            BackToLevel1()
        end
    else
        lives = lives - 1
        lives.text = "lives = " .. lives - 1
    end
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerLetter1(touch)
    --only work if none of the other boxes have been touched
   if (letter2Touched == false) and (letter3Touched == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            letter1Touched = true

        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            
            letter1.x = touch.x
            letter1.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            letter1Touched = false

              -- allow  the letter to be dragged into any place holder 
            if (((placeholderL1.x - placeholderL1.width/2) < letter1.x ) and
                ((placeholderL1.x + placeholderL1.width/2) > letter1.x ) and 
                ((placeholderL1.y - placeholderL1.height/2) < letter1.y ) and 
                ((placeholderL1.y + placeholderL1.height/2) > letter1.y ) and 
                (placeholderL1Filled == false)) then

                -- setting the position of the number to be in the center of the box
                letter1.x = placeholderL1.x
                letter1.y = placeholderL1.y
                placeholderL1Filled = true
                numLettersCompleted = numLettersCompleted + 1
                userLetter1 = letter1
                letter1:removeEventListener( "touch", TouchListenerLetter1 )
                print ("***TouchListenerLetter1: placeholderL1Filled is true")
                if (numLettersCompleted == 3) then
                    CheckUserAnswerInput()
                    DisplayQuestion()
                    letter1:addEventListener("touch", TouchListenerLetter1)
                    print ("****CheckUserAnswerInput")
                end
                
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            elseif (((placeholderL2.x - placeholderL2.width/2) < letter1.x ) and
                ((placeholderL2.x + placeholderL2.width/2) > letter1.x ) and 
                ((placeholderL2.y - placeholderL2.height/2) < letter1.y ) and 
                ((placeholderL2.y + placeholderL2.height/2) > letter1.y ) and 
                (placeholderL2Filled == false)) then

                -- setting the position of the number to be in the center of the box
                letter1.x = placeholderL2.x
                letter1.y = placeholderL2.y
                placeholderL2Filled = true
                numLettersCompleted = numLettersCompleted + 1
                userLetter2 = letter1
                letter1:removeEventListener( "touch", TouchListenerLetter1 )
                print ("***TouchListenerLetter1: placeholderL2Filled is true")
                if (numLettersCompleted == 3) then
                    CheckUserAnswerInput()
                    DisplayQuestion()
                    letter1:addEventListener("touch", TouchListenerLetter1)
                    print ("****CheckUserAnswerInput")
                end
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            elseif (((placeholderL3.x - placeholderL3.width/2) < letter1.x ) and
                ((placeholderL3.x + placeholderL3.width/2) > letter1.x ) and 
                ((placeholderL3.y - placeholderL3.height/2) < letter1.y ) and 
                ((placeholderL3.y + placeholderL3.height/2) > letter1.y ) and 
                (placeholderL3Filled == false) ) then

                -- setting the position of the number to be in the center of the box
                letter1.x = placeholderL3.x
                letter1.y = placeholderL3.y
                placeholderL3Filled = true
                numLettersCompleted = numLettersCompleted + 1
                userLetter3 = letter1
                letter1:removeEventListener( "touch", TouchListenerLetter1 )
                print ("***TouchListenerLetter1: placeholderL3Filled is true")
                if (numLettersCompleted == 3) then
                    CheckUserAnswerInput()
                    DisplayQuestion()
                    letter1:addEventListener("touch", TouchListenerLetter1)
                    print ("****CheckUserAnswerInput")
                end
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            else
                letter1.x = letter1PreviousX
                letter1.y = Y1
                print ("***Moving letter 1 back to original position")

            end
        end
    end                
 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerLetter2(touch)
--only work if none of the other boxes have been touched
    if (letter1Touched == false) and (letter3Touched == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            letter2Touched = true

        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            
            letter2.x = touch.x
            letter2.y = touch.y

        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            letter2Touched = false

              -- allow  the letter to be dragged into any place holder 
            if (((placeholderL1.x - placeholderL1.width/2) < letter2.x ) and
                ((placeholderL1.x + placeholderL1.width/2) > letter2.x ) and 
                ((placeholderL1.y - placeholderL1.height/2) < letter2.y ) and 
                ((placeholderL1.y + placeholderL1.height/2) > letter2.y ) and 
                (placeholderL1Filled == false)) then

                -- setting the position of the number to be in the center of the box
                letter2.x = placeholderL1.x
                letter2.y = placeholderL1.y
                placeholderL1Filled = true
                numLettersCompleted = numLettersCompleted + 1
                userLetter1 = letter2
                letter2:removeEventListener( "touch", TouchListenerLetter2 )
                print ("***TouchListenerLetter2: placeholderL1Filled is true")
                if (numLettersCompleted == 3) then
                    CheckUserAnswerInput()
                    DisplayQuestion()
                    letter2:addEventListener("touch", TouchListenerLetter2)
                    print ("****CheckUserAnswerInput")
                end
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            elseif (((placeholderL2.x - placeholderL2.width/2) < letter2.x ) and
                ((placeholderL2.x + placeholderL2.width/2) > letter2.x ) and 
                ((placeholderL2.y - placeholderL2.height/2) < letter2.y ) and 
                ((placeholderL2.y + placeholderL2.height/2) > letter2.y ) and 
                (placeholderL2Filled == false)) then

                -- setting the position of the number to be in the center of the box
                letter2.x = placeholderL2.x
                letter2.y = placeholderL2.y
                placeholderL2Filled = true
                numLettersCompleted = numLettersCompleted + 1
                userLetter2 = letter2
                letter2:removeEventListener( "touch", TouchListenerLetter2 )
                print ("***TouchListenerLetter2: placeholderL2Filled is true")
                if (numLettersCompleted == 3) then
                    CheckUserAnswerInput()
                    DisplayQuestion()
                    letter2:addEventListener("touch", TouchListenerLetter2)
                    print ("****CheckUserAnswerInput")
                end
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            elseif (((placeholderL3.x - placeholderL3.width/2) < letter2.x ) and
                ((placeholderL3.x + placeholderL3.width/2) > letter2.x ) and 
                ((placeholderL3.y - placeholderL3.height/2) < letter2.y ) and 
                ((placeholderL3.y + placeholderL3.height/2) > letter2.y ) and 
                (placeholderL3Filled == false) ) then
                

                -- setting the position of the number to be in the center of the box
                letter2.x = placeholderL3.x
                letter2.y = placeholderL3.y
                placeholderL3Filled = true
                numLettersCompleted = numLettersCompleted + 1
                userLetter3 = letter2            
                letter2:removeEventListener( "touch", TouchListenerLetter2 )
                print ("***TouchListenerLetter2: placeholderL3Filled is true")
                if (numLettersCompleted == 3) then
                    CheckUserAnswerInput()
                    DisplayQuestion()
                    letter2:addEventListener("touch", TouchListenerLetter2)
                    print ("****CheckUserAnswerInput")
                end
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            else
                letter2.x = letter2PreviousX
                letter2.y = Y1
                print ("***Moving letter 2 back to original position")

            end
        end
        
    end 
end

--checking to see if the user pressed the right answer and bring them back to level 1
local function TouchListenerLetter3(touch)
  --only work if none of the other boxes have been touched
    if (letter1Touched == false) and (letter2Touched == false) then

        if (touch.phase == "began") then

            --let other boxes know it has been clicked
            letter3Touched = true

        --drag the answer to follow the mouse
        elseif (touch.phase == "moved") then
            
            letter3.x = touch.x
            letter3.y = touch.y
        -- this occurs when they release the mouse
        elseif (touch.phase == "ended") then

            letter3Touched = false

              -- allow  the letter to be dragged into any place holder 
            if (((placeholderL1.x - placeholderL1.width/2) < letter3.x ) and
                ((placeholderL1.x + placeholderL1.width/2) > letter3.x ) and 
                ((placeholderL1.y - placeholderL1.height/2) < letter3.y ) and 
                ((placeholderL1.y + placeholderL1.height/2) > letter3.y ) and 
                (placeholderL1Filled == false)) then

                -- setting the position of the number to be in the center of the box
                letter3.x = placeholderL1.x
                letter3.y = placeholderL1.y
                placeholderL1Filled = true
                numLettersCompleted = numLettersCompleted + 1
                userLetter1 = letter3
                letter3:removeEventListener( "touch", TouchListenerLetter3 )
                print ("***TouchListenerLetter2: placeholderL1Filled is true")
                if (numLettersCompleted == 3) then
                    CheckUserAnswerInput()
                    DisplayQuestion()
                    letter3:addEventListener("touch", TouchListenerLetter3)
                    print ("****CheckUserAnswerInput")
                end
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            elseif (((placeholderL2.x - placeholderL2.width/2) < letter3.x ) and
                ((placeholderL2.x + placeholderL2.width/2) > letter3.x ) and 
                ((placeholderL2.y - placeholderL2.height/2) < letter3.y ) and 
                ((placeholderL2.y + placeholderL2.height/2) > letter3.y ) and 
                (placeholderL2Filled == false)) then

                -- setting the position of the number to be in the center of the box
                letter3.x = placeholderL2.x
                letter3.y = placeholderL2.y
                placeholderL2Filled = true
                numLettersCompleted = numLettersCompleted + 1
                userLetter2 = letter3
                letter3:removeEventListener( "touch", TouchListenerLetter3 )
                print ("***TouchListenerLetter2: placeholderL2Filled is true")
                if (numLettersCompleted == 3) then
                    CheckUserAnswerInput()
                    DisplayQuestion()
                    letter3:addEventListener("touch", TouchListenerLetter3)
                    print ("****CheckUserAnswerInput")
                end
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            elseif (((placeholderL3.x - placeholderL3.width/2) < letter3.x ) and
                ((placeholderL3.x + placeholderL3.width/2) > letter3.x ) and 
                ((placeholderL3.y - placeholderL3.height/2) < letter3.y ) and 
                ((placeholderL3.y + placeholderL3.height/2) > letter3.y ) and 
                (placeholderL3Filled == false) ) then
                

                -- setting the position of the number to be in the center of the box
                letter3.x = placeholderL3.x
                letter3.y = placeholderL3.y
                placeholderL3Filled = true
                numLettersCompleted = numLettersCompleted + 1
                userLetter3 = letter3
                letter3:removeEventListener( "touch", TouchListenerLetter3 )
                print ("***TouchListenerLetter3: placeholderL3Filled is true")
                if (numLettersCompleted == 3) then
                    CheckUserAnswerInput()
                    DisplayQuestion()
                    letter3:addEventListener("touch", TouchListenerLetter3)
                    print ("****CheckUserAnswerInput")
                end
                -- call the function to check if the user's input is correct or not
                --CheckUserAnswerInput()

            --else make box go back to where it was
            else
                letter3.x = letter3PreviousX
                letter3.y = Y3
                print ("***Moving letter 2 back to original position")

            end
        end
        
    end  
end


--adding the event listeners 
local function AddTextListeners ( )
    letter1:addEventListener( "touch", TouchListenerLetter1 )
    letter2:addEventListener( "touch", TouchListenerLetter2)
    letter3:addEventListener( "touch", TouchListenerLetter3)

end

--removing the event listeners
local function RemoveTextListeners()
    letter1:removeEventListener( "touch", TouchListenerLetter1 )
    letter2:removeEventListener( "touch", TouchListenerLetter2)
    letter3:removeEventListener( "touch", TouchListenerLetter3)
end

local function DisplayQuestion()
    --creating random numbers
    randomQuestion = math.random(1,2)

    if (randomQuestion == 1) then
        correctLetter1 = "F"
        correctLetter2 = "A"
        correctLetter3 = "T"

        letter1.text = "A"
        letter2.text = "T"
        letter3.text = "F"
    elseif (randomQuestion == 2) then
        correctLetter1 = "H"
        correctLetter2 = "A"
        correctLetter3 = "T"

        letter1.text = "T"
        letter2.text = "A"
        letter3.text = "H"
    end

    letter1PreviousX = X1
    letter2PreviousX = X2
    letter3PreviousX = X3
end


   
-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view  

    -----------------------------------------------------------------------------------------
    --covering the other scene with a rectangle so it looks faded and stops touch from going through
    bkg = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight)
    --setting to a semi black colour
    bkg:setFillColor(0,0,0,0.5)

    -----------------------------------------------------------------------------------------
    --making a cover rectangle to have the background fully bolcked where the question is
    cover = display.newRoundedRect(display.contentCenterX, display.contentCenterY, display.contentWidth*0.8, display.contentHeight*0.95, 50 )
    --setting its colour
    cover:setFillColor(96/255, 96/255, 96/255)

    -- create the question text object
    questionText = display.newText("Drag the letters into the\nboxes to make a word.", display.contentCenterX, display.contentCenterY*3/8, Arial, 50)

    -- create the answer text object & wrong answer text objects
    letter1 = display.newText("", X1, Y1, Arial, 100)
    letter1:setFillColor(0,0,0)
    letter2 = display.newText("", X2, Y1, Arial, 100)
    letter2:setFillColor(0,0,0)
    letter3 = display.newText("", X3, Y1, Arial, 100)
    letter3:setFillColor(0,0,0)
    points = display.newText("Points = " .. points, display.contentWidth*4/7, display.contentHeight*6/7, Arial, 50)
    points:setFillColor(0,0,0)

    lives = display.newText("lives = " .. lives, display.contentWidth*2/7, display.contentHeight*6/7, Arial, 50)
    lives:setFillColor(0,0,0)

    -- Insert the platforms
    placeholderL1 = display.newImageRect("Images/LetterPlaceHolderMelody@2x.png", 150, 150)
    placeholderL1.x = X1
    placeholderL1.y = Y2

    -- Insert the platforms
    placeholderL2 = display.newImageRect("Images/LetterPlaceHolderMelody@2x.png", 150, 150)
    placeholderL2.x = X2
    placeholderL2.y = Y2

    -- Insert the platforms
    placeholderL3 = display.newImageRect("Images/LetterPlaceHolderMelody@2x.png", 150, 150)
    placeholderL3.x = X3
    placeholderL3.y = Y2

    -----------------------------------------------------------------------------------------

    -- insert all objects for this scene into the scene group
    sceneGroup:insert(bkg)
    sceneGroup:insert(cover)
    sceneGroup:insert(questionText)
    sceneGroup:insert(placeholderL1)
    sceneGroup:insert(placeholderL2)
    sceneGroup:insert(placeholderL3)
    sceneGroup:insert(letter1)
    sceneGroup:insert(letter2)
    sceneGroup:insert(letter3)
    sceneGroup:insert(lives)
    sceneGroup:insert(points)


end --function scene:create( event 150

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then

        -- Called when the scene is still off screen (but is about to come on screen).
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
        DisplayQuestion()

        AddTextListeners()
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, stop audio, etc.
        --parent:resumeGame()
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
        --RemoveTextListeners()
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