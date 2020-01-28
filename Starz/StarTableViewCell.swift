//
//  StarTableViewCell.swift
//  Starz
//
//  Created by Stephanie Ballard on 1/27/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class StarTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    var star: Star? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        guard let star = star else { return }
        nameLabel.text = star.name
        distanceLabel.text = "\(star.distance) light years away"
        
    }
    
}
