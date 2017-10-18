//
//  ViewController.swift
//  Blockchain
//
//  Created by Isaías Lima on 07/10/17.
//  Copyright © 2017 Isaías. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var block: Block!

    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var nounceTF: UITextField!
    @IBOutlet weak var dataTF: UITextField!
    @IBOutlet weak var hashLabel: UILabel!
    
    @IBAction func mine(_ sender: Any) {
        self.block.mine()
        self.update()
        self.valid()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.numberTF.delegate = self
        self.nounceTF.delegate = self
        self.dataTF.delegate = self

        self.block = Block(number: 1, data: "")

        self.update()
        self.valid()
    }

    func update() {
        self.numberTF.text = "\(self.block.number)"
        self.nounceTF.text = "\(self.block.nounce)"
        self.dataTF.text = self.block.data
        self.hashLabel.text = self.block.Hash
    }

    func valid() {
        let color = self.block.isValid ? UIColor.green : UIColor.red

        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : color]
    }
}

extension ViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if string == "" {
            switch textField {
            case self.numberTF:
                self.block.number = Int(String(self.numberTF.text!.characters.dropLast())) ?? 0
                self.hashLabel.text = self.block.Hash
                self.valid()
                return true
            case self.nounceTF:
                self.block.nounce = Int(String(self.nounceTF.text!.characters.dropLast())) ?? 0
                self.hashLabel.text = self.block.Hash
                self.valid()
                return true
            case self.dataTF:
                self.block.data = String(self.dataTF.text!.characters.dropLast())
                self.hashLabel.text = self.block.Hash
                self.valid()
                return true
            default:
                print(#function, "xablau")
                self.update()
                self.valid()
                return true
            }
        }

        switch textField {
        case self.numberTF:
            self.block.number = Int(self.numberTF.text! + string)!
            self.hashLabel.text = self.block.Hash
            self.valid()
            return true
        case self.nounceTF:
            self.block.nounce = Int(self.nounceTF.text! + string)!
            self.hashLabel.text = self.block.Hash
            self.valid()
            return true
        case self.dataTF:
            self.block.data = self.dataTF.text! + string
            self.hashLabel.text = self.block.Hash
            self.valid()
            return true
        default:
            print(#function, "xablau")
            self.update()
            self.valid()
            return true
        }
    }
}
