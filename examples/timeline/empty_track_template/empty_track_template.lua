timeline = ofxTimeline.ofxTimeline()

function setup()
    of.setWindowTitle("empty track template")
    of.setWindowShape(1024, 768)
    
    of.background(255*.15);
	of.setFrameRate(30);
	of.setVerticalSync(true);
	
	of.enableSmoothing();
	of.enableAlphaBlending();
	
	timeline:setup();
	timeline:setLoopType(of.LOOP_NORMAL);
	timeline:setDurationInSeconds(30);
    
	-- this is the simplest example and is really flexible
	emptyTrack = ofxTimeline.ofxTLEmptyTrack();
	timeline:addTrack("My Custom Track", emptyTrack);

	-- a very simple color keyframe
	emptyKeyframes = ofxTimeline.ofxTLEmptyKeyframes():getTrack();
	emptyKeyframes:setXMLFileName("MyEmptyKeyframes.xml");
	timeline:addTrack("My Custom Keyframes", emptyKeyframes);
end


function draw()
    local curtime = timeline:getCurrentTime();
	timeline:draw()
end