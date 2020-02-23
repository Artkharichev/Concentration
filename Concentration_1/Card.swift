//
//  Card.swift
//  Concentration_1
//
//  Created by Артём Харичев on 18.02.2020.
//  Copyright © 2020 Артём Харичев. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdintifier() -> Int {
        identifierFactory += 1
        return identifierFactory
        
    }
    
    init() {
        self.identifier = Card.getUniqueIdintifier()
    }
    
}
