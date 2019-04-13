//
//  Test.swift
//  CanIWin
//
//  Created by Ievgeniia Bondini on 4/10/19.
//  Copyright © 2019 Ievgeniia Bondini. All rights reserved.
//

import Foundation
//
//  CanIWin.swift
//  BinaryTree
//
//  Created by Ievgeniia Bondini on 4/8/19.
//  Copyright © 2019 Ievgeniia Bondini. All rights reserved.
//

class Solution {
    
    var memo = [String: Bool] ()
    
    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        if desiredTotal<=maxChoosableInteger {
            return true
        }
        
        if (1 + maxChoosableInteger) / 2 * maxChoosableInteger < desiredTotal {
            return false
        }
        var chosen = Array(repeating: false, count: maxChoosableInteger+1)
        return canIWinWithSituation(maxChoosableInteger, desiredTotal, &chosen)
    }
    
    
    func canIWinWithSituation(_ maxChoosableInteger: Int, _ curDesiredTotal: Int, _ chosen : inout [Bool]) -> Bool {
        print(maxChoosableInteger, curDesiredTotal, chosen)
        if curDesiredTotal <= 0 {
            return false
        }
        let chosenSerialization = chosen.map({ if $0 {return "1"} else {return "0"}  }).joined(separator: "")
        
        
        if let result = memo[chosenSerialization] {
            return result
        }
        
        for i in 1...maxChoosableInteger {
            if chosen[i] {
                continue
            }
            chosen[i] = true
            
            if (!canIWinWithSituation(maxChoosableInteger, curDesiredTotal - i, &chosen)) {
                memo[chosenSerialization] = true
                chosen[i] = false
                return true
            }
            chosen[i] = false
        }
        memo[chosenSerialization] = false
        return false
    }
}
