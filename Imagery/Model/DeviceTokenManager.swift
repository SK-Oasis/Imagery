//
//  DeviceTokenManager.swift
//  Imagery
//
//  Created by Jun on 2023/09/16.
//

import SwiftUI

class DeviceTokenManager: ObservableObject {
    // 싱글톤 인스턴스
    static let shared = DeviceTokenManager()

    // 디바이스 토큰을 저장할 프로퍼티
    @Published var deviceToken: String?

    private init() {
        // 이곳에서 디바이스 토큰을 초기화 또는 업데이트하는 로직을 추가할 수 있습니다.
        // 주의: 실제 디바이스 토큰을 받아오는 로직은 AppDelegate 또는 SceneDelegate에서 수행해야 합니다.
        // 아래는 가상의 예시입니다.
        
        // 디바이스 토큰을 받아온다고 가정하고 설정
        self.getDeviceToken()
    }
    
    
    private func getDeviceToken() {
        let deviceToken = UIDevice.current.identifierForVendor?.uuidString
        self.deviceToken = deviceToken
    }
}
