//
//  MultipleOptions.swift
//  Instafilter
//
//  Created by Fauzan Dwi Prasetyo on 08/07/23.
//

import SwiftUI

struct MultipleOptions: View {
    @State private var showingConfirmation = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .background(backgroundColor)
            .onTapGesture {
                showingConfirmation = true
            }
            .confirmationDialog("Change Background", isPresented: $showingConfirmation) {
                Button("Red") { backgroundColor = Color.red }
                Button("Green") { backgroundColor = Color.green }
                Button("Blue") { backgroundColor = Color.blue }
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Select a new color")
            }

    }
}

struct MultipleOptions_Previews: PreviewProvider {
    static var previews: some View {
        MultipleOptions()
    }
}
