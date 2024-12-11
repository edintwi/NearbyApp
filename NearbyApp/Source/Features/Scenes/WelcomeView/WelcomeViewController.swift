//
//  WelcomeViewController.swift
//  NearbyApp
//
//  Created by Edson Brandon on 10/12/24.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    
    let contentView: WelcomeView
    
    init(contentView: WelcomeView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContentView()
    }
    
    
    private func configureContentView() {
        self.view.addSubview(contentView)
        self.setupContentViewToViewController(contentView: contentView )
    }
}
