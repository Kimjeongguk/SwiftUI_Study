//
//  Popup.swift
//  HelloWorld
//
//  Created by jeongguk on 12/13/23.
//

import SwiftUI

enum PopupStyle {
    case none
    case blur
    case dimmed
}

struct Popup<Message: View>: ViewModifier {
    
    let size: CGSize?
    let style: PopupStyle
    let message: Message
    
    init(size: CGSize? = nil, style: PopupStyle = .none, message: Message) {
        self.size = size
        self.style = style
        self.message = message
    }
    
    func body(content: Content) -> some View {
        content
            .blur(radius: style == .blur ? 2 : 0)
            .overlay(Rectangle()
                .fill(Color.black.opacity(style == .dimmed ? 0.4 : 0)))
            .overlay(popupContent)
    }
    
    private var popupContent: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 0) {
                self.message
                    .frame(width: self.size?.width ?? geometry.size.width * 0.6,
                           height: self.size?.height ?? geometry.size.height * 0.25)
                    .background(Color.primary.colorInvert())
                    .cornerRadius(12)
                    .shadow(color: .primaryShadow, radius: 15, x: 5, y: 5)
                    .overlay(self.checkCircleMark, alignment: .top)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // 부모 Geometry에 꽉 차도록
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2) // 중앙 정렬
        }
    }
    
    private var checkCircleMark: some View {
        Symbol("checkmark.circle.fill", color: .peach)
            .font(Font.system(size: 60).weight(.semibold))
            .background(Color.white.scaleEffect(0.8))
            .offset(x: 0, y: -30)
            
    }
}
