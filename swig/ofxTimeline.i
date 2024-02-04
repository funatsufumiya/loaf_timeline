%module ofxTimeline
%{
#include "ofxTimeline.h"
%}

// STL types
%include <std_string.i>

typedef std::string string;

// includes
%include "ofxTimeline/src/ofxTimeline.h"

%extend ofxTimeline {
    void setLoopType(short value) {
        $self->setLoopType((ofLoopType)value);
    }

    float getRed(string trackName) {
        return $self->getColor(trackName).r;
    }

    float getGreen(string trackName) {
        return $self->getColor(trackName).g;
    }

    float getBlue(string trackName) {
        return $self->getColor(trackName).b;
    }

    float getAlpha(string trackName) {
        return $self->getColor(trackName).a;
    }

    void addCurves(string trackName, float min, float max) {
        $self->addCurves(trackName, ofRange(min, max));
    }
}