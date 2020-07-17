//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/10.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        // $0 为第一个参数 index
        get { cards.indices.filter { cards[$0].isFaceup }.only }
        set {
            for index in cards.indices {
                cards[index].isFaceup = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceup, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceup = true
            }
            else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
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
        var isFaceup = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }
}
