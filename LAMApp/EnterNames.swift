//
//  EnterNames.swift
//  LAMApp
//
//  Created by Lucas on 06/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import UIKit

class EnterNames : 	UITableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return Game.shared.NbTeam+1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            case 0 :
                return Game.shared.NbPlayers+1
            case 1 :
                return Game.shared.NbPlayers+1
            default:
                return 1
        }
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell?
        
        switch indexPath.section {
            
            case 0...1 :
                switch indexPath.row {
                    case 0:
                        cell = tableView.dequeueReusableCell(withIdentifier: "TeamName")
                    case 1:
                        cell = tableView.dequeueReusableCell(withIdentifier: "PlayerName")
                    default:
                        cell = tableView.dequeueReusableCell(withIdentifier: "PlayerName")
                }
            
            default:
                cell = tableView.dequeueReusableCell(withIdentifier: "ValidateButton")
        }
        
          return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        
        switch indexPath.section {
            
            case 0...1 :
                switch indexPath.row {
                    case 0:
                            return 110.0;
                    case 1:
                            return 55.0;
                    default:
                            return 55.0;
            }
            
            default:
                return 110.0;
        }
        
    }
    
}
