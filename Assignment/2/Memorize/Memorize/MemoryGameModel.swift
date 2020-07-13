//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/10.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import Foundation

struct MemoryGameModel<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("Choose card: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory:(Int) -> (CardContent)) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceup = true
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
