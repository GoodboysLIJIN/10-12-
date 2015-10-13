//
//  person.swift
//  10-12通信录
//
//  Created by 李进 on 15/10/12.
//  Copyright © 2015年 李进. All rights reserved.
//

import UIKit

class person: NSObject {
    
    var name: String?
    
    var age: Int = 0
    
    init(dist: [String: AnyObject]) {
        
        super.init()
        
        setValuesForKeysWithDictionary(dist)
        
        
    }
    
    override var description: String{
        
        let key = ["name", "age"]
        
        return "\(dictionaryWithValuesForKeys(key))"
    }

}


