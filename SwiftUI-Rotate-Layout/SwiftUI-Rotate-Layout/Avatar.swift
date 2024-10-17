//
//  Avatar.swift
//  SwiftUI-Rotate-Layout
//
//  Created by Yohei Okawa on 2024/10/17.
//

import SwiftUI

struct Avatar: View {
    
    let title: String
    let size: CGFloat = 120
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: size)
            .shadow(radius: 8)
            .overlay {
                Text(title)
                    .font(.system(size: 100))
                    .clipShape(Circle())
            }
        
    }
    
}
