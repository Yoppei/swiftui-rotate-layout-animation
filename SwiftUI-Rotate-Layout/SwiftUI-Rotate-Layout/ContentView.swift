//
//  ContentView.swift
//  SwiftUI-Rotate-Layout
//
//  Created by Yohei Okawa on 2024/10/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var offset: Angle = .degrees(0)
    
    var body: some View {
        RadialView(offset: offset)
            .padding()
            .onTapGesture {
                withAnimation {
                    offset += .degrees(180)
                }
            }
    }
}

#Preview {
    ContentView()
}
