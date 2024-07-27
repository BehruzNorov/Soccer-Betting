import UIKit

internal func addBlueBorder(to view: UIView, img image: UIImageView){
    view.layer.borderWidth = 0.4
    view.layer.borderColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
    view.layer.cornerRadius = 5
    image.layer.cornerRadius = 5
}
