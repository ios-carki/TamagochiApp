//
//  SelectView.swift
//  TamagochiApp
//
//  Created by Carki on 2023/03/11.
//

import SwiftUI

import AlertToast

struct SelectView: View {
    weak var navigation: UINavigationController?
    @StateObject var viewModel: SelectViewModel
    
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
        .toast(isPresenting: $viewModel.showToast) {
            AlertToast(displayMode: .banner(.pop), type: .error(.red), title: "준비중입니다.")
        }
    }
        
                
    var contentsLayer: some View {
        ForEach(0..<21, id: \.self) { index in
            if index < 3 {
                Tamagochi(tamagochiImage: viewModel.tamagochiImage[index], tamagochiName: viewModel.tamagochiName[index])
                    .onTapGesture {
                        print(index)
                        let vc = UIHostingController(rootView: PopupView(action: {
                            self.navigation?.dismiss(animated: false)
                            
                            //취소버튼을 누를때 - cancel
                            if UserDefaultsHelper.getData(type: Bool.self, forKey: .gameStatus) == false {
                                print("취소버튼 눌림")
                            } else {
                                print("시작버튼 눌림")
                                navigation?.viewControllers = [UIHostingController(rootView: SelectView(navigation: navigation, viewModel: viewModel))]
                                navigation?.pushViewController(UIHostingController(rootView: MainView(navigation: navigation)), animated: true)
                            }
                            
//                            if viewModel.type == .main {
//                                navigation?.viewControllers = [UIHostingController(rootView: SelectView(navigation: navigation, viewModel: SelectViewModel(type: .sub)))]
//                                navigation?.pushViewController(UIHostingController(rootView: MainView(navigation: navigation)), animated: true)
//                            } else if viewModel.type == .sub {
//                                navigation?.viewControllers = [UIHostingController(rootView: SelectView(navigation: navigation, viewModel: SelectViewModel(type: .main)))]
//                                navigation?.pushViewController(UIHostingController(rootView: MainView(navigation: navigation)), animated: true)
//                            }
                        }, tamagochiImage: viewModel.tamagochiImage[index], tamagochiName: viewModel.tamagochiName[index], tamagochiDetail: viewModel.tamagochiDetail[index]))
                        vc.view.backgroundColor = UIColor.clear
                        vc.modalPresentationStyle = .overCurrentContext
                        self.navigation?.present(vc, animated: false)
                    }
            } else {
                Tamagochi(tamagochiImage: viewModel.tamagochiImage[3], tamagochiName: viewModel.tamagochiName[3])
                    .onTapGesture {
                        print(index)
                        viewModel.showToast = true
                    }
            }
        }
    }
                
}

struct SelectViewPreview: PreviewProvider {
    static var previews: some View {
        SelectView(viewModel: SelectViewModel())
    }
}
