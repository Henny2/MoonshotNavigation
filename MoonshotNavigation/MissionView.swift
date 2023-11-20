//
//  MissionView.swift
//  MoonshotNavigation
//
//  Created by Henrieke Baunack on 11/19/23.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    // property to track what mission is being viewed
    let mission: Mission
    let crew: [CrewMember]
    
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                        .padding(.bottom)
                    VStack(alignment: .leading){
                        Text("Launch date: \(mission.formattedLaunchDate)").font(.headline)
                     
                        // putting a divider between badge image and hightlights
//                        Rectangle()
//                            .frame(height:2)
//                            .foregroundStyle(.lightBackground)
//                            .padding(.vertical)
                        DividerView()
                        Text("Mission Highlights")
                            .font(.title.bold())
                            .padding(.bottom, 5)
                        Text(mission.description)
                        // putting a divider between badge image and hightlights
                        DividerView()
                        
                        Text("Crew Members")
                            .font(.title .bold())
                            .padding(.bottom, 5)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(crew, id: \.role){ crewMember in
                                NavigationLink{
                                    AstronautView(astronaut: crewMember.astronaut)
                                } label: {
                                    HStack {
                                        Image(crewMember.astronaut.id)
                                            .resizable()
                                            .clipShape(.capsule)
                                            .overlay(
                                                Capsule().strokeBorder(.white, lineWidth: 1)
                                            )
                                            .frame(width: 104, height:72)
            
                                            
                                        VStack(alignment: .leading){
                                            Text(crewMember.astronaut.name)
                                                .foregroundStyle(.white)
                                                .font(.headline)
                                            Text(crewMember.role)
                                                .foregroundStyle(.white)
                                                .opacity(0.5)
                                        }
                                    }
                                    .padding()
                                }
                            }
                        }
                    }
                }
                .padding(.bottom)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
