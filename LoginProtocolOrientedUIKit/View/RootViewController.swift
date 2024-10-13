//
//  ViewController.swift
//  LoginProtocolOrientedUIKit
//
//  Created by Beyza Nur Tekerek on 12.10.2024.
//

import UIKit

class RootViewController: UIViewController, RootViewModelOutput {
    
    private let viewModel : RootViewModel

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .yellow
        viewModel.checkLogin()
    }
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showMainApp() {
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController, animated: true)
    }
    
    func showLogin() {
        let loginViewController = LoginViewController()
        navigationController?.present(loginViewController, animated: true)
    }


}

