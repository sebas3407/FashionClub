//
//  StringExtension.swift
//  LMS-pro
//
//  Created by Sebas on 22/05/2020.
//  Copyright © 2020 Raúl Conesa. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.lowercased().dropFirst()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }
    
    func index(at offset: Int, from start: Index? = nil) -> Index? {
        return index(start ?? startIndex, offsetBy: offset, limitedBy: endIndex)
    }
    
    func character(at offset: Int) -> Character? {
        precondition(offset >= 0, "offset can't be negative")
        guard let index = index(at: offset) else { return nil }
        return self[index]
    }
    
    subscript(_ range: CountableRange<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "lowerBound can't be negative")
        let start = index(at: range.lowerBound) ?? endIndex
        return self[start..<(index(at: range.count, from: start) ?? endIndex)]
    }
    
    subscript(_ range: CountableClosedRange<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "lowerBound can't be negative")
        let start = index(at: range.lowerBound) ?? endIndex
        return self[start..<(index(at: range.count, from: start) ?? endIndex)]
    }
    
    subscript(_ range: PartialRangeUpTo<Int>) -> Substring {
        return prefix(range.upperBound)
    }
    
    subscript(_ range: PartialRangeThrough<Int>) -> Substring {
        return prefix(range.upperBound+1)
    }
    
    subscript(_ range: PartialRangeFrom<Int>) -> Substring {
        return suffix(max(0,count-range.lowerBound))
    }
}
