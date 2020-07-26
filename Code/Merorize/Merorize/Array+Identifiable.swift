//
//  Array+Identifiable.swift
//  Merorize
//
//  Created by 赵彦琦 on 2020/7/12.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        return self.lastIndex(where: { $0.id == matching.id })
        // 这里老师讲的返回 id
        // 如果卡片洗牌之后，会发生卡片位置与 id 不符的情况
        // 比如第一张卡片 id 为 5，index 为 0
        // 那么卡片显示的位置仍然在第六个地方，只是响应在第一个位置
        // 就是点击第一张卡片，显示的是第六张
        // 所以改为上述内容，找到对应 id 的卡片，返回它的 index
//        for i in self {
//            if i.id == matching.id {
//                return i.id as? Int
//            }
//        }
//        return nil
    }
}
