

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    var storyBrain = StoryBrain()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    
    @IBAction func choiceMade(_ sender: UIButton) {
        
        timer.invalidate()
        let userChoice = sender.currentTitle!
        storyBrain.nextStory(userChoice)
                        
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    }
    
    @objc func updateUI() {
        storyLabel.text = storyBrain.getStoryLabel()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
       }
    
}

