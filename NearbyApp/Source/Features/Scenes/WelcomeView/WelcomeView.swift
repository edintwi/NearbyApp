//
//  WelcomeView.swift
//  NearbyApp
//
//  Created by Edson Brandon on 10/12/24.
//

import Foundation
import UIKit

class WelcomeView: UIView {
    private let logoImageView       = UIImageView(image: UIImage(named: "logo"))
    private let welcomeLabel        = UILabel()
    private let descriptionLabel    = UILabel()
    private let subTextTips         = UILabel()
    private let tipsStackView       = UIStackView()
    private let startButton         = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        configureLogoImageView()
        configureWelcomeLabel()
        configureSubTextTips()
        configureDescriptionLabel()
        configureStackView()
        configureStartButton()
        setupTips()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLogoImageView() {
        self.addSubview(logoImageView)
        logoImageView.contentMode                    = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureWelcomeLabel() {
        self.addSubview(welcomeLabel)
        welcomeLabel.text                     = "Boas vindas ao Nearby!"
        welcomeLabel.font                     = Typography.titleXL
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDescriptionLabel() {
        self.addSubview(descriptionLabel)
        descriptionLabel.text = "Tenha cupons de vantagem para usar em seus estabelecimentos favoritos."
        descriptionLabel.font = Typography.textMD
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureSubTextTips() {
        self.addSubview(subTextTips)
        subTextTips.text        = "Veja como funciona:"
        subTextTips.font        = Typography.textMD
        subTextTips.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureStackView() {
        self.addSubview(tipsStackView)
        tipsStackView.spacing           = 24
        tipsStackView.axis              = .vertical
        tipsStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupTips() {
        let tip1 = TipsView(icon: UIImage(named: "mapIcon") ?? UIImage(), title: "Encontre estabelecimentos", description: "Veja locais perto de você que são parceiros Nearby")
        let tip2 = TipsView(icon: UIImage(named: "qrcode") ?? UIImage(), title: "Ative o cupom com QR Code", description: "Escaneie o código no estabelecimento para usar o benefício")
        let tip3 = TipsView(icon: UIImage(named: "ticket") ?? UIImage(), title: "Garanta vantagens perto de você", description: "Ative cupons onde estiver, em diferentes tipos de estabelecimento ")
        
        tipsStackView.addArrangedSubview(tip1)
        tipsStackView.addArrangedSubview(tip2)
        tipsStackView.addArrangedSubview(tip3)
    }
    
    private func configureStartButton() {
        self.addSubview(startButton)
        startButton.setTitle("Começar", for: .normal)
        startButton.titleLabel?.font        = Typography.action
        startButton.layer.cornerRadius      = 8
        startButton.backgroundColor         = Colors.greenBase
        startButton.setTitleColor(Colors.gray100, for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 48),
            logoImageView.heightAnchor.constraint(equalToConstant: 48),
            
            welcomeLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 24),
            welcomeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            
            descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            subTextTips.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            subTextTips.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
        
            tipsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            tipsStackView.topAnchor.constraint(equalTo: subTextTips.bottomAnchor, constant: 24),
            tipsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            tipsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            startButton.heightAnchor.constraint(equalToConstant: 56)
            
        ])
    }
    
}
