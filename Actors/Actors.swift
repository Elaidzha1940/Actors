//  /*
//
//  Project: Actors
//  File: Actors.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.01.2024
//
//  */

import SwiftUI

class myDataManager {
    static let instance = myDataManager()
    
    private init() { }
    
    var data: [String] = []
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        return data.randomElement()
    }
}

struct HomeView: View {
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.1, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()
    let manager = myDataManager.instance

    var body: some View {
        ZStack {
            Color.gray.opacity(0.7)
                .ignoresSafeArea()
            
            Text(text)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
        .onReceive(timer, perform: { _ in
            if let data = manager.getRandomData() {
                self.text = data
            }
        })
    }
}

struct ProfileView: View {
    @State private var text: String = ""
    let timer = Timer.publish(every: 0.1, tolerance: nil, on: .main, in: .common, options: nil).autoconnect()
    let manager = myDataManager.instance
    
    var body: some View {
        ZStack {
            Color.brown.opacity(0.7)
                .ignoresSafeArea()
            
            Text(text)
                .font(.system(size: 20, weight: .bold, design: .rounded))
        }
        .onReceive(timer, perform: { _ in
            if let data = manager.getRandomData() {
                self.text = data
            }
        })
    }
}


struct Actors: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    Actors()
}
