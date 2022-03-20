//
//  ViewController.swift
//  JohnnyKadai5
//
//  Created by Johnny Toda on 2022/03/21.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var valueTextFields: [UITextField]!

    @IBOutlet weak var resultLabel: UILabel!

    @IBAction func executeCalculation(_ sender: Any) {
        
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
