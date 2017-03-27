//
//  SelectRandomWord.swift
//  LAMApp
//
//  Created by Alexandre on 27/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import Foundation

func SelectRandomWord() -> Word {
    let mots = WordDataBase.shared.objects
    return mots[Int(arc4random_uniform(UInt32(mots.count)))]
}
