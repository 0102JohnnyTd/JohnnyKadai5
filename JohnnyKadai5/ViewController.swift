//
//  ViewController.swift
//  JohnnyKadai5
//
//  Created by Johnny Toda on 2022/03/21.
//

import UIKit

final class ViewController: UIViewController {
    private enum Messsage {
        static let firstValueAlert = "割られる数を入力してください"
        static let secondValueAlert = "割る数を入力してください"
        static let secondValueIsZeroAlert = "割る数は0以外の値を入力してください"
    }

    private var valueTextFields: [UITextField] {
        [firstValueTextField, secondValueTextField]
    }

    @IBOutlet private weak var firstValueTextField: UITextField!

    @IBOutlet private weak var secondValueTextField: UITextField!

    @IBOutlet private weak var resultLabel: UILabel!

    @IBAction private func executeCalculation(_ sender: Any) {
        checkTextFieldsValue()
    }

    private func checkTextFieldsValue() {
        let values = valueTextFields.map { $0.textToDouble }

        guard let firstValue = values[0] else {
            showAlert(messeage: Messsage.firstValueAlert)
            return
        }
        guard let secondValue = values[1] else {
            showAlert(messeage: Messsage.secondValueAlert)
            return
        }
        guard !secondValue.isZero else {
            showAlert(messeage: Messsage.secondValueIsZeroAlert)
            return
        }
        resultLabel.text = String(firstValue / secondValue)
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
