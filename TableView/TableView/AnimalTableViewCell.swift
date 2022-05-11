//
//  AnimalTableViewCell.swift
//  TableView
//
//  Created by André Levi Oliveira Silva on 06/05/22.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {

    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var animal: Animal! {
        didSet {
            self.imageLabel.text = self.animal.image
            self.nameLabel.text = self.animal.name
        }
    }
}
