-- Title: MathQuiz
-- Name: Melody Berhane
-- Course: ICS2O
-- This program displays a math question and asks the user to answer in a numeric textfield



--hide the status bar
display.setStatusBar(display.HiddenStatusBar)


-----------------------------------------------------
--SOUND
------------------------------------------------------

-- Correct sound 
local correctSound = audio.loadSound("Sounds/correctSound.mp3") -- setting a varable to an mp3 file
local correctSoundChannel
local wrongSound = audio.loadSound("Sounds/wrongSound.mp3")
local wrongSoundChannel 
local gameOver = audio.loadSound("Sounds/gameover.mp3")
local gameOverChannel
local winSound = audio.loadSound("Sounds/win.mp3")
local winSoundChannel

-------------------------------------------------------
--LOCAL VARIABLES
-------------------------------------------------------

--create local variable
local background
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local randomNumber3
local randomNumber4
local randomNumber5
local randomNumber6
local userAnser
local correctAnswer = 1
local correctAnswer1
local incorrectObject
local randomOperator
local correctAnswerObject
local points = 0
local lives = 3
local totalSeconds = 10
local secondsLeft = 10
local clockText
local countDownTimer
local heart1
local heart2
local heart3
local gradient
local exponent = randomNumber7
local base = randomNumber3
local randomNumber7
local counter = 1

----------------------------------------------------------
--LOCAL FUNCTIONS
----------------------------------------------------------

local function AskQuestions()
	--generate a random number between 1 and 4
	-- *** MAKE SURE TO DECLARE THIS VARIABLE ABOVE
	randomOperator = math.random(1,6)
	--generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(1, 20)
	randomNumber2 = math.random(1, 20)
	randomNumber3 = math.random(1, 10)
	randomNumber4 = math.random(1, 10)
	randomNumber5 = math.random(1, 100)
	randomNumber6 = math.random(1, 100)
	randomNumber7 = math.random(1, 5)
	exponent = randomNumber7
	base = randomNumber3


	-- if the random operator is 1, then do addition
	if (randomOperator == 1) then

		--calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		--create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2)then
		--calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2
		if (correctAnswer < 0) then
			correctAnswer = randomNumber2 - randomNumber1
			questionObject.text = randomNumber2 .. " - " .. randomNumber1 .. " = "
		else
			--create question in text object
			questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = "
		end
	
	-- otherwise, if the random operator is 3, do multiplication
	elseif (randomOperator == 3)then
		--calculate the correct answer
		correctAnswer = randomNumber3 * randomNumber4

		--create question in text object
		questionObject.text = randomNumber3 .. " * " .. randomNumber4 .. " = "

	-- otherwise, if the random operator is 4, do division
	elseif (randomOperator == 4)then
		--calculate the correct answer
		correctAnswer1 = randomNumber5 * randomNumber6
		correctAnswer = correctAnswer1 / randomNumber5

		--create question in text object
		questionObject.text = correctAnswer1 .. " / " .. randomNumber5 .. " = "


	-- otherwise, if the random operator is 5, do squareroots
	elseif (randomOperator == 5)then
		--calculate the correct answer
		correctAnswer1 = randomNumber3 * randomNumber3
		correctAnswer = correctAnswer1 / randomNumber3

		--create question in text object
		questionObject.text = "√" .. correctAnswer1 .. " = "

	-- otherwise, if the random operator is 5, do squareroots
	elseif (randomOperator == 6)then
		for counter = 1, exponent
			--calculate the correct answer
			do correctAnswer = correctAnswer * base
		
			--create question in text object
			questionObject.text = base .. "^" .. exponent .. " = "
		end
	end
end

local function Hidecorrect()
	correctObject.isVisible = false	
	AskQuestions()
end

local function Hideincorrect()
	incorrectObject.isVisible = false
end

local function HidecorrectAnswerObject()
	correctAnswerObject.isVisible = false
	AskQuestions()
end

local function NumericFieldsListener( event )

	--User begins editing "numericField"
	if ( event.phase == "began" ) then

		--clear text field
		event.target.text = ""

	elseif ( event.phase == "submitted" ) then 

		--when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		--if the users answer and the correct answer are the same:
	    if (userAnswer == correctAnswer) then
	    	secondsLeft = totalSeconds
			correctObject.isVisible = true
			secondsLeft = totalSeconds
		    correctSoundChannel = audio.play( correctSound )
			timer.performWithDelay(1000, Hidecorrect)	
		if (points == 4 ) then 
				WinObject.isVisible = true
	  		    incorrectObject.isVisible = false
	  		    correctObject.isVisible = false
	  		    questionObject.isVisible = false
	  		    numericField.isVisible = false
	  		    winSoundChannel = audio.play( winSound )
	  		    timer.cancel(countDownTimer)
	   		end
	    	-- give a point if user gets the correct answer
	    	points = points + 1

	    	--update it in the display object
	    	pointsText.text = "Points = " .. points			
			
        else 
        	if (lives == 1 ) then
        	 	gameOverObject.isVisible = true  
	  		    incorrectObject.isVisible = false
	  		    correctObject.isVisible = false
	  		    questionObject.isVisible = false
	  		    numericField.isVisible = false
	  		    gameOverChannel = audio.play( gameOver )
			else
        	
        	--if the users answer and the correct answer are not the same:
        	incorrectObject.isVisible = true
        	secondsLeft = totalSeconds
        	math.round(correctAnswer)
        	secondsLeft = totalSeconds
        	wrongSoundChannel = audio.play( wrongSound )
		    timer.performWithDelay(1000, Hideincorrect)
		    correctAnswerObject.text = "The correct answer is" ..  correctAnswer
		    correctAnswerObject.isVisible = true
		    timer.performWithDelay(1500, HidecorrectAnswerObject)

		    -- take a life if user gets the incorrect answer
	    	 lives = lives - 1
	    	 --update it in the display object
	    	 livesText.text = "lives = " .. lives
	        if (lives == 2)then
				heart1.isVisible = false
		    elseif(lives == 1)then
				heart2.isVisible = false
			elseif(lives == 0) then
				heart3.isVisible = false
			end
	    	end
		end
		
		--clear text field
		event.target.text = ""
		
	end
end

local function UpdateTime()
	-- decrement the number of seconds 
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = "secondsLeft = " .. secondsLeft

	if(secondsLeft == 0 )then
		--reset the number of seconds left
		secondsLeft = totalSeconds
		lives = lives - 1
		--update it in the display object
	    livesText.text = "lives = " .. lives
	    if (lives == 1 ) then
	  		gameOverObject.isVisible = true 
	  	    incorrectObject.isVisible = false
	  	    correctObject.isVisible = false
	  		questionObject.isVisible = false
	  		numericField.inputtype = false
	  		local gameOverChannel = audio.play( gameOver )
		end

		--cancel the timer and remove the third heart by making it invisible
		if (lives == 2)then
			heart1.isVisible = false
		elseif(lives == 1)then
			heart2.isVisible = false
		elseif(lives == 0) then
			heart3.isVisible = false
		end
		AskQuestions()
	end
end

function StartTimer()
	--create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay(1000, UpdateTime, 0)
end

-----------------------------------------------------------
--OBJECT CREATION
------------------------------------------------------------

--create the background
background = display.newImageRect("Images/background.png", 2048, 1536)
background.x = 600
background.y = 400

--create the lives to display on the screen
heart1= display.newImageRect("Images/heart.png", 100, 100)
heart1.x= display.contentWidth * 7/8
heart1.y=  display.contentHeight * 1/7

--create the lives to display on the screen
clockText = display.newText("secondsLeft = ".. secondsLeft, 100, 100, nil, 50)
gradient = {
    type="gradient",
    color1={ 247/255, 255/255, 0/255 }, color2={ 175/255, 53/255, 97/255 }, direction="down"
}
clockText:setFillColor( gradient )
clockText.x= 190
clockText.y= 100

--create the lives to display on the screen
heart2= display.newImageRect("Images/heart.png", 100, 100)
heart2.x= display.contentWidth * 6/8
heart2.y=  display.contentHeight * 1/7

--create the lives to display on the screen
heart3= display.newImageRect("Images/heart.png", 100, 100)
heart3.x= display.contentWidth * 5/8
heart3.y=  display.contentHeight * 1/7


--display a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50)
questionObject:setFillColor( 247/255, 255/255, 0/255 )


--create the correct text object and make it invisble
correctObject = display.newText( "Correct! ☺ ☺ ☺ ", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
correctObject:setTextColor(247/255, 255/255, 0/255)
correctObject.isVisible = false

--create the incorrect text object and make it invisble
incorrectObject = display.newText( "InCorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50)
incorrectObject:setTextColor(247/255, 255/255, 0/255)
incorrectObject.isVisible = false

--create numeric field
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 170, 100)
numericField.isVisible = true
numericField.inputType = "number"

--display the correct answer
correctAnswerObject = display.newText( "The correct answer is " ..  correctAnswer, display.contentWidth/2, display.contentHeight*3/4, nil, 50)
correctAnswerObject:setTextColor(247/255, 255/255, 0/255)
correctAnswerObject.isVisible = false

--display the amount of points as a text object
pointsText = display.newText("Points = " .. points, 900, 20, nil, 50)
gradient = {
    type="gradient",
    color1={ 247/255, 255/255, 0/255 }, color2={ 175/255, 53/255, 97/255 }, direction="down"
}
pointsText:setFillColor( gradient )

--display the amount of lives as a text object
livesText = display.newText("Lives = " .. lives, 120, 20, nil, 50)
gradient = {
    type="gradient",
    color1={ 247/255, 255/255, 0/255 }, color2={ 175/255, 53/255, 97/255 }, direction="down"
}
livesText:setFillColor( gradient )

--display GameOver! and sets the colour
gameOverObject = display.newImageRect("Images/gameOver.png", 1100, 1000)
gameOverObject.isVisible = false
gameOverObject.x= 510
gameOverObject.y=500

--display You win! and sets the colour
WinObject = display.newImageRect("Images/win.jpg", 1100, 1000)
WinObject.isVisible = false
WinObject.x=display.contentWidth/2
WinObject.y=300

--add the event listener for thr numeric field
numericField:addEventListener( "userInput", NumericFieldsListener)

-------------------------------------------------------------------
--FUNCTION CALLS
------------------------------------------------------------------

-- call the funtion to ask the question
AskQuestions()
StartTimer()

