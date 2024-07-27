//
//  MatchAddingViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 18/07/24.
//

import UIKit
import IQKeyboardManagerSwift

class MatchAddingViewController: UIViewController {
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var matchDateLabel: UILabel!
    @IBOutlet weak var tourNumbersTextField: UITextField!
    @IBOutlet weak var selectFirstTeamTextField: UITextField!
    @IBOutlet weak var selectSecondTeamTextField: UITextField!
    @IBOutlet weak var staduimTextField: UITextField!
    @IBOutlet weak var firstWinPercentTextField: UITextField!
    @IBOutlet weak var secondWinTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var firstTeamImage: UIImageView!
    @IBOutlet weak var secondTeamImage: UIImageView!
    @IBOutlet weak var datePickerButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var firstImg: UIImageView!
    
    
    
    
    
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var winButton: UIButton!
    @IBOutlet weak var lossButton: UIButton!
    @IBOutlet weak var coeffitcientTextField: UITextField!
    @IBOutlet weak var sumTextField: UITextField!
    
    let color = UIColor.darkGray
    let borderColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
    var clubs: [Teams] = Data().teams
    var winImageGet: Bool = false
    var lossImageGet: Bool = false
    var filteredClubs1: [Teams] = []
    var filteredClubs2: [Teams] = []
    var firstTeamName: String = ""
    var secondTeamName: String = ""
    var date: String? {
        didSet{
            updateDateLabel()
        }
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView1.layer.borderWidth = 0.4
//        tableView2.layer.borderWidth = 0.4
//        tableView1.layer.borderColor = borderColor
//        tableView2.layer.borderColor = borderColor
        addBlueBorder(to: firstView, img: firstImg)
        addBlueBorder(to: secondView, img: secondImg)
        backButton.image = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
        addBottomBorder(to: tourNumbersTextField, color: color, thickness: 0.5)
        addBottomBorder(to: selectFirstTeamTextField, color: color, thickness: 0.5)
        addBottomBorder(to: selectSecondTeamTextField, color: color, thickness: 0.5)
        addBottomBorder(to: staduimTextField, color: color, thickness: 0.5)
        addBottomBorder(to: tourNumbersTextField, color: color, thickness: 0.5)
        addBottomBorder(to: firstWinPercentTextField, color: color, thickness: 0.5)
        addBottomBorder(to: secondWinTextField, color: color, thickness: 0.5)
        addBottomBorder(to: noteTextField, color: color, thickness: 0.5)
        addBottomBorder(to: coeffitcientTextField, color: color, thickness: 0.5)
        addBottomBorder(to: sumTextField, color: color, thickness: 0.5)
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView2.dataSource = self
        tableView2.delegate = self
        tourNumbersTextField.delegate = self
        selectFirstTeamTextField.delegate = self
        selectSecondTeamTextField.delegate = self
        staduimTextField.delegate = self
        firstWinPercentTextField.delegate = self
        secondWinTextField.delegate = self
        noteTextField.delegate = self
        coeffitcientTextField.delegate = self
        sumTextField.delegate = self
        tableView1.isHidden = true
        tableView2.isHidden = true
        tableView1.backgroundColor = UIColor.clear
        tableView2.backgroundColor = UIColor.clear
        tableView1.register(UINib(nibName: "ClubsCell", bundle: nil), forCellReuseIdentifier: "clubsCellIdentifier")
        tableView2.register(UINib(nibName: "ClubsCell", bundle: nil), forCellReuseIdentifier: "clubsCellIdentifier")
        updateDateLabel()
        
       
            
        }
    

    private func buttonChange(){
        let firstC = Float(firstWinPercentTextField.text ?? "") ?? 0.0
        let secondC = Float(secondWinTextField.text ?? "") ?? 0.0
        let coeff = Float(coeffitcientTextField.text ?? "") ?? 0.0

        if firstTeamImage.isHidden != true && secondTeamImage.isHidden != true && staduimTextField.text?.isEmpty != true && noteTextField.text?.isEmpty != true && tourNumbersTextField.text?.isEmpty != true && sumTextField.text?.isEmpty != true && firstWinPercentTextField.text?.isEmpty != true && secondWinTextField.text?.isEmpty != true && coeffitcientTextField.text?.isEmpty != true, firstC != 0.0, secondC != 0.0, coeff != 0.0{
                
            
                continueButton.isUserInteractionEnabled = true
                continueButton.backgroundColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1)
                continueButton.tintColor = UIColor.white
           
            
        }else{
            continueButton.isUserInteractionEnabled = false
            continueButton.backgroundColor = UIColor(red: 226/255, green: 226/255, blue: 226/255, alpha: 1)
            continueButton.tintColor = UIColor.darkGray
        }
        
    }
    private func addBottomBorder(to view: UITextField, color: UIColor, thickness: CGFloat) {
        view.backgroundColor = UIColor.clear
        view.attributedPlaceholder = NSAttributedString(string: view.placeholder!, attributes: [
            .foregroundColor: UIColor.darkGray
        ])
        let bottomBorder = UIView()
        bottomBorder.backgroundColor = color
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomBorder)
        
        NSLayoutConstraint.activate([
            bottomBorder.heightAnchor.constraint(equalToConstant: thickness),
            bottomBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBorder.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func updateDateLabel() {
           if let date = date {
               matchDateLabel.text = date
           } else {
               matchDateLabel.text = "Match Date"
           }
       }
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func unwindToMatchAddingVC(_ segue: UIStoryboardSegue) {
            if let sourceVC = segue.source as? DatePickerViewController {
                date = sourceVC.date
            }
        }
        
    @IBAction func dateButtonAction(_ sender: UIButton) {
        performSegue(withIdentifier: "showDatePicker", sender: self)
        matchDateLabel.textColor = .white
    }
    
    @IBAction func winButtonPressed(_ sender: UIButton) {
        if winButton.imageView!.image == UIImage(named: "emptycircle"){
            if lossButton.imageView!.image == UIImage(named: "fillcircle"){
                lossButton.setImage(UIImage(named: "emptycircle"), for: .normal)
                lossImageGet = false
            }
            winImageGet = true
            winButton.setImage(UIImage(named: "fillcircle"), for: .normal)
        }else{
            winButton.setImage(UIImage(named: "emptycircle"), for: .normal)
            winImageGet = false
        }
        buttonChange()
    }
    @IBAction func lossButtonPressed(_ sender: UIButton) {
        if lossButton.imageView!.image == UIImage(named: "emptycircle"){
            if winButton.imageView?.image == UIImage(named: "fillcircle"){
                winButton.setImage(UIImage(named: "emptycircle"), for: .normal)
                winImageGet = false
            }
            lossImageGet = true
            lossButton.setImage(UIImage(named: "fillcircle"), for: .normal)
        }else{
            lossButton.setImage(UIImage(named: "emptycircle"), for: .normal)
            lossImageGet = false
        }
        buttonChange()
    }
    @IBAction func roundTextFieldAction(_ sender: UITextField) {
        buttonChange()
    }
    @IBAction func sumTextFieldAction(_ sender: UITextField) {
        buttonChange()
    }
    @IBAction func continueAction(_ sender: UIButton) {
        let matchDate = matchDateLabel.text ?? ""
        let roundInt = tourNumbersTextField.text ?? ""
        let firstTeam = firstTeamName
        let firstTeamImage = "Property 1=\(firstTeamName.lowercased())"
        let secondTeam = secondTeamName
        let secondTeamImage = "Property 1=\(secondTeamName.lowercased())"
        let location = staduimTextField.text ?? ""
        let firstCoeff = Float(firstWinPercentTextField.text ?? "") ?? 0.0
        let secondCoeff = Float(secondWinTextField.text ?? "") ?? 0.0
        let impression = noteTextField.text ?? ""
        let winOrLoss = winImageGet ? "w" : lossImageGet ? "l" : "d"
        let coeff = Float(coeffitcientTextField.text ?? "") ?? 0.0
        let summ = Float(sumTextField.text ?? "") ?? 0.0
        let detailsFirstHalf = DetailsFirstHalf(
                matchDate: matchDate,
                round: roundInt,
                firstTameName: firstTeam,
                firstTeamImage: firstTeamImage,
                secondTeamName: secondTeam,
                secondTeamImageName: secondTeamImage,
                location: location,
                firstCoeffitcient: firstCoeff,
                secondCoeffitcient: secondCoeff,
                note: impression,
                winOrLoss: winOrLoss,
                coeffff: coeff,
                sum: summ
            )
            
        
        performSegue(withIdentifier: "goToDetails", sender: detailsFirstHalf)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToDetails" {
                if let detailsVC = segue.destination as? DetailsViewController, let data = sender as? DetailsFirstHalf {
                    detailsVC.data = data
                }
            }
        }
    
    @IBAction func coeffitcientAction(_ sender: UITextField) {
        buttonChange()
    }
    @IBAction func secondWinAction(_ sender: UITextField) {
        buttonChange()
    }
    @IBAction func firstWinAction(_ sender: UITextField) {
        buttonChange()
    }
    @IBAction func locationAction(_ sender: UITextField) {
        buttonChange()
    }
    @IBAction func roundAction(_ sender: UITextField) {
        buttonChange()
    }
    
    
    
    
    
    
    
}

extension MatchAddingViewController: UITextFieldDelegate, UITableViewDataSource, UITableViewDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let searchText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        if textField == selectFirstTeamTextField {
            filterTeams1(searchText: searchText)
        } else if textField == selectSecondTeamTextField {
            filterTeams2(searchText: searchText)
        }
        return true
    }
    
    func filterTeams1(searchText: String) {
        if searchText.isEmpty {
            filteredClubs1 = []
            tableView1.isHidden = true
        } else {
            filteredClubs1 = clubs.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            tableView1.isHidden = filteredClubs1.isEmpty
        }
        tableView1.reloadData()
    }
    
    func filterTeams2(searchText: String) {
        if searchText.isEmpty {
            filteredClubs2 = []
            tableView2.isHidden = true
        } else {
            filteredClubs2 = clubs.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            tableView2.isHidden = filteredClubs2.isEmpty
        }
        tableView2.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
            return filteredClubs1.count
        } else {
            return filteredClubs2.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "clubsCellIdentifier", for: indexPath) as! ClubsCell
            cell.teamImage.image = UIImage(named: filteredClubs1[indexPath.row].imageName)
            cell.teamName.text = filteredClubs1[indexPath.row].name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "clubsCellIdentifier", for: indexPath) as! ClubsCell
            cell.teamImage.image = UIImage(named: filteredClubs2[indexPath.row].imageName)
            cell.teamName.text = filteredClubs2[indexPath.row].name
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableView1 {
            selectFirstTeamTextField.text = "      \(filteredClubs1[indexPath.row].name)"
            firstTeamName = filteredClubs1[indexPath.row].name
            firstTeamImage.image = UIImage(named: filteredClubs1[indexPath.row].imageName)
            firstTeamImage.isHidden = false
            tableView1.isHidden = true
            selectFirstTeamTextField.resignFirstResponder()
        } else if tableView == tableView2 {
            selectSecondTeamTextField.text = "      \(filteredClubs2[indexPath.row].name)"
            secondTeamName = filteredClubs2[indexPath.row].name
            secondTeamImage.image = UIImage(named: filteredClubs2[indexPath.row].imageName)
            secondTeamImage.isHidden = false
            tableView2.isHidden = true
            selectSecondTeamTextField.resignFirstResponder()
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        buttonChange()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == selectFirstTeamTextField {
            firstTeamImage.isHidden = true
            
        } else if textField == selectSecondTeamTextField {
            secondTeamImage.isHidden = true
        }
    }
}
