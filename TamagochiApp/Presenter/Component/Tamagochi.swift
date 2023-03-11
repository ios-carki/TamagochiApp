//
//  Tamagochi.swift
//  TamagochiApp
//
//  Created by Carki on 2023/03/11.
//

import SwiftUI

struct Tamagochi: View {
    let tamagochiImage: String
    let tamagochiName: String
    
    var body: some View {
        VStack(alignment: .center) {
            Image(tamagochiImage)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay{Circle().stroke(Color.textColor, lineWidth: 2)}
                .padding(.horizontal, 10)
                .padding(.vertical, 8)
            
            CustomText()
                .setTitle(title: tamagochiName)
                .setType(type: .just)
            
        }
        .frame(maxWidth: .infinity)
        .background(Color.clear)
    }
}

struct TamagochiPreview: PreviewProvider {
    static var previews: some View {
        Tamagochi(tamagochiImage: "star.fill", tamagochiName: "따끔따끔 다마고치")
    }
}
