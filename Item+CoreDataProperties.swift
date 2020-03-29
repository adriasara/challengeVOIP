//
//  Item+CoreDataProperties.swift
//  
//
//  Created by Ádria Sara Cardoso de Oliveira on 29/03/20.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var buttonText: String?
    @NSManaged public var full_name: String?
    @NSManaged public var id: String?
    @NSManaged public var node_id: String?

}
