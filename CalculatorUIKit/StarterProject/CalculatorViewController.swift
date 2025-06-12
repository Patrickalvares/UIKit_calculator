import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet var roundButtons: [UIButton]!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var minuButton: UIButton!
    @IBOutlet weak var plusbutton: UIButton!
    
    @IBOutlet weak var equalButton: UIButton!
    
    lazy var operationButtons: [UIButton] = [divideButton, multiplyButton, minuButton, plusbutton]
    

    override func viewDidLoad() {
        super.viewDidLoad()
            setupButtons( )
    }
    
    
    func setupButtons(){
    
        for button in operationButtons {
           button.layer.cornerRadius =  button.frame.height / 2
        }
    
        for button in roundButtons{
            button.layer.cornerRadius = button.frame.height / 2
        }
    
    }

    @IBAction func didTapOperationButton(_ sender: UIButton) {
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
    }
    @IBAction func didTapDecimalButton(_ sender: UIButton) {
    }

    @IBAction func didTapEqualButton(_ sender: UIButton) {
    }
    @IBAction func didTapPercentButton() {
    }
    @IBAction func didTapPlusMinusBtton() {
    }
    @IBAction func didTapClearButton() {
    }
    
}
