//
//  FirstViewController.swift
//  SemiModal
//
//  Created by 伊藤凌也 on 2019/03/23.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func presentViewController(_ sender: Any) {
        presentSemiModal(ChangeHeightTableViewController(), animated: true, completion: nil)
    }
}
