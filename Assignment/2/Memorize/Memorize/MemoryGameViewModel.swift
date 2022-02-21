//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/10.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import SwiftUI

class MemoryGameViewModel {
    // 类没有逐一成员构造器
    // 成员变量初始化方法：1. 声明(如下) 2. 自定义构造器
    
    // 私有可写，公有可读，“玻璃门”
//    private(set) var model: MemoryGameModel<String>
    private var model: MemoryGameModel<String> = MemoryGameViewModel.createMemoryGameModel()
    
    static func createMemoryGameModel() -> MemoryGameModel<String> {
        let emojis = ["👻", "🎃", "🙂", "🤯", "🐱", "🦄", "🍀", "🍤", "🍭", "🎂", "🍰", "🍺"].shuffled()
        return MemoryGameModel<String>(numberOfPairsOfCards: Int.random(in: 2...5)) {
            pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGameModel<String>.Card> {
        model.cards.shuffled()
    }
    
    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }
}

struct MemoryGameViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
