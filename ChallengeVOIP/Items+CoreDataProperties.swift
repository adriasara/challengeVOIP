//
//  Items+CoreDataProperties.swift
//  
//
//  Created by Ádria Sara Cardoso de Oliveira on 28/03/20.
//
//

import Foundation
import CoreData


extension Items {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Items> {
        return NSFetchRequest<Items>(entityName: "Items")
    }

    @NSManaged public var id: Int16
    @NSManaged public var full_name: String?
    @NSManaged public var node_id: String?

}
