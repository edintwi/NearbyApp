//
//  SplashViewController.swift
//  NearbyApp
//
//  Created by Edson Brandon on 09/12/24.
//

import Foundation
import UIKit

class SplashViewController: UIViewController {
    let contentView: SplashView
    weak var delegate: SplashFlowDelegate?
    
    init(contentView: SplashView, delegate: SplashFlowDelegate) {
        self.contentView        = SplashView()
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decideFlow()
        configure()
        configureContentView()
    }
    
    private func configure() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor           = Colors.greenLight
    }
    
    private func decideFlow() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            self?.delegate?.decideNavigationFlow()
        }
    }
    
    func configureContentView() {
        self.view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}
