//
//  CardView.swift
//  MemoryGame
//
//  Created by Alba Valdez on 3/21/24.
//

import SwiftUI

// Card data model
struct Card {
    let emoji: String
}


struct CardView: View {
    var body: some View {
        
        ZStack {
            // Card background
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color.blue.gradient)
                .shadow(color: .black, radius: 4, x: -2, y: 2)

            // Card text
            Text("Located at the southern end of Puget Sound, what is the capitol of Washington?")
                .font(.title)
                .foregroundStyle(.white)
                .padding()
                }
            .frame(width: 300, height: 500)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
