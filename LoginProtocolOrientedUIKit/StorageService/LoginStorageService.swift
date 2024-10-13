//
//  LoginStorageService.swift
//  LoginProtocolOrientedUIKit
//
//  Created by Beyza Nur Tekerek on 13.10.2024.
//

import Foundation

protocol LoginStorageService {
    var userAccesTokenKey: String { get }
    func setUserAccesToken(token: String)
    func getUserAccesToken() -> String?
}
