//
//  ListMissionsView.swift
//  MoonshotNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import SwiftUI

struct ListMissionsView: View {
    let missions: [Mission]
    var astronauts: [String:Astronaut]
    var body: some View {
        NavigationStack{
            
            // fix the divider lines, follow this: https://www.hackingwithswift.com/quick-start/swiftui/composing-views-to-create-a-list-row
            List(missions) { mission in
//                ForEach(missions){ mission in
                    NavigationLink(value: mission){
                        Text("This is the label of \(mission.displayName)")
                    }
                }
                .navigationDestination(for: Mission.self){ mission in
//                    Text("you selected \(mission.displayName)")
//                    MissionView(mission: mission, astronauts: astronauts)
                    MissionView(mission: mission)
//                    NavViewTest(inp1: "hi", inp2: 2)
//                        MissionListItem(mission: mission)
                    
                }
            }

        }
    }
//}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    return ListMissionsView(missions: missions, astronauts: astronauts).preferredColorScheme(.dark)
}
