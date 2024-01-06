//  /*
//
//  Project: Actors
//  File: GlobalActor.swift
//  Created by: Elaidzha Shchukin
//  Date: 06.01.2024
//
//  */

import SwiftUI

class GlobalActorViewModel: ObservableObject {
    @Published var dataArray: [String] = []
    
    func getData() async {
        
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
