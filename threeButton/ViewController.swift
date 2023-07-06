//
//  ViewController.swift
//  threeButton
//
//  Created by Ekaterina Saveleva on 05.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - Private properties
    
    private lazy var firstButton: UIButton = {
        var firstButtonConfig = UIButton.Configuration.filled()
        firstButtonConfig.title = "firstButton"
        firstButtonConfig.image = UIImage(systemName: "arrow.forward.circle.fill")
        firstButtonConfig.imagePlacement = .trailing
        firstButtonConfig.imagePadding = 8
        firstButtonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        firstButtonConfig.cornerStyle = .medium
        let button = UIButton(configuration: firstButtonConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var secondButton: UIButton = {
        var secondButtonConfig = UIButton.Configuration.filled()
        secondButtonConfig.title = "secondButton"
        secondButtonConfig.image = UIImage(systemName: "arrow.forward.circle.fill")
        secondButtonConfig.imagePlacement = .trailing
        secondButtonConfig.imagePadding = 8
        secondButtonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        secondButtonConfig.cornerStyle = .medium
        let button = UIButton(configuration: secondButtonConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var third: UIButton = {
        var thirdButtonConfig = UIButton.Configuration.filled()
        thirdButtonConfig.title = "third"
        thirdButtonConfig.image = UIImage(systemName: "arrow.forward.circle.fill")
        thirdButtonConfig.imagePlacement = .trailing
        thirdButtonConfig.imagePadding = 8
        thirdButtonConfig.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        thirdButtonConfig.cornerStyle = .medium
        var button = UIButton(configuration: thirdButtonConfig)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapThirdButton), for: .touchUpInside)
//        button = CABasicAnimation(keyPath: "position")

        return button
    }()
    
    
    // MARK: - Lifecycles / Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupConstraints()
    }
    
    
    // MARK: - Public methods
    
    func shakeButtomButton() {
        let shake = CABasicAnimation(keyPath: "position")
        shake.duration = 0.1
        shake.repeatCount = 2
        shake.autoreverses = true
    }
    
    
    // MARK: - Private methods
    
    @objc
    private func cancelAction() {
        
    }
    
    @objc
    private func tapThirdButton () {
        let vc = SecondViewController()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .pageSheet
        present(vc, animated: true)
    }
    
    private func setupView() {
        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(third)
        firstButton.addTargetToButtonForAnimation()
        secondButton.addTargetToButtonForAnimation()
        third.addTargetToButtonForAnimation()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            firstButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 16),
            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            third.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 16),
            third.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        ])
    }
}


    
    // MARK: - UIButton

extension UIButton {
    func addTargetToButtonForAnimation() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }

    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.6, y: 0.6))
    }

    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }

    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 3,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: .curveEaseInOut,
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
}
