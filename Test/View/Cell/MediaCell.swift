//
//  HeaderCell.swift
//  Test
//
//  Created by MohamedTarek on 22/12/2020.
//

import UIKit
import ViewAnimator

class MediaCell: UICollectionViewCell {

    private lazy var background: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.masksToBounds  = true
        return view
    }()
    
    lazy var topBar: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .gray
       return view
    }()

    lazy var bottomBar: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
       return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "man")
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name Of Movie"
        label.textColor = .white
        return label
    }()
    
    
    lazy var button :UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.actions, for: .normal)
        button.imageView?.tintColor = .red
        button.backgroundColor = .red
        button.titleLabel?.textColor = .white
        button.layer.masksToBounds = false
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 25
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        Rotate.listenRotateLandscabe(self, selector: #selector(isLandscabe))
        Rotate.listenRotatePortrait(self, selector: #selector(isPortrait))

        addSubViews()
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func setupView() {
        let layoutGuide = contentView.layoutMarginsGuide
        // for background
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: layoutGuide.topAnchor),
            background.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: layoutGuide.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: layoutGuide.trailingAnchor),
        ])
        
        // for tob bar
        NSLayoutConstraint.activate([
            topBar.topAnchor.constraint(equalTo: background.topAnchor),
            topBar.leadingAnchor.constraint(equalTo:background.leadingAnchor),
            topBar.trailingAnchor.constraint(equalTo:background.trailingAnchor),
            topBar.heightAnchor.constraint(equalToConstant: 80),
            topBar.bottomAnchor.constraint(equalTo: bottomBar.topAnchor)
        ])
        
        // for stack in top bar
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topBar.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: topBar.leadingAnchor,constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: topBar.trailingAnchor,constant:  -20),
            nameLabel.bottomAnchor.constraint(equalTo: topBar.bottomAnchor)
        ])
        
        // for bottom bar
        NSLayoutConstraint.activate([
            bottomBar.topAnchor.constraint(equalTo: topBar.bottomAnchor),
            bottomBar.leadingAnchor.constraint(equalTo: background.leadingAnchor),
            bottomBar.trailingAnchor.constraint(equalTo: background.trailingAnchor),
            bottomBar.bottomAnchor.constraint(equalTo: background.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: bottomBar.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: bottomBar.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: bottomBar.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomBar.bottomAnchor)
        ])
        
        // for button
        NSLayoutConstraint.activate([
            button.trailingAnchor.constraint(equalTo: background.trailingAnchor,constant: -10),
            button.bottomAnchor.constraint(equalTo: background.bottomAnchor, constant: -10),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func isLandscabe() {
        
    }
    
    @objc func isPortrait() {
        
    }

    func addSubViews() {
        self.addSubview(background)
        background.addSubview(topBar)
            topBar.addSubview(nameLabel)
        background.addSubview(bottomBar)
            bottomBar.addSubview(imageView)
        background.addSubview(button)
    }
}
