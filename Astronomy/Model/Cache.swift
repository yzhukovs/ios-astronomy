//
//  Cache.swift
//  Astronomy
//
//  Created by Yvette Zhukovsky on 11/29/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

class Cache <Key: Hashable, Value> {
    
    func cache(value: Value, for key: Key){
        cachedItems[key] = value
     
    }
    
    subscript(_ key: Key)-> Value? {
        return cachedItems[key]
        
    }
    
    func value(for key: Key) {
        guard let index = cachedItems.index(forKey: key) else {return}
        cachedItems.remove(at: index)
    }
    
    
    
    
 private var cachedItems: [Key : Value] = [:]
}
