//
//  ViewController.swift
//  KadaiChallenge6
//
//  Created by 澤田世那 on 2022/03/21.
//

import UIKit

class ViewController: UIViewController {

    private var judgmentValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        generateRandomValue()
        judgmentValueLabel.text = String(judgmentValue)
    }

    @IBOutlet private weak var judgmentValueLabel: UILabel!
    @IBOutlet private weak var changeSlider: UISlider!

    @IBAction private func judgeButton(_ sender: Any) {

        let sliderValue = Int(changeSlider.value)
        if sliderValue == judgmentValue {
            presentAlert(message: "当たり!\nあなたの値: \(sliderValue)です")
        } else {
            presentAlert(message: "はずれ!\nあなたの値: \(sliderValue)です")
        }
    }

    private func generateRandomValue () {

        repeat {
            judgmentValue = Int(arc4random_uniform(101))
         } while judgmentValue == 0
    }

    private func presentAlert (message: String) {

        let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "再挑戦", style: .default, handler: { _ in
            self.viewDidLoad()
        })
        alert.addAction(defaultAction)
        present(alert, animated: true, completion: nil)
    }
}
