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
        VStack() {
            // 引用类型可能造成循环引用，但 self 是值类型
            Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
            .padding()
            .foregroundColor(Color.orange)
            
            Button(action: {
                withAnimation(.easeInOut(duration: 1.0)) {
                    self.viewModel.restGame()
                }
            }, label: { Text("New Game") })
        }
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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack() {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                    .padding(5).opacity(0.4)
                Text(card.content)
                .font(Font.system(size: fontSize(for: size)))
                .rotationEffect(Angle.degrees(card.isMatched ? 360 :0))
                    .animation(card.isMatched ? Animation.linear(duration: 1).repeatForever(autoreverses: false) : .default)
            }
            .cardify(isFaceUp: card.isFaceUp)
//            .modifier(Cardify(isFaceUp: card.isFaceUp))
        }
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
    
    // MARK: - 常量
    private let fontScaleFactor: CGFloat = 0.7
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
