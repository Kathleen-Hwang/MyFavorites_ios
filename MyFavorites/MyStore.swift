//
//  MyStore.swift
//  MyFavorites
//
//  Created by Mac on 2016. 9. 21..
//  Copyright © 2016년 Mac. All rights reserved.
//

import UIKit

class MyStore: NSObject {
    private static var favorites = [Favorite]()
    
    // MARK: NSCoding
    private class func saveFavorites() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(favorites, toFile: Favorite.ArchiveURL.path!)
        if !isSuccessfulSave {
            print("Failed to save favorites...")
        }
    }
    
    private class func loadFromFile() -> [Favorite]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Favorite.ArchiveURL.path!) as? [Favorite]
    }
    
    // default
    private class func loadDefaultFavorites() {
        let favorite1 = Favorite(name: "South Korea", favorite: false)
        let favorite2 = Favorite(name: "France", favorite: false)
        let favorite3 = Favorite(name: "Canada", favorite: false)
        
        favorites += [favorite1!, favorite2!, favorite3!]
    }
    
    class func loadFavorites() {
        if let savedFavorites = MyStore.loadFromFile() {
            favorites += savedFavorites
        } else {
            loadDefaultFavorites()
        }
    }
    
    class func getFavoriteCount() -> Int {
        return favorites.count
    }
    
    class func getAtIndex(index: Int) -> Favorite {
        return favorites[index]
    }
    
    class func clear() {
        favorites.removeAll()
    }
    
    class func updateFavorites(name :String, on :Bool) {
        for favorite in favorites {
            if favorite.name == name {
                favorite.favorite = on
                break
            }
        }
        
        saveFavorites()
    }
}
