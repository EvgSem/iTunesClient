//
//  ViewController.swift
//  CanIWin
//
//  Created by Ievgeniia Bondini on 4/10/19.
//  Copyright © 2019 Ievgeniia Bondini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let test = Solution()
        print(test.canIWin(10, 30))
        // Do any additional setup after loading the view, typically from a nib.
    }


}

