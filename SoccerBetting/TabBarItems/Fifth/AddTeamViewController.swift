//
//  AddTeamViewController.swift
//  SoccerBetting
//
//  Created by Behruz Norov on 23/07/24.
//

import UIKit
import RealmSwift

class AddTeamViewController: UIViewController {
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var teamNameTxtF: UITextField!
    @IBOutlet weak var teamNameView: UIView!
    @IBOutlet weak var blueBtn: UIButton!
    @IBOutlet weak var redBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var whiteBtn: UIButton!
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var darkBlueBtn: UIButton!
    @IBOutlet weak var pinkBtn: UIButton!
    @IBOutlet weak var leagueNameTxtF: UITextField!
    @IBOutlet weak var genderTxtF: UITextField!
    @IBOutlet weak var genderChooseBtn: UIButton!
    @IBOutlet weak var centerLineView: UIView!
    @IBOutlet weak var saveTeamBtn: UIButton!
    
    
    
    @IBOutlet weak var firstNameTxtF: UITextField!
    @IBOutlet weak var firstRoleTxtF: UITextField!
    @IBOutlet weak var firstBtn: UIButton!
    
    @IBOutlet weak var secondNameTxtF: UITextField!
    @IBOutlet weak var secondRoleTxtF: UITextField!
    @IBOutlet weak var secondBtn: UIButton!
    
    @IBOutlet weak var thirdNameTxtF: UITextField!
    @IBOutlet weak var thirdRoleTxtF: UITextField!
    @IBOutlet weak var thirdBtn: UIButton!
    
    @IBOutlet weak var fourthNameTxtF: UITextField!
    @IBOutlet weak var fourthRoleTxtF: UITextField!
    @IBOutlet weak var fourthBtn: UIButton!
    
    @IBOutlet weak var fifthBameTxtF: UITextField!
    @IBOutlet weak var fifthRoleTxtF: UITextField!
    @IBOutlet weak var fifthBtn: UIButton!
    @IBOutlet weak var bigView: UIView!
    
    @IBOutlet weak var bigImg: UIImageView!
    
    
    @IBOutlet weak var genderView: UIView!
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var dismissBtn: UIButton!
    
    
    @IBOutlet weak var roleView: UIView!
    
    var isAddTeamAllowed = false
    var teamGender: String = "Male"
    var firstRole: String = "Goalkeeper"
    var secondRole: String = "Goalkeeper"
    var thirdRole: String = "Goalkeeper"
    var fourthRole: String = "Goalkeeper"
    var fifthRole: String = "Goalkeeper"
    let teamRealm = try! Realm()
    var teams: Results<Team>?
    let team = Team()
    var color = "back"
    
    var textField =  UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: bigImg)
        roleView.isHidden = true
        genderView.isHidden = true
        teams = teamRealm.objects(Team.self)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideViews))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        backButton.image = UIImage(named: "back")!.withRenderingMode(.alwaysOriginal)
        addBottomBorder(to: teamNameTxtF)
        addBottomBorder(to: leagueNameTxtF)
        addBottomBorder(to: genderTxtF)
        addTopBorder(to: centerLineView)
        addBottomBorder(to: firstNameTxtF)
        addBottomBorder(to: firstRoleTxtF)
        addBottomBorder(to: secondNameTxtF)
        addBottomBorder(to: secondRoleTxtF)
        addBottomBorder(to: thirdNameTxtF)
        addBottomBorder(to: thirdRoleTxtF)
        addBottomBorder(to: fourthNameTxtF)
        addBottomBorder(to: fourthRoleTxtF)
        addBottomBorder(to: fifthBameTxtF)
        addBottomBorder(to: fifthRoleTxtF)
    }
    @objc func hideViews(){
        roleView.isHidden = true
        genderView.isHidden = true
    }
    private func addBottomBorder(to view: UITextField) {
        view.backgroundColor = UIColor.clear
        view.attributedPlaceholder = NSAttributedString(string: view.placeholder!, attributes: [
            .foregroundColor: UIColor.darkGray
        ])
        let color = UIColor.darkGray
        let thickness = 0.5
        let bottomBorder = UITextField()
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
    private func addTopBorder(to view: UIView) {

        let colorr = UIColor.systemBlue
        let thickness = 0.5
        let bottomBorder = UIView()
        bottomBorder.backgroundColor = colorr
        bottomBorder.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomBorder)
        
        NSLayoutConstraint.activate([
            bottomBorder.heightAnchor.constraint(equalToConstant: thickness),
            bottomBorder.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomBorder.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomBorder.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func roleViewAppear(to textField: UITextField, Btn button: UIButton){
        textField.text = button.titleLabel?.text
        roleView.isHidden = true
    }
    private func checkSaveBtn(){
        if teamNameTxtF.text != "", color != "back", leagueNameTxtF.text != "", genderTxtF.text != "", firstNameTxtF.text != "", firstRoleTxtF.text != ""{
            saveTeamBtn.isUserInteractionEnabled = true
            saveTeamBtn.backgroundColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1)
            saveTeamBtn.tintColor = UIColor.white
        }
    }
    
    @IBAction func checkSaveButton(_ sender: UITextField) {
        checkSaveBtn()
    }
    
    @IBAction func backButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func unwindToMatchAddingVC(_ segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? SaveTeamViewController {
            isAddTeamAllowed = sourceVC.isAddingAllowed
        }
        
        if isAddTeamAllowed{
            team.teamName = teamNameTxtF.text ?? ""
            team.teamColor = color
            team.leagueName = leagueNameTxtF.text ?? ""
            team.gender = genderTxtF.text ?? "Male"
            team.firstName = firstNameTxtF.text ?? ""
            team.firstRole = firstRoleTxtF.text ?? ""
            team.secondName = secondNameTxtF.text ?? ""
            team.secondRole = secondRoleTxtF.text ?? ""
            team.thirdName = thirdNameTxtF.text ?? ""
            team.thirdRole = thirdRoleTxtF.text ?? ""
            team.fourthName = fourthNameTxtF.text ?? ""
            team.fourthRole = fourthRoleTxtF.text ?? ""
            team.fifthName = fifthBameTxtF.text ?? ""
            team.fifthRole = fifthRoleTxtF.text ?? ""
            do{
                try teamRealm.write {
                    teamRealm.add(team)
                    print("Success")
                }
            }catch{
                print("here is the error, \(error)")
            }
        }
    }
    @IBAction func saveMatchBtnPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSaveAndExit", sender: self)
    }
    @IBAction func colorChooseBtnPressed(_ sender: UIButton) {
        let buttons: [UIButton] = [blueBtn, redBtn, greenBtn, whiteBtn, yellowBtn, darkBlueBtn, pinkBtn]
            
            for button in buttons {
                if button == sender {
                    button.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
                    color = "kok"
                    checkSaveBtn()
                } else {
                    button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
                }
            }
    }
    
    @IBAction func colorRedButtonPressed(_ sender: UIButton) {
        let buttons: [UIButton] = [blueBtn, redBtn, greenBtn, whiteBtn, yellowBtn, darkBlueBtn, pinkBtn]
        for button in buttons {
            if button == sender {
                button.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
                color = "red"
                checkSaveBtn()
            } else {
                button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            }
        }
    }
    @IBAction func colorGreenButtonPressed(_ sender: UIButton) {
        let buttons: [UIButton] = [blueBtn, redBtn, greenBtn, whiteBtn, yellowBtn, darkBlueBtn, pinkBtn]
        for button in buttons {
            if button == sender {
                button.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
                color = "green"
                checkSaveBtn()
            } else {
                button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            }
        }
    }
    @IBAction func colorWhitePrs(_ sender: UIButton) {
        let buttons: [UIButton] = [blueBtn, redBtn, greenBtn, whiteBtn, yellowBtn, darkBlueBtn, pinkBtn]
        for button in buttons {
            if button == sender {
                button.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
                color = "white"
                checkSaveBtn()
            } else {
                button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            }
        }
    }
    @IBAction func colorYellowPrs(_ sender: UIButton) {
        let buttons: [UIButton] = [blueBtn, redBtn, greenBtn, whiteBtn, yellowBtn, darkBlueBtn, pinkBtn]
        for button in buttons {
            if button == sender {
                button.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
                color = "yellow"
                checkSaveBtn()
            } else {
                button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            }
        }
    }
    @IBAction func colorPinkPrs(_ sender: UIButton) {
        let buttons: [UIButton] = [blueBtn, redBtn, greenBtn, whiteBtn, yellowBtn, darkBlueBtn, pinkBtn]
        for button in buttons {
            if button == sender {
                button.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
                color = "pink"
                checkSaveBtn()
            } else {
                button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            }
        }
    }
    @IBAction func darkBlue(_ sender: UIButton) {
        let buttons: [UIButton] = [blueBtn, redBtn, greenBtn, whiteBtn, yellowBtn, darkBlueBtn, pinkBtn]
        for button in buttons {
            if button == sender {
                button.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
                color = "darkBlue"
                checkSaveBtn()
            } else {
                button.setImage(UIImage(systemName: "circle.fill"), for: .normal)
            }
        }
    }
    
    @IBAction func teamGenderBtn(_ sender: UIButton) {
        genderView.isHidden = false
    }
    
    
    
    @IBAction func choosePosition1BtnPressed(_ sender: UIButton) {
        roleView.isHidden = false
        textField = firstRoleTxtF
    }
    @IBAction func choosePosition2BtnPressed(_ sender: UIButton) {
        roleView.isHidden = false
        textField = secondRoleTxtF

    }
    @IBAction func choosePosition3BtnPressed(_ sender: UIButton) {
        roleView.isHidden = false
        textField = thirdRoleTxtF

    }
    @IBAction func choosePosition4Btn(_ sender: UIButton) {
        roleView.isHidden = false
        textField = fourthRoleTxtF
    }
    @IBAction func choosePosition5BtnPressed(_ sender: UIButton) {
        roleView.isHidden = false
        textField = fifthRoleTxtF
    }
    
    
    
    @IBAction func defenderPressed(_ sender: UIButton) {
        roleViewAppear(to: textField, Btn: sender)
        checkSaveBtn()
    }

    @IBAction func roleViewDisappearBtnPressed(_ sender: UIButton) {
        roleView.isHidden = true
        
    }
    
    
    
    
    
    @IBAction func maleGenderBtn(_ sender: UIButton) {
        genderTxtF.text = sender.titleLabel?.text
        teamGender = sender.titleLabel?.text ?? "Male"
        genderView.isHidden = true
        checkSaveBtn()
    }
    @IBAction func genderViewDisappearBtn(_ sender: UIButton) {
        genderView.isHidden = true
    }
    
    
    
    
    

    

}
