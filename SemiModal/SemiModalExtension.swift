//
//  SemiModalExtension.swift
//  SemiModal
//
//  Created by 伊藤凌也 on 2019/03/24.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentSemiModal(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        
        let transitioningDelegate = TransitioningDelegate()
        
        viewControllerToPresent.transitioningDelegate = transitioningDelegate
        viewControllerToPresent.modalPresentationStyle = .custom
        present(viewControllerToPresent, animated: flag, completion: completion)
    }
}

class TransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SemiModalPresentationController(presentedViewController: presented, presenting: presenting)
    }
}

