/*
Copyright (c) 2012 Justin Walsh, http://thejustinwalsh.com/

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

package com.thejustinwalsh.ane
{
	import flash.desktop.NativeApplication;
	import flash.external.ExtensionContext;
	import flash.system.Capabilities;
	
	public class TestFlight
	{
		private static var extCtx:ExtensionContext;

		public function isSupported():Boolean { return true; }
		
		public static function takeOff(applicationToken:String):Boolean
		{
			if (!extCtx) extCtx = ExtensionContext.createExtensionContext("com.thejustinwalsh.TestFlight", null);
			return extCtx.call("takeOff", applicationToken);
		}

		public static function setDeviceIdentifier():void
		{
			if (!extCtx) return;
			extCtx.call("setDeviceIdentifier");	
		}
		
		public static function setOptions(reinstallCrashHandlers:Boolean, logToConsole:Boolean = true, logToSTDERR:Boolean = true, sendLogOnlyOnCrash:Boolean = false, attachBacktraceToFeedback:Boolean = false, disableInAppUpdates:Boolean = false):void
		{
			if (!extCtx) return;
			extCtx.call("setOptions", reinstallCrashHandlers, logToConsole, logToSTDERR, sendLogOnlyOnCrash);
		}
		
		public static function passCheckpoint(checkpointName:String):void
		{
			if (!extCtx) return;
			extCtx.call("passCheckpoint", checkpointName);
		}
		
		public static function submitFeedback(feedback:String):void
		{
			if (!extCtx) return;
			extCtx.call("submitFeedback", feedback);
		}
		
		public static function openFeedbackView():void
		{
			if (!extCtx) return;
			extCtx.call("openFeedbackView");
		}
		
		public static function log(...args):void
		{
			var message:String = "";
			if (args.length > 0 && args[0] is Array) args = args[0];

			for (var i:int = 0; i < args.length; ++i) {
				if (i > 0) message += " ";
				message += args[i].toString();
			}

			if (!!extCtx) extCtx.call("log", message);
			trace(message);
		}
	}
}