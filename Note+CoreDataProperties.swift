//
//  Note+CoreDataProperties.swift
//  CoolNotes
//
//  Created by Reinaldo  Verdugo on 24/1/17.
//  Copyright © 2017 Reinaldo Verdugo. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var creationDate: NSDate?
    @NSManaged public var text: String?
    @NSManaged public var notebook: Notebook?

}
