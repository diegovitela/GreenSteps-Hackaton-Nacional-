//
//  CustomSceneView.swift
//  Profile
//
//  Created by Jp on 23/04/24.
//

import Foundation
import SwiftUI
import SceneKit

struct CustomSceneView: UIViewRepresentable{
    @Binding var scene: SCNScene?
    func makeUIView(context: Context) -> SCNView {
        let view = SCNView()
        view.allowsCameraControl = true
        view.autoenablesDefaultLighting = true
        view.antialiasingMode = .multisampling2X
        view.scene = scene
        view.backgroundColor = .clear
        
        
        
        return view
        
    }
    func updateUIView(_ uiView: SCNView, context: Context) {
        
    }
    
}
