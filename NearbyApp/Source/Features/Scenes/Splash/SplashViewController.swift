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
    let logoImageView           = UIImageView()
    let backgroundImageView     = UIImageView()
    
    init(contentView: SplashView) {
        self.contentView        = SplashView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureContentView()
        configureLogoImageView()
        configureBackgroundImageView()
    }
    
    private func configure() {
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor           = Colors.greenLight
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
    
    func configureBackgroundImageView() {
        self.view.addSubview(backgroundImageView)
        backgroundImageView.image           = UIImage(named: Images.splashBG)
        backgroundImageView.contentMode     = .scaleAspectFit
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func configureLogoImageView() {
        self.view.addSubview(logoImageView)
        logoImageView.image                 = UIImage(named: Images.logo)
        logoImageView.contentMode           = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}
