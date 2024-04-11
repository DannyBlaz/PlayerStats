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
    
    private let headers = [
        "X-RapidAPI-Key": "2c76bf1d31msh4251560b9c0cc5ap1b7448jsnc65817844fc7",
        "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com"
    ]
    
    private let playerURL = NSMutableURLRequest(url: NSURL(string: "https://api-football-v1.p.rapidapi.com/v3/players?id=129718&season=2020")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
    
    private let teamURL = NSMutableURLRequest(url: NSURL(string: "https://api-football-v1.p.rapidapi.com/v3/players/squads?team=541")! as URL,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
    
    // Fetch Team
    func fetchTeam() async throws -> Team {
        
        teamURL.httpMethod = "GET"
        teamURL.allHTTPHeaderFields = headers
        
        guard let fetchURL = teamURL.url else{
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let team = try decoder.decode(Team.self, from: data)
        
        return team
    }
    
    // Fetch Player
    func fetchPlayer() async throws -> Player {
        
        playerURL.httpMethod = "GET"
        playerURL.allHTTPHeaderFields = headers
        
        guard let fetchURL = playerURL.url else{
            throw NetworkError.badURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let player = try decoder.decode(Player.self, from: data)
        
        return player
    }
    
}
