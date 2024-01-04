//
//  ViewsAndModifiers.swift
//  GuessTheFlag
//
//  Created by jeongguk on 1/3/24.
//

import SwiftUI

struct LayoutInfo {
    var color = Color.white
    var borderColor = Color.black
    var backgroundColor = Color.gray
    var weight = Font.Weight.bold
    var fontSize: CGFloat = 16.0
    var radius: CGFloat = 10.0
    var width: CGFloat = 100.0
    var height: CGFloat = 40.0
}

struct SampleButton: View {
    var text: String
    var action: () -> Void
    var s = LayoutInfo()
    var body: some View {
        Button(text, action: action)
            .font(.system(size: s.fontSize))
            .frame(width: s.width, height: s.height)
            .fontWeight(s.weight)
            .foregroundStyle(s.color)
            .background(s.backgroundColor)
            .border(s.borderColor, width: 4)
            .clipShape(.rect(cornerRadius: s.radius))
            
    }
}


struct CapsuleText: View {
    var text: String
    
    var body: some View {
        
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(.blue)
            .clipShape(.capsule)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        modifier(Watermark(text: text))
    }
}

struct ViewsAndModifiers: View {
   
    var body: some View {
        Color.blue
            .frame(width: 300, height: 200)
            .watermarked(with: "Hacking with Swift")
    }
    
    func sample() {
        
    }
}


#Preview {
    ViewsAndModifiers()
}
