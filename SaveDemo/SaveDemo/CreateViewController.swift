//
//  CreateViewController.swift
//  SaveDemo
//
//  Created by Sana Farooqui on 7/12/15.
//  Copyright (c) 2015 Sana Farooqui. All rights reserved.
//

import UIKit
import CoreData

class CreateViewController: UIViewController {

    @IBAction func CreateModelData(sender: AnyObject) {
        //  NSManagedObject myMo = NSManagedObject(entity: <#NSEntityDescription#>, insertIntoManagedObjectContext: <#NSManagedObjectContext?#>)
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        
        //let entityDescription = NSEntityDescription.entityForName("Course", inManagedObjectContext: self.managedObjectContext!)
        
        let mo:Course = NSEntityDescription.insertNewObjectForEntityForName("Course", inManagedObjectContext: managedObjectContext!) as! Course
        
        mo.title = "Core data leaarning"
        mo.author = "Sanyo"
        mo.releaseDate = NSDate()
        
        
        managedObjectContext?.save(nil)
        
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
