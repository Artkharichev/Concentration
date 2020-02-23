//
//  Concentration_1.swift
//  Concentration_1
//
//  Created by Артём Харичев on 18.02.2020.
//  Copyright © 2020 Артём Харичев. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card] () // Создание пустого массива из структур
    
    var indexOfOneAndOnlyFaceUpCard : Int?
    
    func chooseCard (at index: Int) {
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard , matchIndex != index {
                // check card
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            } else {
                // 0 or 2
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
            
        }
        
    }
    init(numberOfPairsCard: Int){
        // Заполняю пустой массив в соответствии с кол-вом карт
        for _ in 1...numberOfPairsCard {
            let card = Card()
            cards += [card, card]
        }
        // MART: CHAPTER 1
        cards = cards.shuffled()
    }
}
