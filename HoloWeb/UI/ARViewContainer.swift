//
//  ARViewContainer.swift
//  HoloWeb
//
//  Created by Alex on 16/12/2024.
//

import SwiftUI
import RealityKit
import ARKit

struct ARViewContainer: UIViewRepresentable {
    typealias UIViewType = ARView

    func makeUIView(context: Context) -> UIViewType {
        let arView = ARView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
        
        let configuration = ARWorldTrackingConfiguration()
        arView.session.delegate = context.coordinator
        arView.session.run(configuration)

        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("updateUIView()")
    }
    
    func makeCoordinator() -> ARSessionDelegateCoordinator {
        return ARSessionDelegateCoordinator()
    }

}
