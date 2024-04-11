//
//  ViewModel.swift
//  PlayerStats
//
//  Created by Daniel Ezekiel on 4/10/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data: (player: Player, team: Team))
        case failed(error: Error)
    }
    
    @Published private(set) var status: Status = .notStarted
    
    private let  controller: FetchController
    
    init(controller: FetchController){
        self.controller = controller
    }
    
    func getData(for show:String) async {
        status = .fetching
        
        do {
            let player = try await controller.fetchPlayer(from: show)
            
            let team = try await controller.fetchTeam(from: <#T##String#>)/*(quote.character)*/
            
            status = .success(data: (player, team))
        } catch {
            status = .failed(error: error)
        }
    }
}
