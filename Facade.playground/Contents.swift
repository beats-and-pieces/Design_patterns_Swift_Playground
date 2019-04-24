import UIKit
import CoreImage

class VintagePhotoMaker {
    func applyForImage(_ photo: UIImage) -> UIImage {
        let context = CIContext(options: nil)
        if let filter = CIFilter(name: "CISepiaTone") {
            let initialImage = CIImage(image: photo)
            filter.setValue(initialImage, forKey: kCIInputImageKey)
            filter.setValue(0.5, forKey: kCIInputIntensityKey)
            
            if let output = filter.outputImage {
                if let cgimg = context.createCGImage(output, from: output.extent) {
                    return UIImage(cgImage: cgimg)
                }
            }
        }
        return UIImage()
    }
}

let newAndBoringPhoto = UIImage()
let vintagePhotoMaker = VintagePhotoMaker()
let coolVintagePhoto = vintagePhotoMaker.applyForImage(newAndBoringPhoto)
