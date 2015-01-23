//
//  ViewController.swift
//  VideoPlayerDemo
//
//  Created by TheAppGuruz-iOS-103 on 03/01/15.
//  Copyright (c) 2015 TheAppGururz. All rights reserved.
//

import UIKit
import MediaPlayer
import MobileCoreServices

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    
    @IBOutlet weak var vwVideoView: UIView!
    
    var objMoviePlayerController: MPMoviePlayerController = MPMoviePlayerController()
    var urlVideo :NSURL = NSURL()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func btnChooseVideoTapped(sender: AnyObject)
    {
        var ipcVideo = UIImagePickerController()
        ipcVideo.delegate = self
        ipcVideo.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        var kUTTypeMovieAnyObject : AnyObject = kUTTypeMovie as AnyObject
        ipcVideo.mediaTypes = [kUTTypeMovieAnyObject]
        self.presentViewController(ipcVideo, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: NSDictionary)
    {
        urlVideo = info.objectForKey(UIImagePickerControllerMediaURL) as NSURL
        self.dismissViewControllerAnimated(true, completion: nil)
        
        objMoviePlayerController = MPMoviePlayerController(contentURL: urlVideo)
        objMoviePlayerController.movieSourceType = MPMovieSourceType.Unknown
        objMoviePlayerController.view.frame = self.vwVideoView.bounds
        objMoviePlayerController.scalingMode = MPMovieScalingMode.AspectFill
        objMoviePlayerController.controlStyle = MPMovieControlStyle.Embedded
        objMoviePlayerController.shouldAutoplay = true
        
        vwVideoView.addSubview(objMoviePlayerController.view)
        
        objMoviePlayerController.prepareToPlay()
        objMoviePlayerController.play()
    }
}