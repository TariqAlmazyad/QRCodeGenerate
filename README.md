# QRCodeGenerate for iOS, iPadOS, and MacOS

QRCodeGenerate is a QRCode generater to generate qrCode as image in iOS + iPadOS , and NSImage in MacOS, with full freedom of passing any codable object , and changing backgroundColor , QRCode color. 


```swift
.package(url: "https://github.com/TariqAlmazyad/QRCodeGenerate.git")
```


## for iOS and iPadOS

<img width="1745" alt="Screen Shot 2021-05-28 at 10 09 14 PM" src="https://user-images.githubusercontent.com/34104180/120038144-75e44700-c00b-11eb-95df-6423789c3b37.png">



## Code example below

```swift

import SwiftUI
import QRCodeGenerate

struct PhoneView: View {
    @State private (set) var user = User(email: "sample@gmail.com", name: "username")
    var body: some View {
        #if os(iOS) || os(watchOS) || os(tvOS)
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 200, maximum: 240))
        ], alignment: .center, content: {
            Image(uiImage: .generateQRCode(from: user, backgroundColor: .white,
                                           QRCodeColor: CIColor(color: UIColor(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))))))
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 200, height: 200)
            
            Image(uiImage: .generateQRCode(from: user, backgroundColor: .white,
                                           QRCodeColor: CIColor(color: UIColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))))))
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 200, height: 200)
            Image(uiImage: .generateQRCode(from: user, backgroundColor: .white,
                                           QRCodeColor: CIColor(color: UIColor(Color(#colorLiteral(red: 0.1411764706, green: 0.0431372549, blue: 0.2117647059, alpha: 1))))))
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 200, height: 200)
            
            Image(uiImage: .generateQRCode(from: user, backgroundColor: .white,
                                           QRCodeColor: CIColor(color: UIColor(Color(#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))))))
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 200, height: 200)
        })
        #endif
    }
}

```


## for MacOS
There are some extra steps for MacOS . 
Here is the steps below:

<img width="1775" alt="Screen Shot 2021-05-28 at 11 32 50 PM" src="https://user-images.githubusercontent.com/34104180/120039309-5cdc9580-c00d-11eb-8dc3-a454108a2cef.png">


and then you can import the library

<img width="1751" alt="Screen Shot 2021-05-28 at 10 15 21 PM" src="https://user-images.githubusercontent.com/34104180/120038587-2eaa8600-c00c-11eb-903b-e3ff02412521.png">


## Code example below

```swift

import QRCodeGenerate
struct MacOSView: View {
    @State private (set) var user = User(email: "sample@gmail.com", name: "username")
    var body: some View {
        #if os(macOS)
        
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 500, maximum: 640))
        ], alignment: .center, content: {
            Image(nsImage: .generateQRCode(from: user, backgroundColor: .white,
                                           QRCodeColor: CIColor(cgColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))))
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 400, height: 400)
            
            Image(nsImage: .generateQRCode(from: user, backgroundColor: .white,
                                           QRCodeColor: CIColor(cgColor: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1))))
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 400, height: 400)
            Image(nsImage: .generateQRCode(from: user, backgroundColor: .white,
                                           QRCodeColor: CIColor(cgColor: #colorLiteral(red: 0.1411764706, green: 0.0431372549, blue: 0.2117647059, alpha: 1))))
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 400, height: 400)

            Image(nsImage: .generateQRCode(from: user, backgroundColor: .white,
                                           QRCodeColor: CIColor(cgColor: #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1))))
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .frame(width: 400, height: 400)
        })
        #endif
    }
}
```

## With custom logo for (iOS/ iPadOS)

<img width="891" alt="Screen Shot 2021-06-20 at 1 17 14 PM" src="https://user-images.githubusercontent.com/34104180/122670324-29cf9100-d1ca-11eb-8425-6907711d4434.png">


```swift

import SwiftUI
import QRCodeGenerate

struct PhoneView: View {
    @State private (set) var user = User(email: "sample@gmail.com",
                                         name: "username")

    var body: some View {
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 200, maximum: 240))
        ], alignment: .center, content: {
            generateQRCode(from: user, backgroundColor: .black, QRCodeColor: .white,
                           qrCodeSize: 200,logo: Image("logo"), logoSize: 60)
                
            generateQRCode(from: user, backgroundColor: .black, QRCodeColor: .cyan,
                           qrCodeSize: 200 ,logo: Image("linkedin"), logoSize: 60)
            
            generateQRCode(from: user, backgroundColor: .black, QRCodeColor: .gray,
                           qrCodeSize: 200 ,logo: Image("twitter"), logoSize: 60)
            
            generateQRCode(from: user, backgroundColor: .black, QRCodeColor: .white,
                           qrCodeSize: 200 ,logo: Image("xcode"), logoSize: 60)
                
        })
    }
}

```


