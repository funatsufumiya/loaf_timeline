timeline = ofxTimeline.ofxTimeline()

function setup()
    of.setWindowTitle("all tracks")
    of.setWindowShape(1024, 768)
    
    of.background(255*.15)
    of.setVerticalSync(true)
	of.enableSmoothing()

	timeline:setup()

	timeline:addVideoTrack("fingers", "fingers.mov");

    timeline:addAudioTrack("audio", "4chan.wav");
    timeline:setDurationInSeconds(timeline:getAudioTrack("audio"):getDuration());

	timeline:addCurves("curves", 0, 255);
	timeline:addBangs("bangs");
	timeline:addFlags("flags");
	timeline:addColors("colors");
	timeline:addLFO("lfo");
	timeline:addSwitches("switches");

	timeline:setPageName("Page 1");
	timeline:addPage("Page 2");
	timeline:addPage("Page 3");
	timeline:addPage("Page 4");
	timeline:setCurrentPage(0);

	timeline:enableSnapToOtherKeyframes(false);
	timeline:setLoopType(of.LOOP_NORMAL);
end

function draw()
    if timeline:isSwitchOn("switches") then
        local r = timeline:getR("colors")
        local g = timeline:getG("colors")
        local b = timeline:getB("colors")
        of.background(r, g, b);
    else
        of.background(255*.15);
    end
    timeline:draw();
end