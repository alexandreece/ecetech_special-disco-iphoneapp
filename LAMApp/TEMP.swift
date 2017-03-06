//
//  EnterNames.swift
//  LAMApp
//
//  Created by Lucas on 04/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

//class EnterNames : 	UIViewController, UITableViewDelegate, UITableViewDataSource {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 5
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        switch section {
//        case 0: return 2
//        case 1: return 5
//        case 2: return 2
//        case 3: return 5
//        case 4: return 1
//        default: return 0
//        }
//        
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = UITableViewCell(style: .default, reuseIdentifier: "basic")
//        
//        
//        //        let cell = tableView.dequeueReusableCellWithIdentifier("TextInputCell") as TextInputTableViewCell
//        //
//        //        cell.configure(text: "", placeholder: "Enter some text!")


//        if(section == 0 || section == NbPlayers+1){
//            return 1
//        } else if(section > 0 && section <= NbPlayers || section > NbPlayers+1){
//            return NbPlayers
//        }
//
//        //        let myTextField: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300.00, height: 30.00))
//        //        myTextField.center = self.view.center
//        //        myTextField.placeholder = "Place holder text"
//        //        myTextField.text = "UITextField example"
//        //        myTextField.borderStyle = UITextBorderStyle.line
//        //        myTextField.backgroundColor = UIColor.white
//        //        myTextField.textColor = UIColor.blue
//        
//        
//        // Add UITextField as a subview
//        //        self.view.addSubview(myTextField)
//        
//        switch indexPath.section {
//            
//        case 0 :
//            switch indexPath.row {
//            case 0:
//                cell.textLabel?.text = "Nommez l'équipe A :"
//            case 1:
//                cell.textLabel?.text = "TEXTFIELD"
//                //                        let button = UIButton(frame: CGRectMake(50, 100, 100, 50))
//                //                        button.backgroundColor = UIColor.whiteColor()
//                //                        button.setTitle("VALIDER", forState: UIControlState.Normal)
//            //                        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//            default:
//                break
//            }
//            
//        case 1:
//            switch indexPath.row {
//            case 0:
//                cell.textLabel?.text = "Joueur 1 :"
//            case 1:
//                cell.textLabel?.text = "Joueur 2 :"
//            case 2:
//                cell.textLabel?.text = "Joueur 3 :"
//            case 3:
//                cell.textLabel?.text = "Joueur 4 :"
//            case 4:
//                cell.textLabel?.text = "Joueur 5 :"
//            default:
//                break
//            }
//            
//        case 2:
//            switch indexPath.row {
//            case 0:
//                cell.textLabel?.text = "Nommez l'équipe B :"
//            case 1:
//                cell.textLabel?.text = "TEXTFIELD"
//            default:
//                break
//            }
//            
//        case 3:
//            switch indexPath.row {
//            case 0:
//                cell.textLabel?.text = "Joueur 1 :"
//            case 1:
//                cell.textLabel?.text = "Joueur 2 :"
//            case 2:
//                cell.textLabel?.text = "Joueur 3 :"
//            case 3:
//                cell.textLabel?.text = "Joueur 4 :"
//            case 4:
//                cell.textLabel?.text = "Joueur 5 :"
//            default:
//                break
//            }
//            
//        case 4:
//            cell.textLabel?.text = "VALIDER"
//            
//            
//        default:
//            break
//        }
//        
//        cell.backgroundColor = UIColor.green
//        return cell
//    }
//    
//}
