//
//  NearbyFlowController.swift
//  NearbyApp
//
//  Created by Edson Brandon on 09/12/24.
//

import Foundation
import UIKit

class NearbyFlowController {
    private var navigationController: UINavigationController?
    
    public init() {
        
    }
    
    func start() -> UINavigationController? {
        let contentView             = SplashView()
//        let startViewController     = SplashViewController(contentView: contentView, delegate: self)
        let startViewController     = HomeViewController()
        self.navigationController   = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}

extension NearbyFlowController: SplashFlowDelegate {
    func decideNavigationFlow() {
        
        let contentView = WelcomeView()
        let welcomeVC = WelcomeViewController(contentView: contentView)
        navigationController?.pushViewController(welcomeVC, animated: true)
    }
    
    
}
