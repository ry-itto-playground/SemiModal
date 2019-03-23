//
//  SemiModalPresentationController.swift
//  SemiModal
//
//  Created by 伊藤凌也 on 2019/03/23.
//  Copyright © 2019 ry-itto. All rights reserved.
//

import UIKit

class SemiModalPresentationController: UIPresentationController {
    private let overlayView = UIView()
    
    override var frameOfPresentedViewInContainerView: CGRect {
        guard
            var frame = containerView?.frame,
            let presentedView = presentedView else { return .zero }
        frame.origin.y = frame.height - presentedView.frame.height
        frame.size.height = presentedView.frame.height
        return frame
    }
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView = containerView else { return }
        overlayView.frame = containerView.frame
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.0
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapOnOverlay(_:)))
        tapGestureRecognizer.isEnabled = true
        overlayView.gestureRecognizers = [tapGestureRecognizer]
        containerView.insertSubview(overlayView, at: 0)
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] _ in
            self?.overlayView.alpha = 0.3
            }, completion: nil)
    }
    
    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
    }
    
    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [weak self] _ in
            self?.overlayView.alpha = 0.0
        }, completion: nil)
    }
    
    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
        if completed {
            overlayView.removeFromSuperview()
        }
    }
    
    @objc private func tapOnOverlay(_ gesture: UITapGestureRecognizer) {
        self.presentedViewController.dismiss(animated: true, completion: nil)
    }
}
