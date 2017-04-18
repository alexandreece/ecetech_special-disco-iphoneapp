//
//  PlayerList.swift
//  LAMApp
//
//  Created by Lucas on 20/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

class PlayerList : UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var Scroll: UIScrollView!
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor(red:0.00, green:0.49, blue:0.50, alpha:1.0)
        self.Scroll.frame = CGRect(x:0, y:0, width:self.view.frame.width, height:self.view.frame.height)
        
        var margin = 20
        
        let textLabel = UITextView(frame: CGRect(x: 40.0, y: Double(margin), width: 300.0, height: 80.0))
        textLabel.text = "Entrez les mots :"
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.font = UIFont.boldSystemFont(ofSize: 30)
        textLabel.textColor = UIColor.white
        textLabel.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        textLabel.isEditable = false
        self.Scroll.addSubview(textLabel)
        
        margin = margin + 65
        
        let TeamALabel = UITextView(frame: CGRect(x: 40.0, y: Double(margin), width: 300.0, height: 80.0))
        TeamALabel.text = "\(Game.shared.TeamA)"
        TeamALabel.textAlignment = NSTextAlignment.center
        TeamALabel.font = UIFont.boldSystemFont(ofSize: 30)
        TeamALabel.textColor = UIColor.white
        TeamALabel.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        TeamALabel.isEditable = false
        self.Scroll.addSubview(TeamALabel)
        
        margin = margin + 60
        
        var TeamA = 10
        
        for i in 0...Game.shared.NbPlayers-1 {
            
            let btn: UIButton = UIButton(frame: CGRect(x: 100, y: margin, width: 200, height: 35))
            btn.backgroundColor = UIColor.white
            btn.setTitle("\(Game.shared.TeamA_List_Joueurs[i].GetNomJoueur()) -> \(Game.shared.NbWords - Game.shared.WordTeamA[i]) / \(Game.shared.NbWords)", for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            btn.tag = TeamA
            self.Scroll.addSubview(btn)
            
            TeamA += 1
            
            margin = margin + 50
        }
        
        margin = margin + 15
        
        let TeamBLabel = UITextView(frame: CGRect(x: 40.0, y: Double(margin), width: 300.0, height: 80.0))
        TeamBLabel.text = "\(Game.shared.TeamB)"
        TeamBLabel.textAlignment = NSTextAlignment.center
        TeamBLabel.font = UIFont.boldSystemFont(ofSize: 30)
        TeamBLabel.textColor = UIColor.white
        TeamBLabel.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        TeamBLabel.isEditable = false
        self.Scroll.addSubview(TeamBLabel)
        
        margin = margin + 60
        
        var TeamB = 20
        
        for i in 0...Game.shared.NbPlayers-1 {
            
            let btn: UIButton = UIButton(frame: CGRect(x: 100, y: margin, width: 200, height: 35))
            btn.backgroundColor = UIColor.white
            btn.setTitle("\(Game.shared.TeamB_List_Joueurs[i].GetNomJoueur()) -> \(Game.shared.NbWords - Game.shared.WordTeamB[i]) / \(Game.shared.NbWords)", for: .normal)
            btn.setTitleColor(UIColor.black, for: .normal)
            btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            btn.tag = TeamB
            self.Scroll.addSubview(btn)
            
            TeamB += 1
            
            margin = margin + 50
        }
        
        margin = margin + 50
        
        let btn: UIButton = UIButton(frame: CGRect(x: 100, y: margin, width: 200, height: 35))
        btn.backgroundColor = UIColor.white
        btn.setTitle("VALIDER", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btn.addTarget(self, action: #selector(playGame), for: .touchUpInside)
        btn.tag = 1
        self.Scroll.addSubview(btn)
        
        switch Game.shared.NbPlayers{
        case 2 :
            self.Scroll.contentSize = CGSize(width:self.Scroll.frame.width, height:self.Scroll.frame.height - 150)
        case 3 :
            self.Scroll.contentSize = CGSize(width:self.Scroll.frame.width, height:self.Scroll.frame.height + 0)
        case 4 :
            self.Scroll.contentSize = CGSize(width:self.Scroll.frame.width, height:self.Scroll.frame.height + 100)
        case 5 :
            self.Scroll.contentSize = CGSize(width:self.Scroll.frame.width, height:self.Scroll.frame.height + 150)
        default :
            self.Scroll.contentSize = CGSize(width:self.Scroll.frame.width, height:self.Scroll.frame.height + 300)
        }
        self.Scroll.delegate = self
    }
    
    func buttonAction(sender: UIButton!) {
        
        var WordNb = 0
        
        Game.shared.WordPlayer = sender.tag
        
        if Game.shared.WordPlayer >= 10 && Game.shared.WordPlayer <= 14 {
            WordNb = Game.shared.WordTeamA[Game.shared.WordPlayer - 10]
        } else if Game.shared.WordPlayer >= 20 && Game.shared.WordPlayer <= 24 {
            WordNb = Game.shared.WordTeamB[Game.shared.WordPlayer - 20]
        }
        
        if WordNb > 0 {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "EnterWordID") as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func playGame(sender: UIButton!) {
        print("WordListCount = \(Game.shared.Words_List.count)")
        print("NbWords*NbPlayers = \(Game.shared.NbWords*Game.shared.NbPlayers)")
        if Game.shared.Words_List.count == Game.shared.NbWords*Game.shared.NbPlayers*2 {
            Game.shared.copyWordList()
            print(Game.shared.Words_Current_List)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "SKViewID") as UIViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
