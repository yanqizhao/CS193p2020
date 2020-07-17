//
//  Arrary+Identifiable.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/16.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for i in self {
            if i.id == matching.id {
                return i.id as? Int
            }
        }
        return nil
    }
}
