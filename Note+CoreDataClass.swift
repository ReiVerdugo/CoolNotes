//
//  Note+CoreDataClass.swift
//  CoolNotes
//
//  Created by Reinaldo  Verdugo on 24/1/17.
//  Copyright © 2017 Reinaldo Verdugo. All rights reserved.
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    convenience init(text: String = "New Note", context: NSManagedObjectContext) {
        if let ent = NSEntityDescription.entity(forEntityName: "Note", in: context) {
            self.init(entity: ent, insertInto: context)
            self.text = text
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
