import SwiftUI
import CoreImage.CIFilterBuiltins

#if os(iOS) || os(watchOS) || os(tvOS)
@available(iOS 14.0, *)
extension UIImage {
    /// to generate QRCode by passing any object that confirms to Codable protocol
    /// - Parameters:
    ///   - anyCodableObject: Any object that confirms to Codable protocol
    ///   - backgroundColor: the background of the QRCode
    ///   - QRCodeColor: the outer color of QRCode
    /// - Returns: UIImage
    static func generateQRCode<T: Codable>(from anyCodableObject: T,
                                           backgroundColor: CIColor = .clear,
                                           QRCodeColor: CIColor = .white) -> UIImage {
        let context = CIContext()
        let filter = CIFilter.qrCodeGenerator()
        guard let colorFilter: CIFilter = CIFilter(name: "CIFalseColor") else {return UIImage()}
        do {
            let data = try JSONEncoder().encode(anyCodableObject)
            filter.setValue(data, forKey: "inputMessage")
            colorFilter.setValue(filter.outputImage, forKey: "inputImage")
            colorFilter.setValue(QRCodeColor, forKey: "inputColor0")
            colorFilter.setValue(backgroundColor, forKey: "inputColor1")
            if let outputImage = colorFilter.outputImage {
                if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                    return UIImage(cgImage: cgimg)
                }
            }
        } catch (let error) {
            print(error.localizedDescription)
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
#elseif os(macOS)
@available(macOS 11.00, *)
extension NSImage {
    /// to generate QRCode by passing any object that confirms to Codable protocol
    /// - Parameters:
    ///   - anyCodableObject: Any object that confirms to Codable protocol
    ///   - backgroundColor: the background of the QRCode
    ///   - QRCodeColor: the outer color of QRCode
    /// - Returns: NSImage
    static func generateQRCode<T: Codable>(from anyCodableObject: T, backgroundColor: CIColor, QRCodeColor: CIColor) -> NSImage {
        do {
            // Convert String to Data
            let data = try JSONEncoder().encode(anyCodableObject)
            
            // Create CIFilter object for CIQRCodeGenerator
            guard let qrCodeFilter: CIFilter = CIFilter(name: "CIQRCodeGenerator") else { return NSImage(systemSymbolName: "xmark.octagon.fill", accessibilityDescription: nil) ?? NSImage() }
            
            // Set the inputMessage for the codeData
            qrCodeFilter.setValue(data, forKey: "inputMessage")
            
            // Create another CIFilter for setting foreground and background color
            guard let colorFilter = CIFilter(name: "CIFalseColor") else { return NSImage(systemSymbolName: "xmark.octagon.fill", accessibilityDescription: nil) ?? NSImage() }
            colorFilter.setValue(qrCodeFilter.outputImage, forKey: "inputImage")
            colorFilter.setValue(backgroundColor, forKey: "inputColor1") // Background color
            colorFilter.setValue(QRCodeColor, forKey: "inputColor0") // Foreground color
            
            // Create an affine transformation for scaling the generated image
            let transform = CGAffineTransform(scaleX: 10, y: 10)
            if let output = colorFilter.outputImage?.transformed(by: transform) {
                let rep = NSCIImageRep.init(ciImage: output)
                let nsImage = NSImage(size: output.extent.size)
                nsImage.addRepresentation(rep)
                // Return the created image
                return nsImage
            }
        } catch {
            print(error.localizedDescription)
        }
        return NSImage(systemSymbolName: "xmark.octagon.fill", accessibilityDescription: nil) ?? NSImage()
    }
}
#endif
