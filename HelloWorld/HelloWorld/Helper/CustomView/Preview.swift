//
//  Preview.swift
//  HelloWorld
//
//  Created by jeongguk on 12/5/23.
//

import SwiftUI

struct Preview<V: View>: View {
    enum Device: String, CaseIterable {
        case iPhone8 = "iPhone 8"
        case iPhone11 = "iPhone 11"
        case iPhone13 = "iPhone 13"
        case iPhone15 = "iPhone 15"
    }
    
    let source: V
    var devices: [Device] = [.iPhone11, .iPhone13, .iPhone8]
    var displayDarkMode: Bool = true
    
    var body: some View {
        Group {
            ForEach(devices, id: \.self) {
                self.previewSource(device: $0)
            }
            if !devices.isEmpty && displayDarkMode {
                self.previewSource(device: devices[0])
                    .preferredColorScheme(.dark)
                }
            }
        }
    
    private func previewSource(device: Device) -> some View {
        source
            .previewDevice(PreviewDevice(rawValue: device.rawValue))
            .previewDisplayName(device.rawValue)
    }
}

struct Preview_Previews: PreviewProvider {
    static var previews: some View {
        Preview(source: Text("Hello, SwiftUI!"))
    }
}

#Preview {
    Preview(source: Text("Hello, SwiftUI!"))
}
