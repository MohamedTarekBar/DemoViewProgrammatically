//
//  MainView.swift
//  Test
//
//  Created by MohamedTarek on 16/12/2020.
//

import UIKit

@objc protocol MainVCProtocol: class {
    func loginButtonTapped()
    func registerButtonTapped()
}

class MainView: UIView {
    
    weak var delegate: MainVCProtocol!
    
    private lazy var background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = AppColor.background
        return view
    }()
    
    private lazy var topScreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return view
    }()
    
    private lazy var bottomScreen: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

        return view
    }()
    // top
    private lazy var topScreenLabelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var topScreenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "If you already have account,"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var topScreenbuttonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var topScreenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.layer.cornerRadius = 5
        button.addTarget(delegate, action: #selector(delegate.loginButtonTapped), for: .touchUpInside)
        return button
    }()
    // botttom
    
    private lazy var bottomScreenLabelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var bottomScreenLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Create account now,"
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var bottomScreenbuttonContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomScreenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(delegate, action: #selector(delegate.registerButtonTapped), for: .touchUpInside)
        return button
    }()


    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupBackground() {
        let backgroundLayout = layoutSpeed(view: background)
        backgroundLayout.fullScreen(mainView: background,equalTO: self)
    }
    
    func setupTopScreen() {

        // top screen View
        let viewLayout = layoutSpeed(view: topScreen)
        viewLayout.constraintTop(top: background, direction: .top)
        viewLayout.constraintLeading(leading: background, direction: .leading)
        viewLayout.constraintTrailing(trailing: background, direction: .trailing)
        viewLayout.constraintHeight(height: background, direction: .height,space: 1/2, type: .multiplier)
        
        // top screen label Container
        let labelContainerLayout = layoutSpeed(view: topScreenLabelContainer)
        labelContainerLayout.constraintTop(top: topScreen, direction: .top)
        labelContainerLayout.constraintLeading(leading: topScreen, direction: .leading)
        labelContainerLayout.constraintTrailing(trailing: topScreen, direction: .trailing)
        labelContainerLayout.constraintHeight(height: topScreen, direction: .height,space: 1/2, type: .multiplier)
        labelContainerLayout.constraintBottom(bottom: topScreenbuttonContainer, direction: .top)
        
        // top screen Label
        let labelLayout = layoutSpeed(view: topScreenLabel)
        labelLayout.constraintWidth(width: topScreenbuttonContainer, direction: .width, space: 1, type: .multiplier)
        labelLayout.constraintBottom(bottom: topScreenbuttonContainer, direction: .top,space: 20)
        labelLayout.constraintHeight(height: topScreenLabelContainer, direction: .height, space: 0.30, type: .multiplier)
        
        // top screen button container
        
        let buttonContainerLayout = layoutSpeed(view: topScreenbuttonContainer)
        buttonContainerLayout.constraintTop(top: topScreenLabelContainer, direction: .bottom)
        buttonContainerLayout.constraintLeading(leading: topScreen, direction: .leading)
        buttonContainerLayout.constraintTrailing(trailing: topScreen, direction: .trailing)
        buttonContainerLayout.constraintBottom(bottom: topScreen, direction: .bottom)
        
        // top screen button
        
        let buttonLayout = layoutSpeed(view: topScreenButton)
        buttonLayout.constraintWidth(width: topScreenbuttonContainer, direction: .width, space: 0.7, type: .multiplier)
        buttonLayout.constraintCenterX(centerX: topScreenbuttonContainer)
        buttonLayout.constraintCenterY(centerY: topScreenbuttonContainer)
        buttonLayout.constraintHeight(height: topScreenbuttonContainer, direction: .height, space: 0.30, type: .multiplier)
    }
    func setupBottomScreen() {
        // bottom screen View
        let viewLayout = layoutSpeed(view: bottomScreen)
        viewLayout.constraintTop(top: topScreen, direction: .bottom)
        viewLayout.constraintLeading(leading: background, direction: .leading)
        viewLayout.constraintTrailing(trailing: background, direction: .trailing)
        viewLayout.constraintBottom(bottom: background, direction: .bottom)
        
        // bottom screen label Container
        let labelContainerLayout = layoutSpeed(view: bottomScreenLabelContainer)
        labelContainerLayout.constraintTop(top: bottomScreen, direction: .top)
        labelContainerLayout.constraintLeading(leading: bottomScreen, direction: .leading)
        labelContainerLayout.constraintTrailing(trailing: bottomScreen, direction: .trailing)
        labelContainerLayout.constraintHeight(height: bottomScreen, direction: .height,space: 1/2, type: .multiplier)
        labelContainerLayout.constraintBottom(bottom: bottomScreenbuttonContainer, direction: .top)
        
        // bottom screen Label
        let labelLayout = layoutSpeed(view: bottomScreenLabel)
        labelLayout.constraintWidth(width: bottomScreenbuttonContainer, direction: .width, space: 1, type: .multiplier)
        labelLayout.constraintBottom(bottom: bottomScreenbuttonContainer, direction: .top,space: 20)
        labelLayout.constraintHeight(height: bottomScreenLabelContainer, direction: .height, space: 0.30, type: .multiplier)
        
        // bottom screen button container
        
        let buttonContainerLayout = layoutSpeed(view: bottomScreenbuttonContainer)
        buttonContainerLayout.constraintTop(top: bottomScreenLabelContainer, direction: .bottom)
        buttonContainerLayout.constraintLeading(leading: bottomScreen, direction: .leading)
        buttonContainerLayout.constraintTrailing(trailing: bottomScreen, direction: .trailing)
        buttonContainerLayout.constraintBottom(bottom: bottomScreen, direction: .bottom)
        
        // bottom screen button
        
        let buttonLayout = layoutSpeed(view: bottomScreenButton)
        buttonLayout.constraintWidth(width: bottomScreenbuttonContainer, direction: .width, space: 0.7, type: .multiplier)
        buttonLayout.constraintCenterX(centerX: bottomScreenbuttonContainer)
        buttonLayout.constraintCenterY(centerY: bottomScreenbuttonContainer)
        buttonLayout.constraintHeight(height: bottomScreenbuttonContainer, direction: .height, space: 0.30, type: .multiplier)
    }
    
    func addSubview() {
        // make sence hierarchy
        addSubview(background)
        background.addSubview(topScreen)
            topScreen.addSubview(topScreenLabelContainer)
            topScreen.addSubview(topScreenLabel)
            topScreen.addSubview(topScreenbuttonContainer)
            topScreen.addSubview(topScreenButton)
        background.addSubview(bottomScreen)
            bottomScreen.addSubview(bottomScreenLabelContainer)
            bottomScreen.addSubview(bottomScreenLabel)
            bottomScreen.addSubview(bottomScreenbuttonContainer)
            bottomScreen.addSubview(bottomScreenButton)
    }
    
    func layoutUI() {
        addSubview()
        setupBackground()
        setupTopScreen()
        setupBottomScreen()
    }
}
