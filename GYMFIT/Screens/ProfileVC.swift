//
//  ProfileVC.swift
//  GYMFIT
//
//  Created by Nahuel Terrazas on 09/01/2024.
//

import UIKit

class ProfileVC: UIViewController {

    let scrollView  = UIScrollView()
    let contentView = UIView()
    let profileView = UIView()
    let plansView   = UIView()
    let activitiesView = UIView()
    var plansViewHeight: NSLayoutConstraint!
    var activitiesViewHeight: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureProfileView()
        configurePlansView()
        configureActivitiesView()
    }

    
    func configure() {
        view.backgroundColor = .secondarySystemBackground
        navigationController?.isNavigationBarHidden = true

        view.addSubview(scrollView)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = UIColor(patternImage: .yellowGradient)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(contentView)
        contentView.frame = scrollView.bounds
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    
    func configureProfileView() {
        add(childVC: ProfileInfoVC(), to: profileView)
        
        contentView.addSubview(profileView)
        profileView.layer.cornerRadius = 10
        profileView.backgroundColor = .secondarySystemGroupedBackground
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 80),
            profileView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 160),
            profileView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
    }
    
    
    func add(childVC: UIViewController, to containerView: UIView){
        addChild(childVC)
        containerView.addSubview(childVC.view)
        DispatchQueue.main.async {
            childVC.view.frame = containerView.bounds
        }
        childVC.didMove(toParent: self)
    }
    
    
    func configurePlansView() {
        let plansVC = PlansVC()
        plansVC.delegate = self
        add(childVC: plansVC, to: plansView)
        
        contentView.addSubview(plansView)
        plansView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            plansView.topAnchor.constraint(equalTo: profileView.bottomAnchor),
            plansView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            plansView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        plansViewHeight = plansView.heightAnchor.constraint(equalToConstant: 115)
        plansViewHeight.isActive = true
    }
    
    
    func configureActivitiesView() {
        let activitiesVC = ActivitiesVC()
        activitiesVC.delegate = self
        add(childVC: activitiesVC, to: activitiesView)
        
        contentView.addSubview(activitiesView)
        activitiesView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            activitiesView.topAnchor.constraint(equalTo: plansView.bottomAnchor, constant: -35),
            activitiesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            activitiesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            activitiesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        activitiesViewHeight = activitiesView.heightAnchor.constraint(equalToConstant: 115)
        activitiesViewHeight.isActive = true
    }
}


extension ProfileVC: PlansVCDelegate, ActivitiesVCDelegate {
    func updateConstraints(plansHeight: CGFloat) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.plansViewHeight.constant = plansHeight
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func updateConstraints(activitiesHeight: CGFloat) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3) {
                self.activitiesViewHeight.constant = activitiesHeight
                self.view.layoutIfNeeded()
            }
        }
    }
}
