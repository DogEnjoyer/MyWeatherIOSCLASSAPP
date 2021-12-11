//
//  FortuneStorage+CoreDataProperties.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 12/10/21.
//
//

import Foundation
import CoreData


extension FortuneStorage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FortuneStorage> {
        return NSFetchRequest<FortuneStorage>(entityName: "FortuneStorage")
    }

    @NSManaged public var storedNum: Int32

}

extension FortuneStorage : Identifiable {

}
