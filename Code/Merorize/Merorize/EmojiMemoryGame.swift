//
//  EmojiMemoryGame.swift
//  Merorize
//
//  Created by 赵彦琦 on 2020/7/7.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

// ViewModel 本质上还是跟 UI 相关的东西
// 它知道所有的 UI 是如何绘制的
import SwiftUI

class EmojiMemoryGame: ObservableObject {
    // 私有可写，公有可读，“玻璃门”
//    private(set) var model: MemoryGame<String>
    
//    private var model: MemoryGame<String> =
//        MemoryGame<String>(numberOfPairsOfCards: 2) { _ in "👻" }
    
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    // 属性 model 初始化时，类的实例对象还没有初始化完成，所以不能调用实例方法，故改为静态方法
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻", "🎃", "🐱"/*, "🦄"*/]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    
    // 声明该方法后， model 属性就可以完全私有，无需公有可读了
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intents
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func restGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
}
