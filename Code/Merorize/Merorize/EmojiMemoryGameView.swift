//
//  EmojiMemoryGameView.swift
//  Merorize
//
//  Created by 赵彦琦 on 2020/5/31.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    // 不能添加访问控制，创建 EmojiMemoryGameView 时需要初始化 viewModel
    @ObservedObject var viewModel: EmojiMemoryGame
    
    // 不能添加访问控制，系统会调用
    var body: some View {
        // 引用类型可能造成循环引用，但 self 是值类型
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
            .padding(5)
        }
        .padding()
        .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    // 不能添加访问控制，创建 CardView 时需要初始化 card
    var card : MemoryGame<String>.Card
    
    // 不能添加访问控制，系统会调用
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    private func body(for size: CGSize) -> some View {
        ZStack() {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }
            else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: 10.0).fill()
                }
            }
        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - 常量
    private let cornerRadius: CGFloat = 10.0
    private let edgeLineWidth: CGFloat = 3
    private let fontScaleFactor: CGFloat = 0.75
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}





























struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
