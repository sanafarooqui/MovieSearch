//
//  Course.swift
//  
//
//  Created by Sana Farooqui on 7/12/15.
//
//

import Foundation
import CoreData

class Course: NSManagedObject {

    @NSManaged var author: String
    @NSManaged var releaseDate: NSDate
    @NSManaged var title: String

}
