//
//  MissionListItem.swift
//  MoonshotNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import SwiftUI

struct MissionListItem: View {
    let mission: Mission
    var body: some View {
        HStack{
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            VStack{
                Text(mission.displayName)
                Text(mission.formattedLaunchDate)
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    return MissionListItem(mission: missions[0])
}
