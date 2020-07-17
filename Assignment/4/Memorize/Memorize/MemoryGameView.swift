//
//  MemoryGameView.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/10.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    // 视图拥有一个视图模型实例
    // 添加观察
    @ObservedObject var viewModel: MemoryGameViewModel
    
    var body: some View {
        Grid(viewModel.cards) { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
        }
        // 内边距
        .padding()
        // 前景色(包括字体颜色)
        .foregroundColor(Color.orange)
        // 字体加大
//        .font(viewModel.cards.count == 10 ? nil : Font.largeTitle)
    }
}

struct CardView: View {
    // 卡片视图拥有一个卡片模型实例
    var card: MemoryGameModel<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack() {
            if(card.isFaceup) {
                // 圆角尺寸为 10 填充色为白色的圆角矩形
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                // 圆角尺寸为 10 边框线宽为 3 的圆角矩形
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth:edgeLineWidth)
                Text(card.content)
            }
            else {
                if !card.isMatched {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
        }
//        .aspectRatio(fontScaleFactor, contentMode: .fit)
        .font(Font.system(size: fontSize(for: size)))
        .padding(5)
    }
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 2/3
    
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGameView(viewModel: MemoryGameViewModel())
    }
}
