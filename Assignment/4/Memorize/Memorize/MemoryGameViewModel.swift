//
//  MemoryGameViewModel.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/10.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import SwiftUI

// 遵循 ObservableObject 协议
class MemoryGameViewModel: ObservableObject {
    // 类没有逐一成员构造器
    // 成员变量初始化方法：1. 声明(如下) 2. 自定义构造器
    // 发布变化
    @Published private var model: MemoryGameModel<String> = MemoryGameViewModel.createMemoryGameModel()
    
    static func createMemoryGameModel() -> MemoryGameModel<String> {
        let opacity = 0.7
        
        let themes: [MemoryGameModel<String>.Theme] =
            [MemoryGameModel.Theme(name: Themes.Halloween.rawValue, color: Color.orange, contents: ["👻", "🎃", "🍬", "☠️", "😈"]),
             MemoryGameModel.Theme(name: Themes.Animal.rawValue, color: Color.green.opacity(opacity), contents: ["🐱", "🦄", "🦊", "🐒", "🐠"]),
             MemoryGameModel.Theme(name: Themes.Plant.rawValue, color: Color.purple.opacity(opacity), contents: ["🌸", "🍀", "🌿", "🌱", "🍁"]),
             MemoryGameModel.Theme(name: Themes.Face.rawValue, color: Color.red.opacity(opacity), contents: ["🙂", "🤯", "🥶", "🤔", "😬"]),
             MemoryGameModel.Theme(name: Themes.Food.rawValue, color: Color.yellow.opacity(opacity), contents: ["🍤", "🍭", "🎂", "🍰", "🍺"]),
             MemoryGameModel.Theme(name: Themes.Weather.rawValue, color: Color.blue.opacity(opacity), contents: ["☀️", "🌤", "🌦", "⛈", "☃️"])].shuffled()

        let theme = themes.first!
        
        return MemoryGameModel<String>(theme: theme)
    }
    
    var cards: Array<MemoryGameModel<String>.Card> {
        model.cards
    }
    
    var theme: MemoryGameModel<String>.Theme {
        model.theme
    }
    
    var points: Int {
        model.points
    }
    
    func choose(card: MemoryGameModel<String>.Card) {
        model.choose(card: card)
    }
    
    enum Themes: String {
        case Halloween, Animal, Plant, Face, Food, Weather
    }
}

struct MemoryGameViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
