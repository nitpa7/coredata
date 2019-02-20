//
//  Person+CoreDataProperties.swift
//  SavingData
//
//  Created by Nitesh  on 20/02/19.
//  Copyright © 2019 Nitesh . All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: Int16

}
