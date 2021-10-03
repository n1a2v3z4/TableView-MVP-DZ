//
//  ImageData+CoreDataClass.swift
//  TableView+MVC+DZ
//
//  Created by Cергей Иванович on 28.09.21.
//
//

import Foundation
import CoreData

@objc(ImageData)
public class ImageData: NSManagedObject, Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageData> {
        return NSFetchRequest<ImageData>(entityName: "ImageData")
    }

    @NSManaged public var imageCoreData: Data
    
}
