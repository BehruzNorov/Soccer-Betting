//
//  ClubsCell.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 18/07/24.
//

import UIKit

class ClubsCell: UITableViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
