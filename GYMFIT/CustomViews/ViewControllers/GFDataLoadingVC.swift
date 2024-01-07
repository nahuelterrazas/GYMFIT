//
//  GFDataLoadingVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 03/01/2024.
//

import UIKit

var emptyStateView: EmptyStateUIView!

class GFDataLoadingVC: UIViewController {

    var containerView: UIView!
    
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        view.addSubview(containerView)

        UIView.animate(withDuration: 0.25) { self.containerView.alpha = 0.8 }

        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        activityIndicator.color = .systemYellow
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
        
        activityIndicator.startAnimating()
    }
    
    
    func dismissLoadingView() {
        self.containerView.removeFromSuperview()
        self.containerView = nil
    }
    
    
    
    func showEmptyStateView(with message: String, with submessage: String, in view: UIView) {
        emptyStateView = EmptyStateUIView(title: message, subtitle: submessage)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
}
