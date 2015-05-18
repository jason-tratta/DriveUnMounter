//
//  ViewController.swift
//  DriveUnMounter
//
//  Created by Tratta, Jason A on 5/18/15.
//  Copyright (c) 2015 Jason Tratta. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func Test(sender: AnyObject) {
        
        
        let mountedMedia = NSWorkspace.sharedWorkspace().mountedRemovableMedia()
        
        
        for volume:AnyObject in mountedMedia {
            
            
            NSWorkspace.sharedWorkspace().unmountAndEjectDeviceAtPath(volume as! String)


        
    }

}

}
