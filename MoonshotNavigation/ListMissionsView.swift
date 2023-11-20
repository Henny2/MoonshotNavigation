//
//  ListMissionsView.swift
//  MoonshotNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import SwiftUI

struct ListMissionsView: View {
    let missions: [Mission]
    let astronauts: [String:Astronaut]
    var body: some View {
        NavigationStack{
            
            // fix the divider lines, follow this: https://www.hackingwithswift.com/quick-start/swiftui/composing-views-to-create-a-list-row
            List {
                ForEach(missions){ mission in
                    NavigationLink{
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        MissionListItem(mission: mission)
                    }.alignmentGuide(.listRowSeparatorLeading) { dimension in
                        return 0
                    }
                }.listRowBackground(Color.lightBackground)
            }.scrollContentBackground(.hidden)
                
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    return ListMissionsView(missions: missions, astronauts: astronauts).preferredColorScheme(.dark)
}
