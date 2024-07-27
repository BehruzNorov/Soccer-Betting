//
//  AddedTeamsCell.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 24/07/24.
//

import UIKit

protocol SavedTeamsCellDelegate: AnyObject {
    func didPressDeleteButton(cell: AddedTeamsCell)
}

class AddedTeamsCell: UITableViewCell {
    @IBOutlet weak var colorImageView: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var playersNumber: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var leftLineView: UIView!
    @IBOutlet weak var mainView: UIView!
    var info = Team()
    
    weak var delegate: SavedTeamsCellDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.cornerRadius = 5
        mainView.layer.borderWidth = 0.5
        mainView.layer.borderColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
        let leftBorder = CALayer()
        leftBorder.frame = CGRect(x: 0, y: 0, width: 1, height: leftLineView.frame.height)
        leftBorder.backgroundColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
        leftLineView.layer.addSublayer(leftBorder)
        contentView.backgroundColor = UIColor.clear
        backgroundColor = UIColor.clear
        backgroundView = UIView()
        backgroundView?.backgroundColor = UIColor.clear
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
    @IBAction func threeDotsGetsPressed(_ sender: UIButton) {
        print("Success")
        delegate?.didPressDeleteButton(cell: self)
    }
    
}
