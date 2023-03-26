//
//  RepoCell.swift
//  CombineCall
//
//  Created by Bharat Lal on 25/03/23.
//

import Foundation
import UIKit

class RepoCell: UITableViewCell {
    @IBOutlet weak private var nameLabel: UILabel!
    @IBOutlet weak private var detailsLabel: UILabel!
    @IBOutlet weak private var accessorLabel: UILabel!
    
    func configure(with repo: Repository) {
        nameLabel.text = repo.name
        detailsLabel.text = repo.description
        accessorLabel.text = repo.isPrivate ? "Private" : "Public"
    }
}
