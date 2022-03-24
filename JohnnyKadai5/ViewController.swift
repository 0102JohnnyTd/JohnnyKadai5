//
//  ViewController.swift
//  JohnnyKadai5
//
//  Created by Johnny Toda on 2022/03/21.
//

import UIKit

final class ViewController: UIViewController {
    private enum Message {
        static let firstValueAlert = "割られる数を入力してください"
        static let secondValueAlert = "割る数を入力してください"
        static let secondValueIsZeroAlert = "割る数は0以外の値を入力してください"
    }

    @IBOutlet private weak var valueTextField1: UITextField!
    @IBOutlet private weak var valueTextField2: UITextField!

    private var valueTextFields: [UITextField] {
        [valueTextField1, valueTextField2]
    }

    @IBOutlet private weak var resultLabel: UILabel!

    @IBAction private func executeCalculation(_ sender: Any) {
        checkTextFieldsValue()
    }

    private func checkTextFieldsValue() {
        let values = valueTextFields.map { $0.textToDouble }

        guard let value1 = values[0] else {
            showAlert(messeage: Message.firstValueAlert)
            return
        }

        guard let value2 = values[1] else {
            showAlert(messeage: Message.secondValueAlert)
            return
        }

        guard !value2.isZero else {
            showAlert(messeage: Message.secondValueIsZeroAlert)
            return
        }

        resultLabel.text = String(value1 / value2)
    }

    private func showAlert(messeage: String) {
        let alertController = UIAlertController(title: "エラー", message: messeage, preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        present(alertController, animated: true, completion: nil)
    }
}

private extension UITextField {
    var textToDouble: Double? {
        text.flatMap { Double($0) }
    }
}
