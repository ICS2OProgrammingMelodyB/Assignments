-- Title: DrawingShapes
-- Name: Melody berhane
-- Course: ICS2O
-- This program displays five different shapes and 
-- displays the area of a triangle.


-- Create local varables
local myTrapezoid
local vTrapezoid = {-100,-100,100,-100,140,120,-140,120 }
local textSize = 70
local TextTrapezoid

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--background image with width an height
local backgroungImage = display.newImageRect("Images/galaxy2.jpg", 2048, 1536)

--draw the trapezoid
myTrapezoid = display.newPolygon(0, 0, vTrapezoid)

--anchor the trapezoid in the top left corner of the screen and set its (x,y) position
myTrapezoid.anchorX =0
myTrapezoid.anchorX =0
myTrapezoid.x =10
myTrapezoid.y =560

--set the width of the border
myTrapezoid.strokeWidth = 20

--set the colour of the trapezoid
myTrapezoid:setFillColor(9, 0.1, 0.3)

--set the color of the border
myTrapezoid:setStrokeColor(0, 12, 0)

--set the image to be transparent
myTrapezoid.alpha = 1

--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
TextTrapezoid = display.newText("Trapezoid", 150, 700, Arial, textSize)

--sets the color 
TextTrapezoid:setTextColor(0.1, 2, 3)



-- Create local varables
local myTriangle
local vTriangle = {0,-40,80,100,-80,100 }
local textSize = 70
local TextTriangle

--draw the triangle
myTriangle = display.newPolygon(0, 0, vTriangle)

--anchor the triangle in the top left corner of the screen and set its (x,y) position
myTriangle.anchorX =0
myTriangle.anchorX =0
myTriangle.x =450
myTriangle.y =350

--set the width of the border
myTriangle.strokeWidth = 20

--set the colour of the triangle
myTriangle:setFillColor(0.1, 2, 3)

--set the color of the border
myTriangle:setStrokeColor(0.9, 3, 0.7)

--set the image to be transparent
myTriangle.alpha = 1

--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
TextTriangle = display.newText("Triangle", 530, 460, Arial, textSize)

--sets the color 
TextTriangle:setTextColor(255/255, 150/255, 50/255)

