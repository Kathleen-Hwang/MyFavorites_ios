//
//  Favorite.swift
//  MyFavorites
//
//  Created by Mac on 2016. 9. 20..
//  Copyright © 2016년 Mac. All rights reserved.
//

import UIKit

class Favorite : NSObject, NSCoding {
    // MARK:Properties
    var name: String
    var favorite: Bool
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("favorites")
    
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let favoriteKey = "favorite"
    }

    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey);
        aCoder.encodeBool(favorite, forKey: PropertyKey.favoriteKey);
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let favorite = aDecoder.decodeBoolForKey(PropertyKey.favoriteKey)
 
        // designated initializer
        self.init(name: name, favorite: favorite)
        
    }
    
    init?(name: String, favorite: Bool) {
        self.name = name
        self.favorite = favorite
        
        super.init()
    }
    
    
}
