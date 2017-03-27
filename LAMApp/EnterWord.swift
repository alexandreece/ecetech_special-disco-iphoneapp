//
//  EnterWord.swift
//  LAMApp
//
//  Created by Lucas on 20/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

class EnterWord : UIViewController, UIScrollViewDelegate {
    
    var arrayOfTextFields:[UITextField] = []
    
    @IBOutlet weak var Scroll: UIScrollView!
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor(red:0.00, green:0.49, blue:0.50, alpha:1.0)
        self.Scroll.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        
        var margin = 20
        
        var n = 0
        
        for i in 0...5 {
            let playerField: UITextField = UITextField(frame: CGRect(x: 35, y: Double(margin), width: 275.00, height: 30.00));
            playerField.placeholder = "Ex: Vélociraptor"
            playerField.borderStyle = UITextBorderStyle.roundedRect
            playerField.backgroundColor = UIColor.white
            playerField.textColor = UIColor.black
            n = (i + 1) * 10 + 1
            playerField.tag = n
            self.arrayOfTextFields.append(playerField)
            self.Scroll.addSubview(playerField)
            
            let btnValidate: UIButton = UIButton(frame: CGRect(x: 320, y: margin, width: 30, height: 30))
            btnValidate.backgroundColor = UIColor(white:0.0, alpha:0.0)
            btnValidate.setTitle("✔", for: .normal)
            btnValidate.setTitleColor(UIColor.white, for: .normal)
            btnValidate.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            btnValidate.addTarget(self, action: #selector(AddWord), for: .touchUpInside)
            btnValidate.tag = (i + 1) * 10
            self.Scroll.addSubview(btnValidate)
            
            margin = margin + 40
            
            let btnRndm: UIButton = UIButton(frame: CGRect(x: 35, y: margin, width: 85, height: 30))
            btnRndm.backgroundColor = UIColor.white
            btnRndm.setTitle("Aléatoire", for: .normal)
            btnRndm.setTitleColor(UIColor.black, for: .normal)
            btnRndm.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
            btnRndm.addTarget(self, action: #selector(RndmWord), for: .touchUpInside)
            n = n + 1
            btnRndm.tag = n
            self.Scroll.addSubview(btnRndm)
            
            let btnDico: UIButton = UIButton(frame: CGRect(x: 127, y: margin, width: 85, height: 30))
            btnDico.backgroundColor = UIColor.white
            btnDico.setTitle("Dictionnaire", for: .normal)
            btnDico.setTitleColor(UIColor.black, for: .normal)
            btnDico.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
            btnDico.addTarget(self, action: #selector(DicoWord), for: .touchUpInside)
            n = n + 1
            btnDico.tag = n
            self.Scroll.addSubview(btnDico)
            
            let btnPrev: UIButton = UIButton(frame: CGRect(x: 219, y: margin, width: 90, height: 30))
            btnPrev.backgroundColor = UIColor.white
            btnPrev.setTitle("Précédents", for: .normal)
            btnPrev.setTitleColor(UIColor.black, for: .normal)
            btnPrev.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
            btnPrev.addTarget(self, action: #selector(PrevWord), for: .touchUpInside)
            n = n + 1
            btnPrev.tag = n
            self.Scroll.addSubview(btnPrev)
            
            margin = margin + 50
        }
        
        self.Scroll.contentSize = CGSize(width:self.Scroll.frame.width, height:self.Scroll.frame.height + 100)
        self.Scroll.delegate = self
    }
    
    func RndmWord(sender: UIButton!) {
        let word = SelectRandomWord().word
        print(word)
        let i = sender.tag - 1
        if let playerField = self.view.viewWithTag(i) as? UITextField{
            playerField.text = word
        }
    }
    
    func DicoWord(sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DicoWordID") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func PrevWord(sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PrevWordID") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func AddWord(sender: UIButton!) {
        print(sender.tag)
        let i = sender.tag + 1
        if let txtField = self.view.viewWithTag(i) as? UITextField {
            Game.shared.Words_List.append(txtField.text!)
            print(Game.shared.Words_List)
            
            if let btnValidate = self.view.viewWithTag(sender.tag) as? UIButton{
                btnValidate.removeFromSuperview()
            }
            
            var k = sender.tag + 1
            
            if let playerField = self.view.viewWithTag(k) as? UITextField{
                playerField.removeFromSuperview()
            }
            
            k += 1
            
            if let btnRndm = self.view.viewWithTag(k) as? UIButton{
                btnRndm.removeFromSuperview()
            }
            
            k += 1
            
            if let btnDico = self.view.viewWithTag(k) as? UIButton{
                btnDico.removeFromSuperview()
            }
            
            k += 1
            
            if let btnPrev = self.view.viewWithTag(k) as? UIButton{
                btnPrev.removeFromSuperview()
            }
        }
    }
    
}

