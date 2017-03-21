//
//  EnterWord.swift
//  LAMApp
//
//  Created by Lucas on 20/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

class EnterWord : UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var Scroll: UIScrollView!
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor(red:0.00, green:0.49, blue:0.50, alpha:1.0)
        self.Scroll.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        
        var margin = 20
        
        for i in 0...5 {
            let playerField: UITextField = UITextField(frame: CGRect(x: 35, y: Double(margin), width: 275.00, height: 30.00));
            playerField.placeholder = "Ex: Vélociraptor"
            playerField.borderStyle = UITextBorderStyle.roundedRect
            playerField.backgroundColor = UIColor.white
            playerField.textColor = UIColor.black
            self.Scroll.addSubview(playerField)
            
            let btn: UIButton = UIButton(frame: CGRect(x: 320, y: margin, width: 30, height: 30))
            btn.backgroundColor = UIColor(white:0.0, alpha:0.0)
            btn.setTitle("✔", for: .normal)
            btn.setTitleColor(UIColor.white, for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            //            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            btn.tag = i+1
            self.Scroll.addSubview(btn)
            
            margin = margin + 40
            
            let btnRndm: UIButton = UIButton(frame: CGRect(x: 35, y: margin, width: 85, height: 30))
            btnRndm.backgroundColor = UIColor.white
            btnRndm.setTitle("Aléatoire", for: .normal)
            btnRndm.setTitleColor(UIColor.black, for: .normal)
            btnRndm.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
            //            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            btnRndm.tag = i+1
            self.Scroll.addSubview(btnRndm)
            
            let btnDico: UIButton = UIButton(frame: CGRect(x: 127, y: margin, width: 85, height: 30))
            btnDico.backgroundColor = UIColor.white
            btnDico.setTitle("Dictionnaire", for: .normal)
            btnDico.setTitleColor(UIColor.black, for: .normal)
            btnDico.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
            //            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            btnDico.tag = i+1
            self.Scroll.addSubview(btnDico)
            
            let btnPrev: UIButton = UIButton(frame: CGRect(x: 219, y: margin, width: 90, height: 30))
            btnPrev.backgroundColor = UIColor.white
            btnPrev.setTitle("Précédents", for: .normal)
            btnPrev.setTitleColor(UIColor.black, for: .normal)
            btnPrev.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
            //            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            btnPrev.tag = i+1
            self.Scroll.addSubview(btnPrev)
            
            
            
            margin = margin + 50
        }
        
        self.Scroll.contentSize = CGSize(width:self.Scroll.frame.width, height:self.Scroll.frame.height + 100)
        self.Scroll.delegate = self
    }
}

