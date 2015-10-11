//
//  DisplayViewController.swift
//  NavigationDemo
//
//  Created by Sana Farooqui on 7/11/15.
//  Copyright (c) 2015 Sana Farooqui. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    var currentPhoto : Photo?
    

    @IBOutlet weak var currentImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var image = UIImage(named: currentPhoto!.filename)
        
        currentImage.image = image

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        var thirdScene = segue.destinationViewController as! InfoViewController
        
        thirdScene.currentPhoto = currentPhoto
    }
    

}
