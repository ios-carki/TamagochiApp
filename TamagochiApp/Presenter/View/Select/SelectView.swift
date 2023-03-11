//
//  SelectView.swift
//  TamagochiApp
//
//  Created by Carki on 2023/03/11.
//

import SwiftUI

struct SelectView: View {
    weak var navigation: UINavigationController?
    @StateObject var viewModel = SelectViewModel()
    
    let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 10, alignment: .center),
        GridItem(.flexible(), spacing: 10, alignment: .center),
        GridItem(.flexible(), spacing: 10, alignment: .center)
    ]
    
    var body: some View {
        ZStack {
            Color.backgroundColor.ignoresSafeArea()
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    alignment: .center,
                    spacing: 20) {
                    contentsLayer
                }
            }
            .padding(.horizontal, 10)
        }
        
        .navigationTitle("다마고치 선택하기")
    }
        
                
    var contentsLayer: some View {
        ForEach(0..<21, id: \.self) { index in
            if index < 3 {
                Tamagochi(tamagochiImage: viewModel.tamagochiImage[index], tamagochiName: viewModel.tamagochiName[index])
                    .onTapGesture {
                        print(index)
                        let vc = UIHostingController(rootView: PopupView(action: {
                            self.navigation?.dismiss(animated: false)
                        }, tamagochiImage: viewModel.tamagochiImage[index], tamagochiName: viewModel.tamagochiName[index], tamagochiDetail: viewModel.tamagochiDetail[index]))
                        vc.view.backgroundColor = UIColor.clear
                        vc.modalPresentationStyle = .overCurrentContext
                        self.navigation?.present(vc, animated: false)
                        
                    }
            } else {
                Tamagochi(tamagochiImage: viewModel.tamagochiImage[3], tamagochiName: viewModel.tamagochiName[3])
                    .onTapGesture {
                        print(index)
                    }
            }
        }
    }
                
}

struct SelectViewPreview: PreviewProvider {
    static var previews: some View {
        SelectView()
    }
}
