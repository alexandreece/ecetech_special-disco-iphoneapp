//
//  GameEngine.swift
//  LAMApp
//
//  Created by Adrien on 06/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

protocol GameProtocol
{
    func TeamAPlay()
    
}

class GameEngine: NSObject
{
    var delegate : GameProtocol?
    
    func update()
    {
        delegate?.TeamAPlay()
    }
}
