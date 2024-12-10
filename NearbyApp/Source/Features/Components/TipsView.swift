//
//  TipsView.swift
//  NearbyApp
//
//  Created by Edson Brandon on 10/12/24.
//

import Foundation
import UIKit

class TipsView: UIView {
   
    private let iconImageView       = UIImageView()
    private let titleLabel          = UILabel()
    private let bodyLabel           = UILabel()
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(icon: UIImage, title: String, description: String) {
        super.init(frame: .zero)
        configureIconImageView()
        configureTitleLabel()
        configureBodyLabel()
        configureConstraints()
        configureComponent(icon: icon, title: title, description: description)
    }
    
    
    func configureIconImageView() {
        self.addSubview(iconImageView)
        iconImageView.contentMode                   = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureTitleLabel() {
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureBodyLabel() {
        self.addSubview(bodyLabel)
        bodyLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureComponent(icon: UIImage, title: String, description: String) {
        self.iconImageView.image      = icon
        self.titleLabel.text          = title
        self.bodyLabel.text           = description
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24),
            
            titleLabel.leadingAnchor.constraint(equalTo: self.iconImageView.trailingAnchor, constant: 8),
            titleLabel.topAnchor.constraint(equalTo: self.iconImageView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            bodyLabel.leadingAnchor.constraint(equalTo: self.titleLabel.leadingAnchor),
            bodyLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 8),
            bodyLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bodyLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
        ])
    }
}
