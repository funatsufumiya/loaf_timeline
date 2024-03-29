/*==============================================================================

	loaf: lua, osc, and openFrameworks
  
	Copyright (c) 2016 Dan Wilcox <danomatika@gmail.com>

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU General Public License as published by
	the Free Software Foundation, either version 3 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU General Public License for more details.

	You should have received a copy of the GNU General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.
	
	See https://github.com/danomatika/loaf for documentation

==============================================================================*/
#pragma once

#include "ofMain.h"

#include "config.h"
#include "Script.h"
#include "PathWatcher.h"
#include "ofxOscSender.h"
#include "ofxOscReceiver.h"
#include "Syphon.h"
#include "CommandLine.h"

class ofApp : public ofBaseApp {

	public:
	
	/// \section ofApp
	
		void setup();
		void update();
		void draw();
		void exit();

		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y);
		void mouseDragged(int x, int y, int button);
		void mousePressed(int x, int y, int button);
		void mouseReleased(int x, int y, int button);
		void mouseEntered(int x, int y);
		void mouseExited(int x, int y);
		void windowResized(int w, int h);
		void dragEvent(ofDragInfo dragInfo);
		void gotMessage(ofMessage msg);

	/// \section Bundled Script

		/// returns platform bundled script path:
		/// * macOS: .app/Contents/Resources/data
		/// * Windows & Linux: default data directory
		static std::string bundledScriptPath();

		/// returns true if there is a bundled script
		static bool isBundledScript();

		/// try loading a bundled script
		bool loadBundledScript(const std::vector<std::string> *args=nullptr);

	/// \section Utils
	
		/// enable/disable loaf verbosity
		void setVerbose(bool verbose);
	
		/// get loaf verbosity level
		bool isVerbose();

		/// enable/disable loaf default key bindings
		void setUseDefaultKeys(bool defaultKeys);

		/// get loaf default key bindings
		bool useDefaultKeys();

		/// get loaf bundled status
		bool isBundled();
	
	/// \section OSC
	
		/// start listening for OSC messages
		void startListening();
	
		/// stop listenig for OSC messages
		void stopListening();
	
		/// set the listen port, checks for valid range
		void setListenPort(int port);
	
		/// set the sender host
		void setSendHost(const std::string &host);
	
		/// set the sender port, checks for valid range
		void setSendPort(int port);
	
		/// OSC received callback
		void oscReceived(const ofxOscMessage &message);

	/// \section Syphon

		/// start the Syphon server
		void startSyphon();

		/// stop the Syphon server
		void stopSyphon();

		/// set the Syphon server name
		void setSyphonName(const std::string &name);
	
	/// \section PathWatcher
	
		/// patch change callback
		void pathChanged(const PathWatcher::Event &event);
	
	/// \section Data

		CommandLine *options = nullptr; //< commandline options, only valid in setup()
		PathWatcher watcher; //< path change watcher
		Script script; //< script manager
		
		ofxOscSender sender; //< OSC message sender
		ofxOscReceiver listener; //< OSC message listener
		std::string baseAddress = BASE_ADDRESS; //< base OSC address for loaf control messages

		Syphon syphon; //< Syphon server

		std::string startDir; //< working directory on app start

	private:
	
		bool verbose = false; //< current verbosity
		bool bundled = false; //< is this a bundled project?
		bool defaultKeys = true; //< use default key bindings?
};
