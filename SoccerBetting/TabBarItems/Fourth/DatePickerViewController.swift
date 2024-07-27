import UIKit

class DatePickerViewController: UIViewController{
    @IBOutlet weak var cancelButtonOutlet: UIButton!
    @IBOutlet weak var selectButtonOutlet: UIButton!
    @IBOutlet weak var datePickerOutlet: UIDatePicker!
    @IBOutlet weak var totalView: UIView!
    var date: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        date = updateData(with: datePickerOutlet.date)
        totalView.layer.borderWidth = 0.5
        totalView.layer.borderColor = UIColor(red: 4/255, green: 117/255, blue: 255/255, alpha: 1).cgColor
        totalView.layer.cornerRadius = 2
    }
    
    
    
    func updateData(with date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter.string(from: date)
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        print("Selection is cancelled")
        performSegue(withIdentifier: "unwindToMatchAddingVC", sender: self)
    }
    @IBAction func datePicked(_ sender: UIDatePicker) {
            date = updateData(with: sender.date)
        }
    
    @IBAction func selectAction(_ sender: UIButton) {
        print("data is choosen")
        performSegue(withIdentifier: "unwindToMatchAddingVC", sender: self)
    }
    
}
