import UIKit

class CalculatorViewController: UIViewController {
    
    var displayNumber: Double {
        let text = displayLabel.text!
        let number = Double(text)!
        return number
    }
    
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
        case subtract
        case add
        case none
    }
    
    var operation: Operation = .none

    
    var operationIsSelected: Bool {
        
        for button in operationButtons {
            if button.isSelection {
                return true
            }
        }
        return false
    }
    
    var previusNumber: Double? = 0
    var equalButtonTapped: Bool = false
    var shouldStartNewNumber: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
            setupButtons( )
    }
    
    
    func setupButtons(){
    
        operationButtons.forEach  {button in
            
           button.layer.cornerRadius =  button.frame.height / 2
           button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }
    
        roundButtons.forEach { button in
            button.layer.cornerRadius = button.frame.height / 2
            button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }
        equalButton.layer.cornerRadius = equalButton.frame.height / 2
        equalButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }

    @IBAction func didTapOperationButton(_ sender: OperatorButton) {
        
        if let _ = previusNumber, !equalButtonTapped, !operationIsSelected{
            performOperation()
            self.previusNumber = nil
        }
        let title = sender.currentTitle
        switch title {
        case "÷":
            operation = .divide
        case "X":
            operation = .multiply
        case "-":
            operation = .subtract
        case "+":
            operation = .add
        default : break
        }
        highlightButton(sender)
        equalButtonTapped = false
        previusNumber = displayNumber
        shouldStartNewNumber = true
    }
    
    
    func deselectButton()
    {
        operationButtons.forEach{ button in
            button.backgroundColor = .systemOrange
            button.setTitleColor(.white, for: .normal)
            button.isSelection = false}
        
    }
    
    func highlightButton(_ button: OperatorButton){
        deselectButton()
        button.backgroundColor = .white
        button.setTitleColor(.systemOrange, for: .normal)
        button.isSelection = true
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        let number = sender.tag
        
        if shouldStartNewNumber {
            deselectButton()
            displayLabel.text = "\(number)"
            shouldStartNewNumber = false
        } else {
            if displayNumber == 0 {
                displayLabel.text = "\(number)"
            } else {
                displayLabel.text! += "\(number)"
            }
        }
    }
    
    func performOperation(){
        guard let previusNumber else { return }
        
        var result: Double = 0
        
        switch operation {
        case .divide:
            result = previusNumber / displayNumber
        case .multiply:
            result = previusNumber * displayNumber
        case .subtract:
            result = previusNumber - displayNumber
        case .add:
            result = previusNumber + displayNumber
        case .none:
            return
        }
        if result.truncatingRemainder(dividingBy: 1) == 0  {
            let int = Int(result)
            displayLabel.text = "\(int)"
        }else{
            displayLabel.text = "\(result)"
        }
        
        displayLabel.text = "\(result)"
        self.previusNumber = result
    }
    
    @IBAction func didTapDecimalButton(_ sender: UIButton) {
        let text = displayLabel.text!
        if text.last != "." {
            displayLabel.text!.removeLast()
        } else if !text.contains(".") {
            displayLabel.text! += "."
        }
    }

    @IBAction func didTapEqualButton(_ sender: UIButton) {
        guard operation != .none else { return }
        performOperation()
        equalButtonTapped = true
        shouldStartNewNumber = true
    }
    
    @IBAction func didTapPercentButton() {
        guard var n = Double(displayLabel.text!) else{
            return
        }
        n /= 100
        displayLabel.text = "\(n)"
    }
    
    @IBAction func didTapPlusMinusBtton() {
        guard var n = Double(displayLabel.text!) else{
            return
        }
        n *= -1
        
        displayLabel.text = "\(n)"
    }
    
    @IBAction func didTapClearButton() {
        previusNumber = nil
        displayLabel.text = "0"
        operation = .none
        deselectButton()
        shouldStartNewNumber = false
    }
    
}
