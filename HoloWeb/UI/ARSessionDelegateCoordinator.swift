//
//  ARSessionDelegateCoordinator.swift
//  HoloWeb
//
//  Created by Alex on 16/12/2024.
//

import ARKit

class ARSessionDelegateCoordinator: NSObject, ARSessionDelegate {
    
    private let tag = String(repeating: "=", count: 3)

    // MARK: ARSessionDelegate protocol
    // Provides a newly captured camera image and accompanying AR information to the delegate.
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
    }
    
    // Tells the delegate that one or more anchors have been added to the session.
    func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
    }
    
    // Tells the delegate that the session has adjusted the properties of one or more anchors.
    func session(_ session: ARSession, didUpdate anchors: [ARAnchor]) {
    }

    // Tells the delegate that one or more anchors have been removed from the session.
    func session(_ session: ARSession, didRemove anchors: [ARAnchor]) {
    }

    
    // MARK: ARSessionObserver protocol
    // Informs the delegate of changes to the quality of ARKit's device position tracking.
    func session(_ session: ARSession, cameraDidChangeTrackingState camera: ARCamera) {
    }
    
    // Listen and react to geo-tracking state changes.
    func session(_ session: ARSession, didChange geoTrackingStatus: ARGeoTrackingStatus) {
        print("\(tag) session(): geo-tracking state changes")
    }

    // Tells the delegate that the session has stopped running due to an error.
    func session(_ session: ARSession, didFailWithError error: Error) {
    }
    
    // Tells the delegate that the session has temporarily stopped processing frames and tracking device position.
    func sessionWasInterrupted(_ session: ARSession) {
        print("\(tag) sessionWasInterrupted(): the session has temporarily stopped processing frames and tracking device position")
    }

    // Tells the delegate that the session has resumed processing frames and tracking device position.
    func sessionInterruptionEnded(_ session: ARSession) {
        print("\(tag) sessionInterruptionEnded(): the session has resumed processing frames and tracking device position")
    }

    // Asks the delegate whether to attempt recovery of world-tracking state after an interruption.
    func sessionShouldAttemptRelocalization(_ session: ARSession) -> Bool {
        print("\(tag) sessionShouldAttemptRelocalization(): attempt recovery of world-tracking state after an interruption")
        return true
    }

}
