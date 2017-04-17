//
//  EnterName.swift
//  LAMApp
//
//  Created by Lucas on 20/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

class EnterName : UIViewController, UITextViewDelegate , UIScrollViewDelegate {
    
    @IBOutlet weak var Scroll: UIScrollView!
    @IBOutlet var nameTeamALabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red:0.00, green:0.49, blue:0.50, alpha:1.0)
        
        self.Scroll.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        //        let scrollViewWidth:CGFloat = self.Scroll.frame.width
        //        let scrollViewHeight:CGFloat = self.Scroll.frame.height
        
        nameTeamALabel = UITextView(frame: CGRect(x: 40.0, y: 30.0, width: 300.0, height: 80.0))
        nameTeamALabel.text = "Nommez l'équipe A :"
        nameTeamALabel.textAlignment = NSTextAlignment.center
        nameTeamALabel.font = UIFont.boldSystemFont(ofSize: 30)
        nameTeamALabel.textColor = UIColor.white
        nameTeamALabel.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        nameTeamALabel.isEditable = false
        //        view.addConstraint(NSLayoutConstraint(item: nameTeamA, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
        self.Scroll.addSubview(nameTeamALabel)
        
        let nameTeamAField = UITextField(frame: CGRect(x: 40, y: 90, width: 300.00, height: 30.00));
        nameTeamAField.placeholder = "Ex: LAMAtraque"
        nameTeamAField.borderStyle = UITextBorderStyle.roundedRect
        nameTeamAField.backgroundColor = UIColor.white
        nameTeamAField.textColor = UIColor.black
        self.Scroll.addSubview(nameTeamAField)
        
        var margin = 150
        
        for i in 0...Game.shared.NbPlayers-1 {
            
            let playerLabel = UITextView(frame: CGRect(x: 10, y: Double(margin), width: 150.0, height: 80.0))
            playerLabel.text = "Joueur \(i+1) :"
            playerLabel.textAlignment = NSTextAlignment.center
            playerLabel.font = UIFont.boldSystemFont(ofSize: 20)
            playerLabel.textColor = UIColor.white
            playerLabel.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
            playerLabel.isEditable = false
            self.Scroll.addSubview(playerLabel)
            
            let playerField: UITextField = UITextField(frame: CGRect(x: 138, y: Double(margin+5), width: 200.00, height: 30.00));
            playerField.placeholder = "Ex: LAMAsseuse"
            playerField.borderStyle = UITextBorderStyle.roundedRect
            playerField.backgroundColor = UIColor.white
            playerField.textColor = UIColor.black
            self.Scroll.addSubview(playerField)
            
            margin = margin + 40
        }
        
        margin = margin + 20
        
        let nameTeamBLabel = UITextView(frame: CGRect(x: 40.0, y: Double(margin), width: 300.0, height: 80.0))
        nameTeamBLabel.text = "Nommez l'équipe B :"
        nameTeamBLabel.textAlignment = NSTextAlignment.center
        nameTeamBLabel.font = UIFont.boldSystemFont(ofSize: 30)
        nameTeamBLabel.textColor = UIColor.white
        nameTeamBLabel.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        nameTeamBLabel.isEditable = false
        self.Scroll.addSubview(nameTeamBLabel)
        
        margin = margin + 60
        
        let nameTeamBField = UITextField(frame: CGRect(x: 40, y: Double(margin), width: 300.00, height: 30.00));
        nameTeamBField.placeholder = "Ex: LAMAlédiction"
        nameTeamBField.borderStyle = UITextBorderStyle.roundedRect
        nameTeamBField.backgroundColor = UIColor.white
        nameTeamBField.textColor = UIColor.black
        self.Scroll.addSubview(nameTeamBField)
        
        margin = margin + 60
        
        for i in 0...Game.shared.NbPlayers-1 {
            
            let playerLabel = UITextView(frame: CGRect(x: 10, y: Double(margin), width: 150.0, height: 80.0))
            playerLabel.text = "Joueur \(i+1) :"
            playerLabel.textAlignment = NSTextAlignment.center
            playerLabel.font = UIFont.boldSystemFont(ofSize: 20)
            playerLabel.textColor = UIColor.white
            playerLabel.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
            playerLabel.isEditable = false
            self.Scroll.addSubview(playerLabel)
            
            let playerField = UITextField(frame: CGRect(x: 138, y: Double(margin+5), width: 200.00, height: 30.00));
            playerField.placeholder = "Ex: LAMAsseuse"
            playerField.borderStyle = UITextBorderStyle.roundedRect
            playerField.backgroundColor = UIColor.white
            playerField.textColor = UIColor.black
            self.Scroll.addSubview(playerField)
            
            margin = margin + 40
        }
        
        margin = margin + 40
        
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: margin, width: 200, height: 50))
        btn.backgroundColor = UIColor.white
        btn.setTitle("Valider", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.tag = 1
        self.Scroll.addSubview(btn)
        
        self.Scroll.contentSize = CGSize(width:self.Scroll.frame.width, height:self.Scroll.frame.height + 115)
        self.Scroll.delegate = self
        
    }
    
    func buttonAction(sender: UIButton!) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PlayerListID") as UIViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

