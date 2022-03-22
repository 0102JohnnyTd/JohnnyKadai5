//
//  ViewController.swift
//  JohnnyKadai5
//
//  Created by Johnny Toda on 2022/03/21.
//

import UIKit

final class ViewController: UIViewController {
    private let firstValueAlert = "割られる数を入力してください"
    private let secondValueAlert = "割る数を入力してください"
    private let secondValueIsZeroAlert = "割る数は0以外の値を入力してください"

    @IBOutlet private var valueTextFields: [UITextField]!

    @IBOutlet private weak var resultLabel: UILabel!

    @IBAction private func executeCalculation(_ sender: Any) {
        checkTextFieldsValue()
    }

    private func checkTextFieldsValue() {
        switch valueTextFields[0].text {
        case "":
            showAlert(messeage: firstValueAlert)
        default:
            switch valueTextFields[1].text {
            case "":
                showAlert(messeage: secondValueAlert)
            default:
                let values = valueTextFields.map { $0.textToDouble }
                guard !values[1].isZero else {
                    showAlert(messeage: secondValueIsZeroAlert)
                    return
                }
                resultLabel.text = String(values[0] / values[1])
            }
        }
    }

    private func showAlert(messeage: String) {
        let alertController = UIAlertController(title: "エラー", message: messeage, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }
}

private extension UITextField {
    var textToDouble: Double {
        text.flatMap { Double($0) } ?? 0
    }
}
