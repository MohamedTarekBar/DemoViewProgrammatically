//
//  Layouts.swift
//  Test
//
//  Created by MohamedTarek on 17/12/2020.
//

import UIKit

struct layoutSpeed {
    var mainView: UIView
    
    enum TypeOfSpace {
        case multiplier
        case constant
    }
    
    enum XDirection {
        case top
        case bottom
    }
    enum YDirection {
        case trailing
        case leading
    }
    enum ZDirection {
        case height
        case width
    }
    
    init(view: UIView) {
        self.mainView = view
    }
    
    func constraintTop(top: UIView, direction: XDirection , space: CGFloat? = nil) {
        
        switch direction {
        case .top:
            
            if space != nil {
                NSLayoutConstraint.activate([
                    mainView.topAnchor.constraint(equalTo: top.safeAreaLayoutGuide.topAnchor,
                                                  constant: space!)
                ])
            } else {
                NSLayoutConstraint.activate([
                    mainView.topAnchor.constraint(equalTo: top.safeAreaLayoutGuide.topAnchor)
                ])
            }
        case .bottom:
            if space != nil {
                NSLayoutConstraint.activate([
                    mainView.topAnchor.constraint(equalTo: top.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: space!)
                ])
            }else {
                NSLayoutConstraint.activate([
                    mainView.topAnchor.constraint(equalTo: top.safeAreaLayoutGuide.bottomAnchor)
                ])
            }

        }
       
    }

    func constraintBottom(bottom: UIView, direction: XDirection , space: CGFloat? = nil) {
        switch direction {
        case .top:
            if space != nil {
                NSLayoutConstraint.activate([
                    mainView.bottomAnchor.constraint(equalTo: bottom.safeAreaLayoutGuide.topAnchor,
                                                  constant: space!)
                ])
            }else {
                NSLayoutConstraint.activate([
                    mainView.bottomAnchor.constraint(equalTo: bottom.safeAreaLayoutGuide.topAnchor)
                ])
            }
            
        case .bottom:
            if space != nil {
                NSLayoutConstraint.activate([
                    mainView.bottomAnchor.constraint(equalTo: bottom.safeAreaLayoutGuide.bottomAnchor,
                                                  constant: space!)
                ])
            }else {
                NSLayoutConstraint.activate([
                    mainView.bottomAnchor.constraint(equalTo: bottom.safeAreaLayoutGuide.bottomAnchor)
                ])
            }
            
        }
    }
    func constraintTrailing(trailing: UIView, direction: YDirection , space: CGFloat? = nil) {
        switch direction {
            case .trailing:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.trailingAnchor.constraint(equalTo: trailing.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.trailingAnchor.constraint(equalTo: trailing.safeAreaLayoutGuide.trailingAnchor)
                    ])
                }

            case .leading:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.trailingAnchor.constraint(equalTo: trailing.safeAreaLayoutGuide.leadingAnchor,
                                                      constant: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.trailingAnchor.constraint(equalTo: trailing.safeAreaLayoutGuide.leadingAnchor)
                    ])
                }
        }
    }
    func constraintLeading(leading: UIView, direction: YDirection , space: CGFloat! = nil) {
        switch direction {
        case .trailing:
            if space != nil {
                NSLayoutConstraint.activate([
                    mainView.leadingAnchor.constraint(equalTo: leading.safeAreaLayoutGuide.trailingAnchor,
                                                  constant: space)
                ])
            }else {
                NSLayoutConstraint.activate([
                    mainView.leadingAnchor.constraint(equalTo: leading.safeAreaLayoutGuide.trailingAnchor)
                ])
            }

        case .leading:
            if space != nil {
                NSLayoutConstraint.activate([
                    mainView.leadingAnchor.constraint(equalTo: leading.safeAreaLayoutGuide.leadingAnchor,
                                                  constant: space!)
                ])
            }else {
                NSLayoutConstraint.activate([
                    mainView.leadingAnchor.constraint(equalTo: leading.safeAreaLayoutGuide.leadingAnchor)
                ])
            }
        }
    }
    func constraintCenterX(centerX: UIView, space: CGFloat? = nil) {
        if space != nil {
            NSLayoutConstraint.activate([
                mainView.centerXAnchor.constraint(equalTo: centerX.safeAreaLayoutGuide.centerXAnchor,
                                              constant: space!)
            ])
        }else {
            NSLayoutConstraint.activate([
                mainView.centerXAnchor.constraint(equalTo: centerX.safeAreaLayoutGuide.centerXAnchor)
            ])
        }

    }
    func constraintCenterY(centerY: UIView, space: CGFloat? = nil) {
        if space != nil {
            NSLayoutConstraint.activate([
                mainView.centerYAnchor.constraint(equalTo: centerY.safeAreaLayoutGuide.centerYAnchor,
                                              constant: space!)
            ])
        }else {
            NSLayoutConstraint.activate([
                mainView.centerYAnchor.constraint(equalTo: centerY.safeAreaLayoutGuide.centerYAnchor)
            ])
        }

    }
    func constraintWidth(width: UIView, direction: ZDirection , space: CGFloat? = nil, type: TypeOfSpace) {
        if type == .constant {
            switch direction {
            case .height:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.widthAnchor.constraint(equalTo: width.safeAreaLayoutGuide.heightAnchor,
                                                            constant: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.widthAnchor.constraint(equalTo: width.safeAreaLayoutGuide.heightAnchor)
                    ])
                }

            case .width:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.widthAnchor.constraint(equalTo: width.safeAreaLayoutGuide.widthAnchor,
                                                        constant: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.widthAnchor.constraint(equalTo: width.safeAreaLayoutGuide.widthAnchor)
                    ])
                }

            }
        }else {

            switch direction {
            case .height:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.widthAnchor.constraint(equalTo: width.safeAreaLayoutGuide.heightAnchor,
                                                        multiplier: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.widthAnchor.constraint(equalTo: width.safeAreaLayoutGuide.heightAnchor)
                    ])
                }

            case .width:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.widthAnchor.constraint(equalTo: width.safeAreaLayoutGuide.widthAnchor,
                                                        multiplier: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.widthAnchor.constraint(equalTo: width.safeAreaLayoutGuide.widthAnchor)
                    ])
                }

            }
        }
    }
    
    func constraintHeight(height: UIView, direction: ZDirection , space: CGFloat? = nil, type: TypeOfSpace) {
        if type == .constant {
            switch direction {
            case .height:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.heightAnchor.constraint(equalTo: height.safeAreaLayoutGuide.heightAnchor,
                                                            constant: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.heightAnchor.constraint(equalTo: height.safeAreaLayoutGuide.heightAnchor)
                    ])
                }

            case .width:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.heightAnchor.constraint(equalTo: height.safeAreaLayoutGuide.widthAnchor,
                                                        constant: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.heightAnchor.constraint(equalTo: height.safeAreaLayoutGuide.widthAnchor)
                    ])
                }

            }
        }else {

            switch direction {
            case .height:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.heightAnchor.constraint(equalTo: height.safeAreaLayoutGuide.heightAnchor,
                                                        multiplier: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.heightAnchor.constraint(equalTo: height.safeAreaLayoutGuide.heightAnchor)
                    ])
                }

            case .width:
                if space != nil {
                    NSLayoutConstraint.activate([
                        mainView.heightAnchor.constraint(equalTo: height.safeAreaLayoutGuide.widthAnchor,
                                                        multiplier: space!)
                    ])
                }else {
                    NSLayoutConstraint.activate([
                        mainView.heightAnchor.constraint(equalTo: height.safeAreaLayoutGuide.widthAnchor)
                    ])
                }

            }
        }
    }
    
    func fullScreen(mainView:UIView, equalTO:UIView) {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: equalTO.topAnchor),
            mainView.bottomAnchor.constraint(equalTo: equalTO.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: equalTO.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: equalTO.trailingAnchor),
            mainView.centerYAnchor.constraint(equalTo: equalTO.centerYAnchor),
            mainView.centerXAnchor.constraint(equalTo: equalTO.centerXAnchor)
        ])
    }
    
    func center(equalTO:UIView) {
        NSLayoutConstraint.activate([
        mainView.centerYAnchor.constraint(equalTo: equalTO.centerYAnchor),
        mainView.centerXAnchor.constraint(equalTo: equalTO.centerXAnchor)
        ])
    }
}
