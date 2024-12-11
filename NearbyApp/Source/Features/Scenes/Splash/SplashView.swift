//
//  SplashView.swift
//  NearbyApp
//
//  Created by Edson Brandon on 09/12/24.
//

import Foundation
import UIKit

class SplashView: UIView {
    let logoImageView           = UIImageView()
    let backgroundImageView     = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLogoImageView()
        configureBackgroundImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configureBackgroundImageView() {
        self.addSubview(backgroundImageView)
        backgroundImageView.image           = UIImage(named: Images.splashBG)
        backgroundImageView.contentMode     = .scaleAspectFit
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureLogoImageView() {
        self.addSubview(logoImageView)
        logoImageView.image                 = UIImage(named: Images.logo)
        logoImageView.contentMode           = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
