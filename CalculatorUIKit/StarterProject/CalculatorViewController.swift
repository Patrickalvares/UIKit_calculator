import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet var roundButtons: [UIButton]!
    
    @IBOutlet weak var divideButton: OperatorButton!
    @IBOutlet weak var multiplyButton: OperatorButton!
    @IBOutlet weak var minuButton: OperatorButton!
    @IBOutlet weak var plusbutton: OperatorButton!
    
    @IBOutlet weak var equalButton: OperatorButton!
    
    @IBOutlet weak var displayLabel: UILabel!
    
    lazy var operationButtons: [OperatorButton] = [divideButton, multiplyButton, minuButton, plusbutton]
    
    enum Operation {
        case divide
        case multiply
        case sutract
        case add
        case none
    }
    
    var operation: Operation = .none
    

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

    @IBAction func didTapOperationButton(_ sender: OperatorButton) {
        let title = sender.currentTitle
        switch title {
        case "÷":
            operation = .divide
        case "X":
            operation = .multiply
        case "-":
            operation = .sutract
        case "+":
            operation = .add
        default : break
        }
        highlightButton(sender)
    }
    
    
    func deselectButton()
    {for button in operationButtons{
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
    }}
    func highlightButton(_ button: OperatorButton){
        deselectButton()
        button.backgroundColor = .white
        button.setTitleColor(.systemOrange, for: .normal)
        button.isSelection = true
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        let number = sender.tag
        
        if displayLabel.text == "0" {
            displayLabel.text = "\(number)"
        } else {
            displayLabel.text! += "\(number)"
        }
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
