//
//  MainView.swift
//  TamagochiApp
//
//  Created by Carki on 2023/03/14.
//

import SwiftUI

struct MainView: View {
    weak var navigation: UINavigationController?
    
    var body: some View {
        VStack(spacing: 20) {
            CustomText()
                .setTitle(title: "다마고치 이미지 번호: \(UserDefaultsHelper.getData(type: String.self, forKey: .tamagochiImage))")
            
            CustomText()
                .setTitle(title: "다마고치 이름: \(UserDefaultsHelper.getData(type: String.self, forKey: .tamagochiName))")
            
        }
        .navigationTitle("대장님의 다마고치")
        .navigationBarBackButtonHidden(true)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
