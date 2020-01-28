//
//  StarController.swift
//  Starz
//
//  Created by Stephanie Ballard on 1/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

//MVC
//Models
//Views
//Controllers

//Source of truth for the app
class StarController {
    
    init() {
        loadFromPersistentStore()
    }
    
    private(set) var stars: [Star] = []
    
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
            else { return nil }
        // /Users/johnnyhicks/Documents
        
        
        // /Users/johnnyhicks/Document/stars.plist
        return documents.appendingPathComponent("stars.plist")
        
    }
    
    //CRUD
    //Create
    //@discardableResult - you can call the function without doing anything with the return value
    //Throw away the return value if not assigned to anything
    @discardableResult func createStar(named name: String, withDistance distance: Double) -> Star {
        let star = Star(name: name, distance: distance)
        stars.append(star)
        saveToPersistantStore()
        return star
    }
    
    //Read
    
    
    //Update
    
    
    //Delete
    
    //Save and Load
    
    func saveToPersistantStore() {
        guard let url = persistentFileURL else { return }
        //star -> Data -> Plist
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(stars)
            try data.write(to: url)
            
        } catch {
            print("Error saving stars data: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() {
        
        //Data in Plist -> Star objects
        
        let fileManager = FileManager.default
        guard let url = persistentFileURL,
            fileManager.fileExists(atPath: url.path) else { return }
        
        do {
         let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            stars = try decoder.decode([Star].self, from: data)
        } catch {
            print("Error loading stars data: \(error)")
        }
    }
    
}
