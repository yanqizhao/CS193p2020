//
//  EmojiMemoryGame.swift
//  Merorize
//
//  Created by 赵彦琦 on 2020/7/7.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    
//    private(set) var model: MemoryGame<String>
    
//    private var model: MemoryGame<String> =
//        MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "👻" }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🐱", "🦄"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
