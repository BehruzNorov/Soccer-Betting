struct Teams{
    let name: String
    let imageName: String
    let viewImage: String
    let w, d, l, gf, ga: Int
}

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    override func awakeFromNib() {
            super.awakeFromNib()
            
            contentView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contentView.widthAnchor.constraint(equalToConstant: 101),
                contentView.heightAnchor.constraint(equalToConstant: 139)
            ])
        }
    
}
