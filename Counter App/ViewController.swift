import UIKit

class ViewController: UIViewController {
    private var counterView: Int = 0
    private var logTexView: String = "История изменений:\n"
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
    
     override func viewDidLoad() {
         super.viewDidLoad()

        counterLabel.text = "\(counterView)"
        changesHistory.text = logTexView
        changesHistory.isEditable = false
    }

    private func plus() {
        counterView += 1
        counterLabel.text = "\(counterView)"

        let currentDate = getCurrentDate()
        logTexView += "\(currentDate): Значение изменено на +1\n"
        changesHistory.text = logTexView
    }

    private func minus() {
        if counterView != 0 {
            counterView -= 1
            counterLabel.text = "\(counterView)"

            let currentDate = getCurrentDate()
            logTexView += "\(currentDate): Значение изменено на -1\n"
            changesHistory.text = logTexView
        } else {
            let currentDate = getCurrentDate()
            logTexView += "\(currentDate): Попытка уменьшить значение счетчика ниже 0\n"
            changesHistory.text = logTexView
        }
    }

    private func reset() {
        counterView = 0
        counterLabel.text = "\(counterView)"

        let currentDate = getCurrentDate()
        logTexView += "\(currentDate): Значение сброшено\n"
        changesHistory.text = logTexView
    }

    @IBOutlet weak var changesHistory: UITextView!
    @IBOutlet weak var counterLabel: UILabel!

    @IBAction func plusButton(_ sender: Any) {
        plus()
    }

    @IBAction func minusButton(_ sender: Any) {
        minus()
    }

    @IBAction func resetButton(_ sender: Any) {
        reset()
    }
}
