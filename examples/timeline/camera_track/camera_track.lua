timeline = ofxTimeline.ofxTimeline()
cam = of.EasyCam()
cameraTrack = ofxTimeline.ofxTLCameraTrack()
boxes = {}
makeCameraPoint = of.Rectangle()
toggleLockTrack = of.Rectangle()
particles = of.VboMesh()

function setup()
    of.setWindowTitle("camera track")
    of.setWindowShape(1024, 768)

    of.setFrameRate(30);
	of.setVerticalSync(true);

	of.enableSmoothing();
	of.enableAlphaBlending();
	
	timeline:setup();
	timeline:setLoopType(of.LOOP_NORMAL);
	timeline:setDurationInSeconds(30);

	cameraTrack:setCamera(cam)
	timeline:addTrack("Camera", cameraTrack:getTrack());
	
	cameraTrack:setLockCameraToTrack(true);
	timeline:play();

    for y = -1000, 1000, 2 do
        table.insert(boxes, of.Vec3f(math.cos(y/10.0)*math.abs(y), y, math.sin(y/10.0)*math.abs(y)):vec3())
    end

    for i = 0, 10000 do
        particles:addVertex(of.Vec3f(of.random(-2000,2000),
                                    of.random(-2000,2000),
                                    of.random(-2000,2000)):vec3())
        particles:addColor(of.FloatColor(of.randomuf()))
    end
end

function draw()
    of.backgroundGradient(of.Color(255*.15), of.Color.black, of.GRADIENT_CIRCULAR)

    cam:beginCamera()
    for i = 1, #boxes do
        of.setColor(of.Color.yellowGreen:getLerped(of.Color.blueViolet, 1.0*i/#boxes))
        of.pushMatrix()
        of.rotateDeg(of.getFrameNum()*i/100.0, 0, 1, 0)
        of.drawBox(boxes[i], 5)
        of.popMatrix()
    end
    particles:drawVertices()
    cam:endCamera()
    
    timeline:draw()
end

function keyPressed(key)
    if key == string.byte('l') or key == string.byte('L') then
        cameraTrack:setLockCameraToTrack(not cameraTrack:getLockCameraToTrack())
    elseif key == string.byte('t') or key == string.byte('T') then
        cameraTrack:getTrack():getKeyframes():addKeyframe()
    end
end