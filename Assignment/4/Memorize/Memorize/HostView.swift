//
//  HostView.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/17.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import SwiftUI

struct HostView: View {
    let memoryGameView = MemoryGameView(viewModel: MemoryGameViewModel())
    var button: Button = Button("New Game") {
        // TODO: - 刷新游戏
    }
    
    var body: some View {
        VStack() {
            self.button
            self.memoryGameView
        }
    }
}
