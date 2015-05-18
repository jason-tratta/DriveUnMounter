//
//  AppDelegate.swift
//  DriveUnMounter
//
//  Created by Tratta, Jason A on 5/18/15.
//  Copyright (c) 2015 Jason Tratta. All rights reserved.
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

