//
//  Notebook+CoreDataClass.swift
//  CoolNotes
//
//  Created by Reinaldo  Verdugo on 24/1/17.
//  Copyright © 2017 Reinaldo Verdugo. All rights reserved.
//

import Foundation
import CoreData

@objc(Notebook)
public class Notebook: NSManagedObject {
    convenience init(title: String = "New Notebook", context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "Notebook", in: context) {
            self.init(entity: ent, insertInto: context)
            self.title = title
            self.creationDate = NSDate()
            
        } else {
            fatalError("Unable to find entity name")
        }
        
        var humanReadableAge : String {
            get {
                let fmt = DateFormatter()
                fmt.timeStyle = .none
                fmt.dateStyle = .short
                fmt.doesRelativeDateFormatting = true
                fmt.locale = Locale.current
                
                return fmt.string(from: creationDate! as Date)
            }
        }
    }
}
