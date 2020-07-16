//
//  ContentView.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/10.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // 视图拥有一个视图模型实例
    var viewModel: MemoryGameViewModel
    
    var body: some View {
        HStack() {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
            }
        }
        // 内边距
        .padding()
        // 前景色(包括字体颜色)
        .foregroundColor(Color.orange)
        // 字体加大
        .font(viewModel.cards.count == 10 ? nil : Font.largeTitle)
    }
}

struct CardView: View {
    // 卡片视图拥有一个卡片模型实例
    var card: MemoryGameModel<String>.Card
    
    var body: some View {
        ZStack() {
            if(card.isFaceup) {
                // 圆角尺寸为 10 填充色为白色的圆角矩形
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                // 圆角尺寸为 10 边框线宽为 3 的圆角矩形
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth:3)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: MemoryGameViewModel())
    }
}
