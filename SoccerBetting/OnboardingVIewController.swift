struct OnboardingItem{
    let mainImage,progressImage, titleText: String
    static func getonboardingData() -> [OnboardingItem] {
        [
            OnboardingItem(
                mainImage: "Ellipse1",
                progressImage: "Frame1",
                titleText: "The Legacy of \nItalian Serie A"
            ),
                OnboardingItem(
                mainImage: "Ellipse2",
                progressImage: "Frame2",
                titleText: "Legendary Rivalries in Serie A"
                ),
            OnboardingItem(
                mainImage: "Ellipse3",
                progressImage: "Frame3",
                titleText: "Series A teams"
            ),
            OnboardingItem(
                mainImage: "Ellipse4",
                progressImage: "Frame4",
                titleText: "Match Recording"
            ),
            OnboardingItem(
                mainImage: "Ellipse5",
                progressImage: "Frame5",
                titleText: "ProTeam track"
            )
           
        ]
    }
    
}
import UIKit

class OnboardingViewController: UIViewController {
    @IBOutlet weak var blueGrass: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var progressView: UIImageView!
    @IBOutlet weak var bigView: UIView!
    @IBOutlet weak var stadiumImages: UIImageView!
    
    private let onboardingData = OnboardingItem.getonboardingData()
    var currentIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlueBorder(to: bigView, img: blueGrass)
        refressuuuii(forIndex: currentIndex)
    }
    
    func refressuuuii(forIndex index: Int) {
        if index == 4 {
            previousButton.alpha = 0
            nextButton.alpha = 0
            startButton.alpha = 1
        } else if index == 0{
            previousButton.alpha = 0
            nextButton.alpha = 1
            startButton.alpha = 0
        }else {
            previousButton.alpha = 1
            nextButton.alpha = 1
            startButton.alpha = 0
        }
        let data = onboardingData[index]
        stadiumImages.image = UIImage(named: data.mainImage)
        titleLabel.text = data.titleText
        progressView.image = UIImage(named: data.progressImage)
    }
    func startTabbbb() {
        let tabBarVC = TabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        
        present(tabBarVC, animated: true)
    }
    @IBAction func previousButtonGetTapped(_ sender: UIButton) {
        if currentIndex >= 1 {
            currentIndex -= 1
            refressuuuii(forIndex: currentIndex)
        } else{
            previousButton.alpha = 0
        }
    }
    @IBAction func nextButtonGetTapped(_ sender: UIButton) {
        if currentIndex < onboardingData.count - 1 {
            currentIndex += 1
            refressuuuii(forIndex: currentIndex)
        } else{
            startTabbbb()
        }
    }
    @IBAction func startButtonGetTapped(_ sender: UIButton) {
        startTabbbb()
    }
    
    
    
}
