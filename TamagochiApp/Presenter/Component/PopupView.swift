//
//  PopupView.swift
//  TamagochiApp
//
//  Created by Carki on 2023/03/11.
//

import SwiftUI

struct PopupView: View {
    weak var navigation: UINavigationController?
    @StateObject var viewModel = PopupViewModel()
    
    var action: () -> ()
    
    var tamagochiImage: String
    var tamagochiName: String
    var tamagochiDetail: String
    
    var body: some View {
        ZStack(alignment: .center) {
            Color.black.opacity(0.7).ignoresSafeArea()
                .onTapGesture {
                    print("빈공간 눌림")
                    action()
                    print(viewModel.buttonDisabled)
                }
            VStack(alignment: .center, spacing: 20) {
                Image(tamagochiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                CustomText()
                    .setTitle(title: tamagochiName)
                    .setType(type: .just)
                
                Divider()
                    .background(Color.textColor)
                    .frame(height: 10)
                    .padding(.horizontal, 45)
                
                CustomText()
                    .setTitle(title: tamagochiDetail)
                    .setType(type: .detail)
                    .multilineTextAlignment(.center)
                    .frame(height: 100)
                
                VStack(spacing: 0) {
                    Divider()
                        .background(Color.textColor)
                        .frame(height: 3)
                        .frame(alignment: .top)
                    
                    HStack(spacing: 0) {
                        CustomButton()
                            .setType(type: .cancel)
                            .setTitle(title: "취소")
                            .click({
                                print("취소 눌림")
                                UserDefaultsHelper.setData(value: false, key: .gameStatus)
                                action()
                            })

                        CustomButton()
                            .setType(type: .ok)
                            .setTitle(title: "시작하기")
                            .click {
                                print("시작하기 눌림")
                                UserDefaultsHelper.setData(value: true, key: .gameStatus)
                                UserDefaultsHelper.setData(value: tamagochiImage, key: .tamagochiImage)
                                UserDefaultsHelper.setData(value: tamagochiName, key: .tamagochiName)
                                action()
                            }
                    }
                }
            }
            .padding(.top, 25)
            .background(Color.backgroundColor)
            .cornerRadius(15)
            .padding(25)
        }
    }
}

struct PopupView_Previews: PreviewProvider {
    static var previews: some View {
        PopupView(action: {
            
        },
                  tamagochiImage: "1-6",
                  tamagochiName: "방실방실 다마고치",
                  tamagochiDetail: "저는 방실방실 다마고치입니다.키는 100km\n몸무게는 150톤 이에용\n성격은 화끈하고 날라다닙니당~!\n열심히 잘 먹고 잘 클 자신은\n있답니당 방실방실")
        
    }
}
