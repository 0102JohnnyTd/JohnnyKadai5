//
//  ViewController.swift
//  JohnnyKadai5
//
//  Created by Johnny Toda on 2022/03/21.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var values = valueTextFields.map { $0.textToInt }

    @IBOutlet private var valueTextFields: [UITextField]!

    @IBOutlet weak private var resultLabel: UILabel!

    @IBAction private func executeCalculation(_ sender: Any) {
        let division = values[0] / values[1]
        resultLabel.text = String(division)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

private extension UITextField {
    var textToInt: Int {
        text.flatMap { Int($0) } ?? 0
    }
}
