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
        let firstLine: String

        if sliderValue == judgmentValue {
            firstLine = "当たり!"
        } else {
            firstLine = "はずれ!"
        }
        presentAlert(message: "\(firstLine)\nあなたの値: \(sliderValue)です")
    }

    private func generateRandomValue () {

        judgmentValue = Int.random(in: 1...100)
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
