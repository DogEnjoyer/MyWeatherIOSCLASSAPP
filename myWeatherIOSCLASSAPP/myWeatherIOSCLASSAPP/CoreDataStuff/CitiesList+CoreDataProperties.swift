//
//  CitiesList+CoreDataProperties.swift
//  myWeatherIOSCLASSAPP
//
//  Created by user209830 on 12/5/21.
//
//

import Foundation
import CoreData


extension CitiesList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CitiesList> {
        return NSFetchRequest<CitiesList>(entityName: "CitiesList")
    }

    @NSManaged public var cityName: String?

}

extension CitiesList : Identifiable {

}
