#Module: RatingInput
#By Mark Davies
#This module creates a set of stars that users can interact with to apply a
#rating. It includes a title and descriptor for each star-value.

class RatingInput extends Layer
	descriptors = ["Abysmal", "Poor", "Alright", "Good", "Great", "Outstanding"]
	yPosition = 0

	constructor: (@theTitle, @yPos, @options={}) ->
		#@options.backgroundColor = "transparent"
		yPosition = @yPos
		currentState = 0 #Star rating state. 0 = all stars inactive
		createStars(currentState, @theTitle)
		#super @options

	container = new Layer	#Container houses all layers
		x:30
		y: yPosition#120
		width: Framer.Device.screen.width#-30
		height: Framer.Device.screen.height#-120
		backgroundColor: "transparent"

 	#Create the layers and stars
	#createStars = (amount) ->
	createStars = (cur, title) ->
		currentState = cur
		#Label for star rating
		title = new TextLayer
			y: yPosition#55
			text: title
			backgroundColor: "transparent"
			parent: container
		title.style.font = "600 32px Hind Vadodara"
		title.style.color = "#565656"

		#Label for descriptor
		descriptor = new TextLayer
			y: (yPosition+5)#60
			x: (title.width)
			backgroundColor: "transparent"
			text: ""
			parent: container
		descriptor.style.font = "400 28px Hind Vadodara"
		descriptor.style.color = "#565656"

		stars = [] #Store the set of stars
		for i in [0...6]
			layer = new Layer
				width: 75
				height: 75
				x: (75) * i
				y: (yPosition+55)#110
				borderRadius: 10
				backgroundColor: "transparent"
				parent: container

			star_inactive = new Layer
				width: 52
				height: 52
				image: "images/star-inactive.png"
				superLayer: layer

			star_active = new Layer
				width: 52
				height: 52
				image: "images/star-active.png"
				opacity: 0
				scale: 1.5
				superLayer: layer

			star_inactive.states.add(active: {opacity: 0})
			star_active.states.add(active: {opacity: 1, scale: 1})

			star_inactive.states.animationOptions = time: 0.05
			star_active.states.animationOptions = curve: "spring(600,30,0)"

			stars.push(layer)
		createInteractions(stars, descriptor, currentState)

	#Create the interactions
	createInteractions = (stars, descriptor, currentState) ->
		for star in stars
			star.onTap ->
				if this is stars[0]
					#print "1 star"
					if currentState is 0
						oneStar(stars)
						descriptor.text = descriptors[0]
					if currentState is 2
						twoStar(stars)
						descriptor.text = descriptors[0]
					if currentState is 3
						twoStar(stars)
						threeStar(stars)
						descriptor.text = descriptors[0]
					if currentState is 4
						twoStar(stars)
						threeStar(stars)
						fourStar(stars)
						descriptor.text = descriptors[0]
					if currentState is 5
						twoStar(stars)
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						descriptor.text = descriptors[0]
					if currentState is 6
						twoStar(stars)
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						sixStar(stars)
						descriptor.text = descriptors[0]
					currentState = 1

				if this is stars[1]
					#print "2 star"
					if currentState is 0
						oneStar(stars)
						twoStar(stars)
						descriptor.text = descriptors[1]
					if currentState is 1
						twoStar(stars)
						descriptor.text = descriptors[1]
					if currentState is 3
						threeStar(stars)
						descriptor.text = descriptors[1]
					if currentState is 4
						threeStar(stars)
						fourStar(stars)
						descriptor.text = descriptors[1]
					if currentState is 5
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						descriptor.text = descriptors[1]
					if currentState is 6
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						sixStar(stars)
						descriptor.text = descriptors[1]
					currentState = 2

				if this is stars[2]
					#print "3 star"
					if currentState is 0
						oneStar(stars)
						twoStar(stars)
						threeStar(stars)
						descriptor.text = descriptors[2]
					if currentState is 1
						twoStar(stars)
						threeStar(stars)
						descriptor.text = descriptors[2]
					if currentState is 2
						threeStar(stars)
						descriptor.text = descriptors[2]
					if currentState is 4
						fourStar(stars)
						descriptor.text = descriptors[2]
					if currentState is 5
						fourStar(stars)
						fiveStar(stars)
						descriptor.text = descriptors[2]
					if currentState is 6
						fourStar(stars)
						fiveStar(stars)
						sixStar(stars)
						descriptor.text = descriptors[2]
					currentState = 3

				if this is stars[3]
					#print "4 star"
					if currentState is 0
						oneStar(stars)
						twoStar(stars)
						threeStar(stars)
						fourStar(stars)
						descriptor.text = descriptors[3]
					if currentState is 1
						twoStar(stars)
						threeStar(stars)
						fourStar(stars)
						descriptor.text = descriptors[3]
					if currentState is 2
						threeStar(stars)
						fourStar(stars)
						descriptor.text = descriptors[3]
					if currentState is 3
						fourStar(stars)
						descriptor.text = descriptors[3]
					if currentState is 5
						fiveStar(stars)
						descriptor.text = descriptors[3]
					if currentState is 6
						fiveStar(stars)
						sixStar(stars)
						descriptor.text = descriptors[3]
					currentState = 4

				if this is stars[4]
					#print "5 star"
					if currentState is 0
						oneStar(stars)
						twoStar(stars)
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						descriptor.text = descriptors[4]
					if currentState is 1
						twoStar(stars)
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						descriptor.text = descriptors[4]
					if currentState is 2
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						descriptor.text = descriptors[4]
					if currentState is 3
						fourStar(stars)
						fiveStar(stars)
						descriptor.text = descriptors[4]
					if currentState is 4
						fiveStar(stars)
						descriptor.text = descriptors[4]
					if currentState is 6
						sixStar(stars)
						descriptor.text = descriptors[4]
					currentState = 5

				if this is stars[5]
					#print "6 star"
					if currentState is 0
						oneStar(stars)
						twoStar(stars)
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						sixStar(stars)
						descriptor.text = descriptors[5]
					if currentState is 1
						twoStar(stars)
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						sixStar(stars)
						descriptor.text = descriptors[5]
					if currentState is 2
						threeStar(stars)
						fourStar(stars)
						fiveStar(stars)
						sixStar(stars)
						descriptor.text = descriptors[5]
					if currentState is 3
						fourStar(stars)
						fiveStar(stars)
						sixStar(stars)
						descriptor.text = descriptors[5]
					if currentState is 4
						fiveStar(stars)
						sixStar(stars)
						descriptor.text = descriptors[5]
					if currentState is 5
						sixStar(stars)
						descriptor.text = descriptors[5]
					currentState = 6

	#Animation for each star
	oneStar = (stars) ->
		star = stars[0].subLayers[0]
		star_active = stars[0].subLayers[1]
		star.states.next()
		star_active.states.next()
	twoStar = (stars) ->
		star = stars[1].subLayers[0]
		star_active = stars[1].subLayers[1]
		star.states.next()
		star_active.states.next()
	threeStar = (stars) ->
		star = stars[2].subLayers[0]
		star_active = stars[2].subLayers[1]
		star.states.next()
		star_active.states.next()
	fourStar = (stars) ->
		star = stars[3].subLayers[0]
		star_active = stars[3].subLayers[1]
		star.states.next()
		star_active.states.next()
	fiveStar = (stars) ->
		star = stars[4].subLayers[0]
		star_active = stars[4].subLayers[1]
		star.states.next()
		star_active.states.next()
	sixStar = (stars) ->
		star = stars[5].subLayers[0]
		star_active = stars[5].subLayers[1]
		star.states.next()
		star_active.states.next()

module.exports = RatingInput
