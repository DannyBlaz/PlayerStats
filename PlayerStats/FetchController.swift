//
//  FetchTeam.swift
//  PlayerStats
//
//  Created by Daniel Ezekiel on 4/1/24.
//

import Foundation

struct FetchController {
    enum NetworkError: Error {
        case badURL, badResponse
    }
    
    let headers = [
        "X-RapidAPI-Key": "2c76bf1d31msh4251560b9c0cc5ap1b7448jsnc65817844fc7",
        "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com"
    ]
    
    private let baseURL = NSMutableURLRequest(url: NSURL(string: "https://api-football-v1.p.rapidapi.com/v3/players/squads?team=541")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
    func fetchTeam(completionHandler: @escaping ([Team]) -> Void) {
        
        baseURL.httpMethod = "GET"
        baseURL.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: baseURL, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching Team: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response)")
                return
            }
            
            let team = try JSONDecoder().decode(Team.self, from: data){
                completionHandler(team ?? [])
            }
        })
    }
}
