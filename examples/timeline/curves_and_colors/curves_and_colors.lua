-- this example is ported from original C++ code (please check license):
-- https://github.com/funatsufumiya/ofxTimeline/blob/master/example-curvesAndColors/

light = of.Light()
timeline = ofxTimeline.ofxTimeline()

function setup()
    of.setWindowTitle("curves and colors")
    of.setWindowShape(1024, 768)

    of.setFrameRate(60)
    of.setVerticalSync(true)
    of.enableSmoothing()

    of.enableDepthTest()
    of.enableLighting()

    light:setPosition(of.getWidth()*.5, of.getHeight()*.25, 0)
    light:enable()

    timeline:setup();
    timeline:setFrameRate(30);
    timeline:setDurationInFrames(90);
    timeline:setLoopType(of.LOOP_NORMAL);
    
    -- each call to "add keyframes" add's another track to the timeline
    timeline:addCurves("Rotate X", 0, 360);
    timeline:addCurves("Rotate Y", 0, 360);
    
    -- Flags are little markers that you can attach text to
    -- They are only useful when listening to bangFired() events
    -- so that you know when one has passed
    timeline:addColors("Colors");

    -- setting framebased to true results in the timeline never skipping frames
    -- and also speeding up with the 
    -- try setting this to true and see the difference
    timeline:setFrameBased(false);
end

function draw()
    of.background(.15*255);
    of.pushMatrix();
    
    of.pushStyle();
    -- set the color to whatever the last color we encountered was
    local r = timeline:getRed("Colors")
    local g = timeline:getGreen("Colors")
    local b = timeline:getBlue("Colors")
    of.setColor(r, g, b);
    
    -- translate to the center of the screen
    of.translate(of.getWidth()*.5, of.getHeight()*.66, 40);
    
    -- Read the values out of the timeline and use them to change the viewport rotation
    of.rotateDeg(timeline:getValue("Rotate X"), 1, 0, 0);
    of.rotateDeg(timeline:getValue("Rotate Y"), 0, 1, 0);
    
    of.drawBox(0,0,0, 200);
    
    of.popMatrix();

    of.popStyle();
    
    timeline:draw();
end