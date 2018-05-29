-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------


local tapCount = 0


local background = display.newImageRect( "image/background.png", 1660, 1870 )

background.x = display.contentCenterX

background.y = display.contentCenterY


local tapText = display.newText( tapCount, display.contentCenterX, 220, native.systemFont, 240 )

tapText:setFillColor( 0, 0, 0 )


local platform = display.newImageRect( "image/platform.png", 1300, 50 )

platform.x = display.contentCenterX

platform.y = display.contentHeight-25


local balloon = display.newImageRect( "image/balloon.png", 512, 512 )


balloon.x = display.contentCenterX

balloon.y = display.contentCenterY


balloon.alpha = 1.0


local physics = require( "physics" )


physics.start()


physics.addBody( platform, "static" )

physics.addBody( balloon, "dynamic", { radius=120, bounce=0.5 } )


local function pushBalloon()
	
balloon:applyLinearImpulse( 0, -9.0, balloon.x, balloon.y )
	
tapCount = tapCount + 1
	
tapText.text = tapCount
end

balloon:addEventListener( "tap", pushBalloon )
