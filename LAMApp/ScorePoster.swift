//
//  ScorePoster.swift
//  LAMApp
//
//  Created by Alexandre on 28/03/2017.
//  Copyright © 2017 LAMA. All rights reserved.
//

import Foundation

public class ScorePoster {
    static func post(NomTeam:String, Score:String, NbPlayer:String, Niveau:String) {
        var request = URLRequest(url: URL(string: "http://78.192.156.30:8050/LAMA/api/index.php/\(NomTeam)&\(Score)&\(NbPlayer)&\(Niveau)")!)
        request.httpMethod = "POST"
        let postString = "\(NomTeam)&\(Score)&\(NbPlayer)&\(Niveau)"
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
}
