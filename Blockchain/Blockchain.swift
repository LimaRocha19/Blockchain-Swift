//
//  Blockchain.swift
//  Blockchain
//
//  Created by Isaías Lima on 18/10/17.
//  Copyright © 2017 Isaías. All rights reserved.
//

import UIKit

// Esta classe se comportará como uma pilha

class Blockchain: NSObject {

    private var chain: [Block]

    override init() {
        self.chain = []
        super.init()
    }

    func append(_ block: Block) {
        guard let first = self.chain.first else {
            block.mine()
            self.chain.append(block)
            return
        }
        block.Previous = first.Hash
        block.mine()
        self.chain.append(block)
    }

    func debugPrint() {
        print(#function, self.chain.count, self.chain)
    }
}
