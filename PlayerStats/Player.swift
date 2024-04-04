//
//  Player.swift
//  PlayerStats
//
//  Created by Daniel Ezekiel on 3/27/24.
//

import Foundation



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

baseURL.httpMethod = "GET"
baseURL.allHTTPHeaderFields = headers

let session = URLSession.shared
let dataTask = session.dataTask(with: baseURL as URLRequest, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error as Any)
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse!)
    }
})

dataTask.resume()
