//
//  SavedMatchesCell.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 21/07/24.
//

import UIKit
protocol SavedMatchesCellDelegate: AnyObject {
    func didPressDeleteButton(cell: SavedMatchesCell)
}
class SavedMatchesCell: UITableViewCell {
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var firstTeamName: UILabel!
    @IBOutlet weak var firstTeamGoals: UILabel!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var threeDotView: UIView!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var centerView: UIView!

    weak var delegate: SavedMatchesCellDelegate?
    
    
    
    @IBOutlet weak var secondTeanGoals: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backgroundView = UIView()
        backgroundView?.backgroundColor = UIColor.clear
        bigView.layer.cornerRadius = 2
        bigView.layer.borderWidth = 0.5
        bigView.layer.borderColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
        threeDotView.layer.cornerRadius = 2
        threeDotView.layer.borderWidth = 0.5
        threeDotView.layer.borderColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
        threeDotView.alpha = 0
        
        
        let bottomBorder = CALayer()
        bottomBorder.frame = CGRect(x: 0, y: centerView.frame.height - 1, width: centerView.frame.width, height: 1)
        bottomBorder.backgroundColor = UIColor(red: 19/255, green: 58/255, blue: 27/255, alpha: 1).cgColor
        centerView.layer.addSublayer(bottomBorder)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        let clearView = UIView()
        clearView.backgroundColor = .clear
        selectedBackgroundView = clearView
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backgroundView?.backgroundColor = UIColor.clear
        }
    @objc func didTapThreeDot() {
        delegate?.didPressDeleteButton(cell: self)
    }
    @IBAction func threeDotsPressed(_ sender: UIButton) {
        threeDotView.alpha = 1
        
    }
    @IBAction func editGetsPressed(_ sender: UIButton) {
        print("Edit is pressed")
    }
    @IBAction func deleteGetsPressed(_ sender: UIButton) {
        print("Delete is pressed")
        delegate?.didPressDeleteButton(cell: self)
    }
    
    
}
