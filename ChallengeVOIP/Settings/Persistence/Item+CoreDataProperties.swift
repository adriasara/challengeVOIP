//
//  Item+CoreDataProperties.swift
//  ChallengeVOIP
//
//  Created by Ádria Sara Cardoso de Oliveira on 30/03/20.
//  Copyright © 2020 Ádria Cardoso. All rights reserved.
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
