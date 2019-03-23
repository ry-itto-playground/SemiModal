//
//  SecondViewController.swift
//  SemiModal
//
//  Created by 伊藤凌也 on 2019/03/23.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func viewSmaller(_ sender: Any) {
        view.frame.size.height = view.frame.height - 50
    }
    @IBAction func viewLarger(_ sender: Any) {
        view.frame.size.height = view.frame.height + 50
    }
}
