//
//  UIViewControllerSwiftUI.swift
//  Instafilter
//
//  Created by Fauzan Dwi Prasetyo on 08/07/23.
//

import SwiftUI

struct UIViewControllerSwiftUI: View {
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
            
            Button("Select Image") {
                showingImagePicker = true
            }
        }
        .sheet(isPresented: $showingImagePicker) {
            ImagePickerIntroduction(image: $inputImage)
        }
        .onChange(of: inputImage) { _ in loadImage() }
    }
    
    func loadImage() {
        guard let inputImage = self.inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct UIViewControllerSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerSwiftUI()
    }
}
