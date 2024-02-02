//
//  ContentView.swift
//  swiftUIFavoriteSportLab
//
//  Created by Lars Dansie on 1/18/24.
//

import SwiftUI

struct Sport: Identifiable, Equatable {
    var id: UUID = UUID()
    var title: String
}

extension Sport {
    static var listOfSports: [Sport] = [
        Sport(title: "Golf"),
        Sport(title: "Football"),
        Sport(title: "Soccer"),
        Sport(title: "Baseball")
    ]
}

struct ContentView: View {
    
    
    //    @State var favSportSubmitted = false
    @State var sports = Sport.listOfSports
    @State var favSportTapped: Sport?
    @State var favSportSelected = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                Spacer()
                
                Text("Favorite Sport")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
                Spacer()
                
                
                //this is where it will go once I am done making it
                HStack {
                    FavoriteSportView(sport: $sports[0], favSportTapped: $favSportTapped)
                    FavoriteSportView(sport: $sports[1], favSportTapped: $favSportTapped)
                }
                HStack {
                    FavoriteSportView(sport: $sports[2], favSportTapped: $favSportTapped)
                    FavoriteSportView(sport: $sports[3], favSportTapped: $favSportTapped)
                }
                
                
                Spacer()
                
                Button(action: {
                    if (favSportTapped != nil) { favSportSelected = true }
                }) {
                    Text("Submit")
                        .padding(5)
                        .frame(width: 250)
                }
                .buttonStyle(.borderedProminent)
                .foregroundStyle(Color.white)
                
                if favSportSelected, let favSportTapped = favSportTapped {
                    Text("You chose \(favSportTapped.title)!")
                        .foregroundStyle(Color.white)
                }
                
                Spacer()
            }
            
            .padding()
        }
    }
}

struct CustomButtonStyle: ViewModifier {
    var isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(isActive ? Color.green : Color.green.opacity(0.4))
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct FavoriteSportView: View {
    @Binding var sport: Sport
    @Binding var favSportTapped: Sport?
    var body: some View {
        HStack {
            Button(
                action: {
                    favSportTapped = sport
                },
                label: {
                    Text(sport.title)
                        .frame(width: 90, height: 90)
                        .modifier(CustomButtonStyle(isActive: favSportTapped == sport))
                }
            )
        }
        .foregroundStyle(Color.white)
    }
}

        
#Preview {
    ContentView()
}

