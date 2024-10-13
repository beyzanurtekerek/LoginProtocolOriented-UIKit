//
//  LoginProtocolOrientedUIKitTests.swift
//  LoginProtocolOrientedUIKitTests
//
//  Created by Beyza Nur Tekerek on 12.10.2024.
//

import XCTest
@testable import LoginProtocolOrientedUIKit

final class LoginProtocolOrientedUIKitTests: XCTestCase {

    
    private var viewModel : RootViewModel!
    private var loginStorageService : MockLoginStorageService!
    private var output : MockRootViewModelOutput!
    
    override func setUpWithError() throws {
        loginStorageService = MockLoginStorageService()
        viewModel = RootViewModel(loginStorageService: loginStorageService)
        output = MockRootViewModelOutput()
        
        viewModel.output = output
        
    }

    override func tearDownWithError() throws {
        viewModel = nil
        loginStorageService = nil
    }

    func testShowLogin_WhenLoginStorageReturnsEmptyUserAccessToken() throws {
        loginStorageService.storage = [:]
        viewModel.checkLogin()
        XCTAssertEqual(output.checkArray.first, .login)
    }
    
    func testShowLogin_WhenLoginStorageReturnsEmptyString() throws {
        loginStorageService.storage["ACCESS_TOKEN"] = ""
        viewModel.checkLogin()
        XCTAssertEqual(output.checkArray.first, .login)
    }
    
    func testShowMainApp_WhenLoginStorageReturnsUserAccessToken() throws {
        loginStorageService.storage["ACCESS_TOKEN"] = "123456789"
        viewModel.checkLogin()
        XCTAssertEqual(output.checkArray.first, .mainApp)
    }

}

class MockLoginStorageService : LoginStorageService {
    var userAccesTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    var storage : [String: String] = [:]
    
    func setUserAccesToken(token: String) {
        storage[userAccesTokenKey] = token
    }
    
    func getUserAccesToken() -> String? {
        return storage[userAccesTokenKey]
    }
}
    
class MockRootViewModelOutput : RootViewModelOutput {
    
    enum Check {
        case login
        case mainApp
    }
    
    var checkArray : [Check] = []
    
    func showLogin() {
        checkArray.append(.login)
    }
    
    func showMainApp() {
        checkArray.append(.mainApp)
    }
    
    
}
