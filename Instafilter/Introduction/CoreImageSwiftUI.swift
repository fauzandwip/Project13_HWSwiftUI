//
//  CoreImageSwiftUI.swift
//  Instafilter
//
//  Created by Fauzan Dwi Prasetyo on 08/07/23.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct CoreImageSwiftUI: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    func loadImage() {
        guard let inputImage = UIImage(named: "airport") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        
        // MARK: - Modern API
//        let currentFilter = CIFilter.sepiaTone()
//        currentFilter.inputImage = beginImage
//        currentFilter.intensity = 1
        
//        let currentFilter = CIFilter.pixellate()
//        currentFilter.inputImage = beginImage
//        currentFilter.scale = 100

//        let currentFilter = CIFilter.crystallize()
//        currentFilter.inputImage = beginImage
//        currentFilter.radius = 200
        
        let currentFilter = CIFilter.twirlDistortion()
        currentFilter.inputImage = beginImage
        currentFilter.radius = 1000
        currentFilter.center = CGPoint(x: inputImage.size.width / 2, y: inputImage.size.height / 2)

        // MARK: - Old API
//        let currentFilter = CIFilter.twirlDistortion()
//        currentFilter.inputImage = beginImage
//
//        let amount = 1.0
//        let inputKeys = currentFilter.inputKeys
//
//        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(amount, forKey: kCIInputIntensityKey)}
//        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(amount * 200, forKey: kCIInputRadiusKey)}
//        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(amount * 10, forKey: kCIInputScaleKey)}
        
        // get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgImg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImg = UIImage(cgImage: cgImg)
            image = Image(uiImage: uiImg)
        }
        
    }
}

struct CoreImageSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        CoreImageSwiftUI()
    }
}
