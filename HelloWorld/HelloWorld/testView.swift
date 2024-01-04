//
//  testView.swift
//  HelloWorld
//
//  Created by jeongguk on 12/1/23.
//

import SwiftUI

struct testView: View {
    let  fruits = ["사과", "배", "포도", "바나나"]
    let drinks = ["물", "우유", "탄산수"]
    
    var body: some View {
//        let titles = ["Fruits", "Drinks"]
//        let data = [fruits, drinks]
//        return List {
//            ForEach(data.indices) { index in
//                Section(
//                    header: Text(titles[index])
//                        .font(.title),
//                    footer: HStack {
//                        Spacer();
//                        Text("\(data[index].count)건")
//                    }
//                ){
//                    ForEach(data[index], id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
//        }
        GeometryReader {_ in 
            VStack {
                Circle().fill(.purple)
                .frame(width: 200, height: 200)
                .overlay(Text("Center").font(.title))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background(.gray)
    }
}

#Preview {
    testView()
}
