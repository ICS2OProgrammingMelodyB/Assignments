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
local width = display.contentWidth
local height = display.contentHeight
local scrollspeed = 8

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--add first backgroung
local backgroungImage1 = display.newImageRect("Images/galaxy2.jpg", 2048, 1536)
backgroungImage1.x = width+0.5; backgroungImage1.y = height/2;

--add second backgroung
local backgroungImage2 = display.newImageRect("Images/galaxy2.jpg", 2048, 1536)
backgroungImage2.x = width+0.5; backgroungImage2.y = backgroungImage1.y + 480;

--add third backgroung
local backgroungImage3 = display.newImageRect("Images/galaxy2.jpg", 2048, 1536)
backgroungImage3.x = width+0.5; backgroungImage3.y = backgroungImage2.y + 480;

--moves the background
local function Move (event)
	backgroungImage1.y = backgroungImage1.y + scrollspeed
	backgroungImage2.y = backgroungImage2.y + scrollspeed
	backgroungImage3.y = backgroungImage3.y + scrollspeed

	if(backgroungImage1.y + backgroungImage1.contentWidth) > 2768 then
		backgroungImage1: translate(0, -960)
	end
	if(backgroungImage2.y + backgroungImage2.contentWidth) > 2768 then
		backgroungImage2: translate(0, -960)
	end
	if(backgroungImage3.y + backgroungImage3.contentWidth) > 2768 then
		backgroungImage3: translate(0, -960)
	end
end

--backgound will be called over and over again
Runtime:addEventListener("enterFrame", Move)

--draw the trapezoid
myTrapezoid = display.newPolygon(0, 0, vTrapezoid)

--anchor the trapezoid in the top left corner of the screen and set its (x,y) position
myTrapezoid.anchorX =0
myTrapezoid.anchorX =0
myTrapezoid.x =10
myTrapezoid.y =580

--set the width of the border
myTrapezoid.strokeWidth = 20

--set the colour of the trapezoid
myTrapezoid:setFillColor(9, 0.1, 0.3)

--set the color of the border
myTrapezoid:setStrokeColor(0, 12, 0)

--set the image to be transparent
myTrapezoid.alpha = 1

--write trapezoid on the screen. Take into consideration the size of the font when positioning it on the screen
TextTrapezoid = display.newText("Trapezoid", 150, 730, Arial, textSize)

--sets the color 
TextTrapezoid:setTextColor(0.1, 2, 3)




-- Create local varables
local myTriangle
local vTriangle = {0,-80,120,140,-120,140 }
local textSize = 70
local textSizeTriangle = 50
local TextTriangle
local areaText
local baseOfTriangle = 350
local heightOfTraingle = 140
local AreaOfTriangle

--draw the triangle
myTriangle = display.newPolygon(0, 0, vTriangle)

--anchor the triangle in the top left corner of the screen and set its (x,y) position
myTriangle.anchorX =0
myTriangle.anchorX =0
myTriangle.x =350
myTriangle.y =140

--set the width of the border
myTriangle.strokeWidth = 20

-- Set the fill (paint) to use the bitmap image
local coolGalaxy = {
    type = "image",
    filename = "Images/cool galaxy.png"
}

-- Fill the triangle
myTriangle.fill = coolGalaxy

--set the color of the border
myTriangle:setStrokeColor(0.9, 3, 0.7)

--set the image to be transparent
myTriangle.alpha = 1

--write triangle on the screen. Take into consideration the size of the font when positioning it on the screen
TextTriangle = display.newText("Triangle", 500, 300, Arial, textSize)

--sets the color 
TextTriangle:setTextColor(255/255, 150/255, 50/255)

--calculate the area
AreaOfTriangle = baseOfTriangle * heightOfTraingle/2

--write the area on the screen. Take into consideration the size of the font when positioning it on the screen
areaText = display.newText("- The area of this triangle with a base of \n" ..
	baseOfTriangle .. " and a height of " .. heightOfTraingle .. " is " ..
	AreaOfTriangle .. " pixel².", 500, 400, Arial, textSizeTriangle)




-- Create local varables
local myHexagon
local vHexagon = {-80,-80,80,-80,100,0,80,80,-80,80,-100,0 }
local textSize = 70
local TextHexagon

--draw the Hexagon
myHexagon = display.newPolygon(0, 0, vHexagon)

--anchor the hexagon in the top left corner of the screen and set its (x,y) position
myHexagon.anchorX =0
myHexagon.anchorX =0
myHexagon.x =10
myHexagon.y =100

--set the width of the border
myHexagon.strokeWidth = 20

--set the colour of the hexagon
myHexagon:setFillColor(15/255, 199/255, 255/255)

--set the color of the border
myHexagon:setStrokeColor(10/255, 255/255, 165/255)

--set the image to be transparent
myHexagon.alpha = 1

--write hexagon on the screen. Take into consideration the size of the font when positioning it on the screen
TextHexagon = display.newText("Hexagon", 150, 250, Arial, textSize)

--sets the color 
TextHexagon:setTextColor(15/255, 127/255, 205/255)




-- Create local varables
local myHeptagon
local vHeptagon = {0,-60,60,-40,80,40,40,80,-40,80,-80,40,-60,-40 }
local textSize = 70
local TextHeptagon

--draw the Heptagon
myHeptagon = display.newPolygon(0, 0, vHeptagon)

--anchor the heptagon in the top left corner of the screen and set its (x,y) position
myHeptagon.anchorX =0
myHeptagon.anchorX =0
myHeptagon.x =700
myHeptagon.y =100

--set the width of the border
myHeptagon.strokeWidth = 20

--set the colour of the heptagon
myHeptagon:setFillColor(205/255, 47/255, 112/255)

--set the color of the border
myHeptagon:setStrokeColor(66/255, 176/255, 255/255)

--set the image to be transparent
myHeptagon.alpha = 1

--write heptagon on the screen. Take into consideration the size of the font when positioning it on the screen
TextHeptagon = display.newText("Heptagon", 800, 250, Arial, textSize)

--sets the color 
TextHeptagon:setTextColor(232/255, 134/255, 82/255)



-- Create local varables
local myPentagon
local vPentagon = {0,-100,100,0,80,100,-80,100,-100,0 }
local textSize = 70
local TextPentagon

--draw the Pentagon
myPentagon = display.newPolygon(0, 0, vPentagon)

--anchor the pentagon in the top left corner of the screen and set its (x,y) position
myPentagon.anchorX =0
myPentagon.anchorX =0
myPentagon.x =700
myPentagon.y =600

--set the width of the border
myPentagon.strokeWidth = 20

--set the colour of the pentagon
local gradient = {
    type="gradient",
    color1={ 40/255, 70/255, 190/255 }, color2={ 175/255, 53/255, 97/255 }, direction="down"
}
myPentagon:setFillColor( gradient )

--set the color of the border
myPentagon:setStrokeColor(200/255, 74/255, 6/255)

--set the image to be transparent
myPentagon.alpha = 1

--write pentagon on the screen. Take into consideration the size of the font when positioning it on the screen
TextPentagon = display.newText("Pentagon", 800, 730, Arial, textSize)

--sets the color 
TextPentagon:setTextColor(232/255, 255/255, 82/255)


