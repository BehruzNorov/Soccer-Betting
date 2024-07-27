//
//  ThirdTabViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 13/07/24.
//

import UIKit

class ThirdTabViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
   let color = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1)
    
    
    
    
    
    let teams = Data().teams
    
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bigImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: bigImg)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "collectionCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "teamsCellIdentifier")
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
           layout.itemSize = CGSize(width: 101, height: 139)
           layout.minimumLineSpacing = 8
           layout.minimumInteritemSpacing = 8
       }

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celll = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCellIdentifier", for: indexPath) as! TeamsCollectionViewCell
        let team = teams[indexPath.row]
        celll.teamName.text = team.name
        celll.teamImage.image = UIImage(named: team.imageName)
        celll.layer.borderWidth = 1.0
        celll.layer.borderColor = color.cgColor
        return celll
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = teams[indexPath.row]
        let teamVC = storyboard?.instantiateViewController(withIdentifier: "teamVC") as! TeamDescriptionViewController
        teamVC.data = data
        self.navigationController?.pushViewController(teamVC, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == teams.count - 1 {

            return CGSize(width: 327, height: 139)
        } else {
            return CGSize(width: 101, height: 139)
        }
    }
    
    


}
