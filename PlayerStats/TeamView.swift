//
//  TeamView.swift
//  PlayerStats
//
//  Created by Daniel Ezekiel on 4/15/24.
//

import SwiftUI

struct TeamView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        switch viewModel.status {
        case .success(let data):
            Text(data.team.name)
            
        case .fetching:
            ProgressView()
            
        default:
            EmptyView()
        }
        
        Button{
            Task {
                await viewModel.getData()
            }
        } label: {
            Text("Get Random Quote")
                .font(.title)
                .foregroundColor(.white)
                .padding()
        }
    }
}

#Preview {
    TeamView()
        .preferredColorScheme(.dark)
}
