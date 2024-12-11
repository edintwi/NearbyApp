//
//  HomeViewController.swift
//  NearbyApp
//
//  Created by Edson Brandon on 10/12/24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    private var places: [Place] = []
    private let homeView = HomeView()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
    }
}
 
