//
//  Block.swift
//  Blockchain
//
//  Created by Isaías Lima on 07/10/17.
//  Copyright © 2017 Isaías. All rights reserved.
//

import UIKit
import CryptoSwift

class Block: NSObject {

    var number: Int
    var nounce: CLong
    var data: String

    var Previous: String
    var Hash: String {
        let info = ("\(self.number)-\(self.nounce)-" + self.data + "-" + self.Previous).data(using: String.Encoding.utf32)!
        let sha256 = info.sha256()

        return sha256.toHexString()
    }

    var isValid: Bool {
        return self.Hash.hasPrefix("0000")
    }

    init(number: Int, data: String) {
        self.number = number
        self.nounce = 0
        self.data = data
        self.Previous = "0000000000000000"

        super.init()

        self.mine()
    }

    func mine() {
        self.nounce = 0
        while !self.Hash.hasPrefix("0000") {
            self.nounce = self.nounce + 1
        }
    }

}
