//
//  ViewController.swift
//  Test
//
//  Created by MohamedTarek on 14/12/2020.
//

import UIKit

class MainVC: UIViewController, MainVCProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        // hide navigation
        self.navigationController?.isNavigationBarHidden = true
        view = outletView
        outletView.delegate = self
    }
    
    lazy var outletView: MainView = {
        let view = MainView(frame: self.view.frame)
        return view
    }()
    
    func loginButtonTapped() {
            print("login")
    }
    
    func registerButtonTapped() {
            print("register")
    }
}

