//
//  SecondViewController.swift
//  SemiModal
//
//  Created by 伊藤凌也 on 2019/03/23.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var semiModalPresentationController: SemiModalPresentationController?

    override func viewDidLoad() {
        super.viewDidLoad()
        semiModalPresentationController = presentationController as? SemiModalPresentationController
    }
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func viewSmaller(_ sender: Any) {
        semiModalPresentationController?.updateHeight(newHeight: view.frame.height - 20)
    }
    @IBAction func viewLarger(_ sender: Any) {
        semiModalPresentationController?.updateHeight(newHeight: view.frame.height + 20)
    }
}
