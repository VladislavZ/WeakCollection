//
//  WeakArray.swift
//  WeatherTest
//
//  Created by Vladimir Nuzhdin on 28.04.2021.
//

import Foundation

public class WeakObject<T: AnyObject> {
    
    weak var object: T?
    
    init(object: T) {
        self.object = object
    }
    
}

public class WeakArray<T> {
    
    private var array: [WeakObject<AnyObject>] = []
    public init() {}
    
   public func add(object: T) {
        array.append(WeakObject(object: object as AnyObject))
    }
    
   public func remove(object: T) {
        guard let index = array.lastIndex(where: { $0.object === object as AnyObject }) else {
            assert(false)
            return
        }
        
        array.remove(at: index)
    }
    
   public func enumerate(_ block: (T)->()) {
        array.forEach {
            if let object = $0.object as? T {
                block(object)
            }
        }
    }
    
}
