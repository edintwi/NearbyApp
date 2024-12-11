//
//  PlaceTableViewCell.swift
//  NearbyApp
//
//  Created by Edson Brandon on 11/12/24.
//

import Foundation
import UIKit

class PlaceTableViewCell: UITableViewCell {
    
    static var identifier = "PlaceTableCell"
    
    let itemImage               = UIImageView()
    let itemTitleLabel          = UILabel()
    let itemDescription         = UILabel()
    let iconImageView           = UIImageView(image: UIImage(named: "ticket"))
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
        itemImage.contentMode                               = .scaleAspectFit
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
        itemDescription.font                                      = Typography.textSM
        itemDescription.textAlignment                             = .left
        itemDescription.numberOfLines                             = 0
        itemDescription.textColor                                 = Colors.gray300
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureIconImageView() {
        containerView.addSubview(iconImageView)
        iconImageView.contentMode                               = .scaleAspectFit
        iconImageView.tintColor                                 = Colors.redBase
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
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
    
    private func configure(with place: Place) {
        itemImage.image         = UIImage(named: place.imageName)
        itemTitleLabel.text     = place.title
        itemDescription.text    = place.description
        ticketCountLabel.text   = "Cupons disponívies: \(place.tickets)"
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            itemImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            itemImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            itemImage.widthAnchor.constraint(equalToConstant: 116),
            itemImage.heightAnchor.constraint(equalToConstant: 104),
            
            itemTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            itemTitleLabel.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8),
            itemTitleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            itemDescription.topAnchor.constraint(equalTo: itemTitleLabel.bottomAnchor, constant: 4),
            itemDescription.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8),
            itemDescription.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            
            iconImageView.leadingAnchor.constraint(equalTo: itemImage.trailingAnchor, constant: 8),
            iconImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            iconImageView.widthAnchor.constraint(equalToConstant: 13),
            iconImageView.heightAnchor.constraint(equalToConstant: 11),
            
            ticketCountLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 4),
            ticketCountLabel.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            
        ])
    }
}
