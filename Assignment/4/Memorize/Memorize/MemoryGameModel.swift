//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/10.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import SwiftUI

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    var cards: Array<Card>
    var theme: Theme
    var points: Int
    
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
                self.cards[chosenIndex].isFaceup = true
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    points += 2
                }
                else {
                    points -= cards[potentialMatchIndex].hasBeenSeen ? 1 : 0
                    points -= cards[chosenIndex].hasBeenSeen ? 1 : 0
                }
                cards[chosenIndex].hasBeenSeen = true
                cards[potentialMatchIndex].hasBeenSeen = true
            }
            else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
        print("Choose card: \(card)")
    }
    
    init(theme: Theme) {
        points = 0
        cards = Array<Card>()
        self.theme = theme
        let t = theme.contents.shuffled()
        
        for pairIndex in 0..<theme.numberOfCardsToShow {
            let content = t[pairIndex]
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceup = false
        var isMatched = false
        var hasBeenSeen = false
        var content: CardContent
        var id: Int
    }
    
    struct Theme {
        var name: String
        var numberOfCardsToShow: Int = Int.random(in: 2...5)
        var color: Color
        var contents: [CardContent]
    }
}
