//
//  LoginStorageServiceImpl.swift
//  LoginProtocolOrientedUIKit
//
//  Created by Beyza Nur Tekerek on 13.10.2024.
//

import Foundation

class LoginStorageServiceImpl : LoginStorageService {
    
    private let storage = UserDefaults.standard
    
    var userAccesTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    func setUserAccesToken(token: String) {
        storage.set(token, forKey: userAccesTokenKey)
    }
    
    func getUserAccesToken() -> String? {
        return storage.string(forKey: userAccesTokenKey)
    }
}
