//
//  PlaceTableViewCell.swift
//  NearbyApp
//
//  Created by Edson Brandon on 11/12/24.
//

import Foundation
import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    static var identifier = "PlaceTableViewCell"
    
    let itemImage               = UIImageView()
    let itemTitleLabel          = UILabel()
    let itemDescription         = UILabel()
    let ticketIcon           = UIImageView(image: UIImage(named: "ticket"))
    let ticketCountLabel        = UILabel()
    let containerView           = UIView()
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureItemImage() {
        containerView.addSubview(itemImage)
        itemImage.layer.cornerRadius                        = 8
        itemImage.clipsToBounds                             = true
        itemImage.contentMode                               = .scaleAspectFill
        itemImage.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureItemTitleLabel() {
        containerView.addSubview(itemTitleLabel)
        itemTitleLabel.font                                      = Typography.titleSM
        itemTitleLabel.textAlignment                             = .left
        itemTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureItemDescription() {
        containerView.addSubview(itemDescription)
        itemDescription.font                                      = Typography.textXS
        itemDescription.textAlignment                             = .left
        itemDescription.numberOfLines                             = 2
        itemDescription.textColor                                 = Colors.gray500
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureIconImageView() {
        containerView.addSubview(ticketIcon)
        ticketIcon.contentMode                               = .scaleAspectFit
        ticketIcon.tintColor                                 = Colors.redBase
        ticketIcon.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureTicketCountLabel() {
        containerView.addSubview(ticketCountLabel)
        ticketCountLabel.textColor                              = Colors.gray400
        ticketCountLabel.font                                   = Typography.textXS
        ticketCountLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureContainerView() {
        self.addSubview(containerView)
        containerView.layer.cornerRadius                        = 8
        containerView.layer.borderWidth                         = 1
        containerView.layer.borderColor                         = Colors.gray200.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureUI() {
        configureContainerView()
        configureItemImage()
        configureItemTitleLabel()
        configureItemDescription()
        configureIconImageView()
        configureTicketCountLabel()
        configureConstraints()
    }
    
    func configure(with place: Place) {
        if let url = URL(string: place.cover) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.itemImage.image = image
                    }
                }
            }.resume()
        }
        
        itemTitleLabel.text     = place.name
        itemDescription.text    = place.description
        ticketCountLabel.text   = "Cupons disponívies: \(place.coupons)"
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            itemImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            itemImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            itemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            itemImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            itemImage.widthAnchor.constraint(equalToConstant: 116),
            itemImage.heightAnchor.constraint(equalToConstant: 104),
            
            itemTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            itemTitleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 16),
            itemTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            itemDescription.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor, constant: 4),
            itemDescription.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 16),
            itemDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            ticketIcon.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 16),
            ticketIcon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            ticketIcon.widthAnchor.constraint(equalToConstant: 13),
            ticketIcon.heightAnchor.constraint(equalToConstant: 11),
            
            ticketCountLabel.topAnchor.constraint(equalTo: itemDescription.bottomAnchor, constant: 8),
            ticketCountLabel.leadingAnchor.constraint(equalTo: ticketIcon.trailingAnchor, constant: 4),
            ticketCountLabel.centerYAnchor.constraint(equalTo: ticketIcon.centerYAnchor),
            
        ])
    }
}
