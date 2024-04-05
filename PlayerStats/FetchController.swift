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
    func fetchTeam(from team: String) async throws -> Team {
        
        baseURL.httpMethod = "GET"
        baseURL.allHTTPHeaderFields = headers
        
        guard let fetchURL = baseURL.url else{
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let team = try JSONDecoder().decode(Team.self, from: data)
        
        return team
    }
    
}
