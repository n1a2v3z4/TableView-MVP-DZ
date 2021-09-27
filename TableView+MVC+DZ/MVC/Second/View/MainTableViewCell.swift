//
//  MainTableViewCell.swift
//  TableView+MVC+DZ
//
//  Created by Cергей Иванович on 26.09.21.
//

import Foundation
import UIKit

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewCell: UIImageView!
    
    func update(with image: UIImage) {
        imageViewCell.image = image
        
    }
}
