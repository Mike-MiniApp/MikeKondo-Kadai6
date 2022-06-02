//
//  ViewController.swift
//  MikeKondo-Kadai6
//
//  Created by 近藤米功 on 2022/05/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var answerLabel: UILabel!
    @IBOutlet private var slider: UISlider!
    private var correctAnswer: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setInit()
    }

    @IBAction private func tappedJudgeButton(_ sender: Any) {
        let numberSlider: Int = Int(slider.value)
        let numberAnswerLabel: Int = Int(answerLabel.text ?? "") ?? 0
        if numberSlider == numberAnswerLabel {
            judgeAlert(judge: "当たり", numberSlider: numberSlider)
        } else {
            judgeAlert(judge: "はずれ", numberSlider: numberSlider)
        }
    }

    private func setInit() {
        correctAnswer = Int.random(in: 1...100)
        answerLabel.text = String(correctAnswer)
        slider.value = 50
    }

    private func judgeAlert(judge: String, numberSlider: Int) {
        let title = "結果"
        let message = "\(judge)!\nあなたの値: \(numberSlider)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let restart = UIAlertAction(title: "再挑戦", style: .default) { _ in
            self.setInit()
        }
        alert.addAction(restart)
        present(alert, animated: true, completion: nil)
    }
}
