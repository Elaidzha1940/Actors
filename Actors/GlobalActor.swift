//  /*
//
//  Project: Actors
//  File: GlobalActor.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.01.2024
//
//  */

import SwiftUI

@globalActor final class MyGlobalActor {
    static var shared = MyNewDataManager()
    
}

actor MyNewDataManager {
    
    func getDataFromDatabase() -> [String] {
        return ["One", "Two", "Three", "Four", "Five"]
    }
}

class GlobalActorViewModel: ObservableObject {
    @MainActor @Published var dataArray: [String] = []
    let manager = MyGlobalActor.shared
    
    @MyGlobalActor
    //@MainActor
    func getData() {
        
        // Heavy complex methods
        
        Task {
            let data = await manager.getDataFromDatabase()
            await MainActor.run {
                self.dataArray = data
            }
        }
    }
}

struct GlobalActor: View {
  @StateObject private var viewModel = GlobalActorViewModel()
    
    var body: some View {
        
        ScrollView {
            VStack {
                ForEach(viewModel.dataArray, id: \.self) { data in
                    Text(data)
                        .font(.system(size: 20, weight: .bold, design: .rounded))
                }
            }
        }
        .task {
           await viewModel.getData()
        }
    }
}

#Preview {
    GlobalActor()
}
