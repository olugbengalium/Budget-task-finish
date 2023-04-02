//
//  Persistence.swift
//  UICoreData
//
//  Created by Gbenga Abayomi on 03/03/2023.
//

import CoreData
struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "Products")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}
