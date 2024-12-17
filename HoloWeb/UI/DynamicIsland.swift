//
//  DynamicIsland.swift
//  HoloWeb
//
//  Created by Alex on 16/12/2024.
//

import SwiftUI

struct DynamicIsland: View {
    var size: CGSize
    @Binding var isVisible: Bool
    @Binding var isArMode: Bool
    var width: CGFloat = 16

    var body: some View {
        
        HStack {

            Group {
                Button {
                    // Recording mode
                    withAnimation(.bouncy(duration: 0.3)) {
                        isArMode = false
                        isVisible = false
                    }
                } label: {
                    Image("record_btn")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(10)
                }

                Spacer()
                
                Button {
                    // Stereoscopic mode
                    withAnimation(.bouncy(duration: 0.3)) {
                        isArMode = false
                        isVisible = false
                    }
                } label: {
                    Image("mask")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .padding(10)
                }
                .offset(y: 20)

                Spacer()

                Button {
                    // Exit
                    withAnimation(.bouncy(duration: 0.3)) {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                            isArMode = false
                            isVisible = false
                        }
                    }
                } label: {
                    Image("door-exit")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.white)
                        .padding(10)
                }
                
            } /* Group */
            .opacity(isVisible ? 1.0 : 0.0)

        } /* HStack */
        .padding()
        .frame(
            width: isVisible ? size.width - 22 : 124 + width,
            height: isVisible ? 80 : 37.33 + width
        )
        .background(
            RoundedRectangle(cornerRadius: isVisible ? 50 : 18 + width/2, style: .continuous)
                .fill(isVisible ? .black : .white)
        )
        .offset(y: 11 - width/2)  // 14 for preview
        .onTapGesture {
            print("tapped!")
            isVisible.toggle()
        }
        .onLongPressGesture() {
            print("Long tapped!")
            isVisible.toggle()
        }
        
    }
}

#Preview {
    DynamicIsland(
        size: .init(width: 400, height: 150),
        isVisible: .constant(false),
        isArMode: .constant(false)
    )
    .frame(width: 300, height: 200)
    .background(.black)
    
    DynamicIsland(
        size: .init(width: 400, height: 150),
        isVisible: .constant(true),
        isArMode: .constant(false)
    )
    .frame(width: 300, height: 200)
    .background(.white)
}
