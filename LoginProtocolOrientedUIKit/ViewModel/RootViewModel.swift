//
//  RootViewModel.swift
//  LoginProtocolOrientedUIKit
//
//  Created by Beyza Nur Tekerek on 13.10.2024.
//

import Foundation

class RootViewModel {
    
    private let loginStorageService : LoginStorageService
    
    weak var output : RootViewModelOutput?
    
    init(loginStorageService: LoginStorageService) {
        self.loginStorageService = loginStorageService
    }
    
    func checkLogin() {
        if let accesToken = loginStorageService.getUserAccesToken() , !accesToken.isEmpty {
//            showMainApp()
            output?.showMainApp()
        } else {
//            showLogin()
            output?.showLogin()
        }
    }
    
}


