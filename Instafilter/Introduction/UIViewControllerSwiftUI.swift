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
            .buttonIndigoStyle(disable: false)
            
            Button("Save Image") {
                guard let inputImage = self.inputImage else { return }
                
                let imageSaver = ImageSaver()
                imageSaver.writeToPhotoAlbum(image: inputImage)
            }
            .buttonIndigoStyle(disable: false)
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

struct ButtonIndigoStyle: ViewModifier {
    var disable: Bool
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(disable ? .white.opacity(0.8) : .white)
            .padding()
            .background(disable ? Color.secondary.opacity(0.5) : Color.indigo)
            .clipShape(Capsule())
    }
}

extension Button {
    func buttonIndigoStyle(disable: Bool) -> some View {
        modifier(ButtonIndigoStyle(disable: disable))
    }
}
struct UIViewControllerSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UIViewControllerSwiftUI()
    }
}
