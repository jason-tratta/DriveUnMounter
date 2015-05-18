//
//  AppDelegate.swift
//  DriveUnMounter
//
//  Created by Tratta, Jason A on 5/18/15.
//  Copyright (c) 2015 Jason Tratta. All rights reserved.
//
//  The MIT License (MIT)
//
//Copyright (c) 2015 Jason Tratta
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.
//


import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {



    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: "switchHandler:", name: NSWorkspaceSessionDidBecomeActiveNotification, object: nil)
        
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: "switchHandler:", name: NSWorkspaceSessionDidResignActiveNotification, object: nil)
        

    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


    
    func switchHandler(notification: NSNotification) {
        
        println("User Switch Detected: Removeing unmounting removable media.")
        
        let mountedMedia = NSWorkspace.sharedWorkspace().mountedRemovableMedia()
    
    
        for volume:AnyObject in mountedMedia {
            
            
            NSWorkspace.sharedWorkspace().unmountAndEjectDeviceAtPath(volume as! String)
            
            
        }

        
        
    }
}

