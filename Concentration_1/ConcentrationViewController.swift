//
//  ViewController.swift
//  Concentration_1
//
//  Created by Артём Харичев on 05.02.2020.
//  Copyright © 2020 Артём Харичев. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController
{
    private lazy var game: Concentration = Concentration(numberOfPairsCards: numberOfPairsCards)
    
    var numberOfPairsCards: Int {
            return (cardButtons.count+1) / 2
        
    }
    
    private(set) var flipCount = 0 {
        didSet {
            updateFlipCountLabel()
            
        }
    }
    
    private func updateFlipCountLabel () {
        let attributes: [NSAttributedString.Key:Any] = [
            .strokeWidth : 5.0,
            .strokeColor :  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipCountLabel.attributedText = attributedString
    }
    
    @IBOutlet private weak var flipCountLabel: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex (of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print ("VC: error")
        }
    }
    
    private func updateViewFromModel(){
        if  cardButtons != nil {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for : card), for: UIControl.State.normal )
                button.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
            } else  {
                button.setTitle("", for: UIControl.State.normal )
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
            }
        }
    }
    }
    /*private var emojiChoices = ["👻","🎃","🦅","👹","🕸","🐞","🕷","💀","🦇","🐺"]
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            
            emoji[card] = emojiChoices.remove(at: emojiChoices.count.arc4random)
        }
        return emoji[card] ?? "?"
    }*/
    
    
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
        }
    }
    private var emojiChoices = "👻🎃🦅👹🕸🕷💀🐺"
    
    private var emoji = [Card:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
           return 0
        }
    }
}


