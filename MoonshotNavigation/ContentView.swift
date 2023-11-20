//
//  ContentView.swift
//  MoonshotNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    @State var showList = false
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack{
            Group{
                if showList {
                    ListMissionsView(missions: missions, astronauts: astronauts)
                } else {
                    GridMissionsView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("Moonshot")
            .toolbar {
                Toggle("List View", isOn: $showList)
            }
            .background(.darkBackground)
            // you prefer dark mode
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
