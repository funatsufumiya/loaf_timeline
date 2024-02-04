%module ofxTimeline
%{
#include "ofxTLTrack.h"
#include "ofxTLColorTrack.h"
#include "ofxTLEmptyTrack.h"
#include "ofxTLEmptyKeyframes.h"
#include "ofxTLVideoTrack.h"
#include "ofxTLImageSequence.h"
#include "ofxTLSwitches.h"
#include "ofxTLBangs.h"
#include "ofxTLCameraTrack.h"
#include "ofxTLAudioTrack.h"
#include "ofxTimeline.h"
%}

// STL types
%include <std_string.i>

typedef std::string string;

// includes
%include "ofxTimeline/src/ofxTLTrack.h"
%include "ofxTimeline/src/ofxTLKeyframes.h"
%include "ofxTimeline/src/ofxTLColorTrack.h"
%include "ofxTimeline/src/ofxTLEmptyTrack.h"
%include "ofxTimeline/src/ofxTLEmptyKeyframes.h"
%include "ofxTimeline/src/ofxTLVideoTrack.h"
%include "ofxTimeline/src/ofxTLImageSequence.h"
%include "ofxTimeline/src/ofxTLSwitches.h"
%include "ofxTimeline/src/ofxTLBangs.h"
%include "ofxTimeline/src/ofxTLCameraTrack.h"
%include "ofxTimeline/src/ofxTLAudioTrack.h"
%include "ofxTimeline/src/ofxTimeline.h"

%extend ofxTimeline {
    void setLoopType(short value) {
        $self->setLoopType((ofLoopType)value);
    }

    float getR(string trackName) {
        return $self->getColor(trackName).r;
    }

    float getG(string trackName) {
        return $self->getColor(trackName).g;
    }

    float getB(string trackName) {
        return $self->getColor(trackName).b;
    }

    float getA(string trackName) {
        return $self->getColor(trackName).a;
    }

    void addCurves(string trackName, float min, float max) {
        $self->addCurves(trackName, ofRange(min, max));
    }
}

%extend ofxTLEmptyKeyframes {
    ofxTLTrack *getTrack() {
        return (ofxTLTrack *)$self;
    }
}

%extend ofxTLAudioTrack {
    ofxTLTrack *getTrack() {
        return (ofxTLTrack *)$self;
    }
}

%extend ofxTLCameraTrack {
    ofxTLTrack *getTrack() {
        return (ofxTLTrack *)$self;
    }

    void setLockCameraToTrack(bool value) {
        $self->lockCameraToTrack = value;
    }

    bool getLockCameraToTrack() {
        return $self->lockCameraToTrack;
    }
}

%extend ofxTLVideoTrack {
    ofxTLTrack *getTrack() {
        return (ofxTLTrack *)$self;
    }
}

%extend ofxTLImageSequence {
    ofxTLTrack *getTrack() {
        return (ofxTLTrack *)$self;
    }
}

%extend ofxTLColorTrack {
    ofxTLTrack *getTrack() {
        return (ofxTLTrack *)$self;
    }
}

%extend ofxTLEmptyTrack {
    ofxTLTrack *getTrack() {
        return (ofxTLTrack *)$self;
    }
}

%extend ofxTLSwitches {
    ofxTLTrack *getTrack() {
        return (ofxTLTrack *)$self;
    }
}

%extend ofxTLBangs {
    ofxTLTrack *getTrack() {
        return (ofxTLTrack *)$self;
    }
}

%extend ofxTLTrack {
    ofxTLKeyframes *getKeyframes() {
        return (ofxTLKeyframes *)$self;
    }
}