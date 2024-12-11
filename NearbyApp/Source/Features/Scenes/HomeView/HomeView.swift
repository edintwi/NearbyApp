//
//  HomeView.swift
//  NearbyApp
//
//  Created by Edson Brandon on 10/12/24.
//

import Foundation
import UIKit
import MapKit

class HomeView: UIView {
    let mapView             = MKMapView()
    let filterScrollView    = UIScrollView()
    let containerView       = UIView()
    let dragIndicatorView   = UIView()
    let descriptionLabel    = UILabel()
    let filterStackView     = UIStackView()
    let placesTableView     = UITableView()
    
    private var containerTopConstraints: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMapView()
        configureContainerView()
        configureFilterScrollView()
        configureDragIndicatorView()
        configureDescriptionLabel()
        configureFilterStackView()
        configurePlacesTableView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureFilterScrollView() {
        self.addSubview(filterScrollView)
        filterScrollView.isUserInteractionEnabled                   = true
        filterScrollView.showsHorizontalScrollIndicator             = false
        filterScrollView.translatesAutoresizingMaskIntoConstraints  = false
    }
    
    private func configureMapView() {
        self.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureContainerView() {
        self.addSubview(containerView)
        containerView.layer.cornerRadius                        = 16
        containerView.backgroundColor                           = Colors.gray100
        containerView.clipsToBounds                             = true
        containerView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDragIndicatorView() {
        containerView.addSubview(dragIndicatorView)
        dragIndicatorView.layer.cornerRadius                        = 3
        dragIndicatorView.clipsToBounds                             = true
        dragIndicatorView.backgroundColor                           = Colors.gray300
        dragIndicatorView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureDescriptionLabel() {
        containerView.addSubview(descriptionLabel)
        descriptionLabel.font                                       = Typography.textMD
        descriptionLabel.textColor                                  = Colors.gray600
        descriptionLabel.text                                       = "Explore locais perto de você"
        descriptionLabel.translatesAutoresizingMaskIntoConstraints  = false
    }
    
    private func configureFilterStackView() {
        filterScrollView.addSubview(filterStackView)
        filterStackView.spacing                                     = 9
        filterStackView.isUserInteractionEnabled                    = true
        filterStackView.distribution                                = .fill
        filterStackView.axis                                        = .horizontal
        filterStackView.translatesAutoresizingMaskIntoConstraints   = false
    }
    
    private func configurePlacesTableView() {
        containerView.addSubview(placesTableView)
        placesTableView.register(PlaceTableViewCell.self, forCellReuseIdentifier: PlaceTableViewCell.identifier)
        placesTableView.translatesAutoresizingMaskIntoConstraints   = false
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            filterScrollView.topAnchor.constraint(equalTo: self.topAnchor, constant: 48),
            filterScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            filterScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            filterScrollView.heightAnchor.constraint(equalToConstant: 86),
            
            mapView.topAnchor.constraint(equalTo: self.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mapView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65),
            
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            filterStackView.topAnchor.constraint(equalTo: filterScrollView.topAnchor),
            filterStackView.leadingAnchor.constraint(equalTo: filterScrollView.leadingAnchor),
            filterStackView.trailingAnchor.constraint(equalTo: filterScrollView.trailingAnchor),
            filterStackView.bottomAnchor.constraint(equalTo: filterScrollView.bottomAnchor),
            filterStackView.heightAnchor.constraint(equalTo: filterScrollView.heightAnchor),
            filterStackView.widthAnchor.constraint(equalTo: filterScrollView.widthAnchor),
        ])
        
        containerTopConstraints = containerView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -16)
        containerTopConstraints.isActive = true
        
        NSLayoutConstraint.activate([
            dragIndicatorView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            dragIndicatorView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dragIndicatorView.widthAnchor.constraint(equalToConstant: 80),
            dragIndicatorView.heightAnchor.constraint(equalToConstant: 4),
            
            descriptionLabel.topAnchor.constraint(equalTo: dragIndicatorView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            placesTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant:  16),
            placesTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            placesTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            placesTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
        
    }
}
