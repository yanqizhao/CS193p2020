//
//  Array+Only.swift
//  Memorize
//
//  Created by 赵彦琦 on 2020/7/17.
//  Copyright © 2020 yanqizhao. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
