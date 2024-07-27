//
//  TeamsCell.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 17/07/24.
//

import UIKit

class TeamsCell: UITableViewCell {
    @IBOutlet weak var stayedPlace: UILabel!
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var totalPoints: UILabel!
    @IBOutlet weak var totalGames: UILabel!
    @IBOutlet weak var wins: UILabel!
    @IBOutlet weak var draws: UILabel!
    @IBOutlet weak var losts: UILabel!
    
    @IBOutlet weak var differenceOfGoals: UILabel!
    @IBOutlet weak var goalsDivision: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: 488),
            contentView.heightAnchor.constraint(equalToConstant: 38)
        ])
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        let clearView = UIView()
        clearView.backgroundColor = .clear
        selectedBackgroundView = clearView
        
    }

}
