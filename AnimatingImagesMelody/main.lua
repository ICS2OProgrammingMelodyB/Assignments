-- Title: AnimatingImages
-- Name: Melody berhane
-- Course: ICS2O
-- This program displays four images that move up, down and sideways.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--------------------------------------------------------------
--GLOBAL VARIABLES
---------------------------------------------------------------

--glodal varables
scrollSpeed = 4
scrollSpeed3 = 4
scrollSpeed2 = 4 - 8 
scrollSpeed4 = 4 - 8








----------------------------------------------------------
--LOCAL VARIABLES
----------------------------------------------------------

--create local variables 
local background
local eyeBall
local heart
local controller
local crown
local hello






----------------------------------------------------------
--LOCAL FUNCTION
----------------------------------------------------------

-- Function: MoveEyes
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the eye
local function MoveEyes(event)
    -- adds the scroll speed to the x-value of the eye
    eyeBall.x = eyeBall.x + scrollSpeed
    -- change the transparency of the eye every time it moves so that it fades out
    eyeBall.alpha = eyeBall.alpha + 0.05
    eyeBall.xScale = eyeBall.xScale + 0.01
    eyeBall.yScale = eyeBall.yScale + 0.01
end 

-- Function: MoveHeart
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the heart
local function MoveHeart(event)
    -- adds the scroll speed to the x-value of the eye
    heart.x = heart.x + scrollSpeed2
    -- change the transparency of the heart every time it moves so that it fades out
    heart.alpha = heart.alpha - 0.001
    heart.xScale = heart.xScale - 0.004
    heart.yScale = heart.yScale - 0.004
end 

-- Function: MoveController
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the controller
local function MoveController(event)
    -- adds the scroll speed to the x and y value of the controller
    controller.x = controller.x + scrollSpeed4
    controller.y = controller.y + scrollSpeed4

    -- makes controller continue to change direction(I got the code for https://stackoverflow.com/questions/17766773/how-to-make-multiple-objects-bounce-around-in-corona-sdk)
    if(controller.x < 0) then controller.x = controller.x + 3 scrollSpeed4 = -scrollSpeed4 
    end--Left
	if((controller.x + controller.width) > display.contentWidth) then controller.x = controller.x - 3 scrollSpeed4 = -scrollSpeed4 
	end--Right
	--if(controller.y < 0) then scrollSpeed4 = -scrollSpeed4 
	--end--Up
end 

-- Function: MoveCrown
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the crown
local function MoveCrown(event)
    -- adds the scroll speed to the x and y value of the crown
    crown.x = crown.x + scrollSpeed3
    crown.y = crown.y + scrollSpeed3

    --makes crown continue to change direction(I got the code for https://stackoverflow.com/questions/17766773/how-to-make-multiple-objects-bounce-around-in-corona-sdk)
    if(crown.x < 0) then crown.x = crown.x + 3 scrollSpeed3 = -scrollSpeed3 
    end--Left
	if((crown.x + crown.width) > display.contentWidth) then crown.x = crown.x - 3 scrollSpeed3 = -scrollSpeed3 
	end--Right
	--if(crown.y < 0) then scrollSpeed3 = -scrollSpeed3 
	--end--Up
end

local function RotateCrown(event) 
    -- rotates the crown ( learned code from Noah)
    crown:rotate(4)
end

local function RotateController(event) 
    -- rotates the crown ( learned code from Noah but i changed the name and speed)
    controller:rotate(4)
end






---------------------------------------------------------------
--OBJECT CREATION
---------------------------------------------------------------

--create the background
background = display.newImageRect("Images/cool background.jpg", 2048, 1536)

--create the eyeBall image, set its x and y position of the eyeball and sets its transparent
eyeBall = display.newImageRect("Images/real eye.png", 50, 50)
eyeBall.x = 70
eyeBall.y = display.contentHeight/2
eyeBall.alpha = 0

--create the heart image, set its x and y position of the heart and sets its transparent
heart = display.newImageRect("Images/heart.png", 200, 200)
heart.x = 1000
heart.y = display.contentHeight/2
heart.alpha = 1

--create the controller image, set the x and y position of the controller and sets its transparent
controller = display.newImageRect("Images/controller.png", 100, 100)
controller.x = 950
controller.y = 750
controller.alpha = 1

 

--create the crown image, set the x and y position of the crown and sets its transparent
crown = display.newImageRect("Images/crown.png", 100, 100)
crown.x = 20
crown.y = 50
crown.alpha = 1

-- create text
hello = display.newText("Welcome to my game of end less fun", display.contentWidth/2, display.contentHeight/2, ArialNarrow, 50)
--hello:setTextColor(5/255, 255/255, 200/255)
--set the colour of the pentagon
local gradient = {
    type="gradient",
    color1={ 1/255, 255/255, 1/255 }, color2={ 255/255, 1/255, 1/255 }, direction="down"
}
hello:setTextColor(gradient)



---------------------------------------------------------------
--EVENT LISTENER
---------------------------------------------------------------
--MoveEyes will be called over and over again
Runtime:addEventListener("enterFrame", MoveEyes)

--MoveHeart will be called over and over again
Runtime:addEventListener("enterFrame", MoveHeart)

--MoveController will be called over and over again
Runtime:addEventListener("enterFrame", MoveController)

--MoveCrown will be called over and over again
Runtime:addEventListener("enterFrame", MoveCrown)

--RotateCrown will be called over and over again
Runtime:addEventListener("enterFrame", RotateCrown)

--RotateController will be called over and over again
Runtime:addEventListener("enterFrame", RotateController)

-----------------------------------------------------------------
--FUNCTION CALLS
-----------------------------------------------------------------