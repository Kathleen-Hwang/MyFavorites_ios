//
//  FavoriteTableViewCell.swift
//  MyFavorites
//
//  Created by Mac on 2016. 9. 20..
//  Copyright © 2016년 Mac. All rights reserved.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var favoritSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func favoriteStateChanged(sender: UISwitch) {
        MyStore.updateFavorites(nameLabel.text!, on: sender.on)
    }
}
