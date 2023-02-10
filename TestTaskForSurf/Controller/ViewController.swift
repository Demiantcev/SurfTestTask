//
//  ViewController.swift
//  TestTaskForSurf
//
//  Created by Кирилл Демьянцев on 07.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let firstCollectionView = FirstHorizontalView()
    let secondCollectionView = SecondHorizontalView()
    
    let scrollContent: UIScrollView = {
        var scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.bounces = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    let mainView: UIView = {
        var view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 40
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    let myImage: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let nameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 25, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    let firstLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.6078431373, green: 0.5843137255, blue: 0.5882352941, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    let secondLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.6078431373, green: 0.5843137255, blue: 0.5882352941, alpha: 1)
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    let thirdLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.6078431373, green: 0.5843137255, blue: 0.5882352941, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    lazy var alertButton: UIButton = {
        var button = UIButton(type: .roundedRect)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Отправить заявку", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
        button.layer.cornerRadius = 30
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstraint()
        setup(surfScreen)
    }
    // MARK: - Constraints
    func setupConstraint() {
        
        view.addSubview(myImage)
        view.addSubview(scrollContent)
        scrollContent.addSubview(mainView)
        mainView.addSubview(nameLabel)
        mainView.addSubview(firstLabel)
        mainView.addSubview(firstCollectionView)
        mainView.addSubview(secondLabel)
        mainView.addSubview(secondCollectionView)
        mainView.addSubview(thirdLabel)
        mainView.addSubview(alertButton)
        
        NSLayoutConstraint.activate([
            
            scrollContent.topAnchor.constraint(equalTo: view.topAnchor),
            scrollContent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollContent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollContent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            myImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImage.topAnchor.constraint(equalTo: view.topAnchor),
            myImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            mainView.topAnchor.constraint(equalTo: scrollContent.centerYAnchor, constant: -110),
            mainView.heightAnchor.constraint(equalTo: scrollContent.heightAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: scrollContent.bottomAnchor, constant: 90),
            
            nameLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 24),
            nameLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            
            firstLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 12),
            firstLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            firstLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            
            firstCollectionView.topAnchor.constraint(equalTo: firstLabel.bottomAnchor, constant: 12),
            firstCollectionView.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor),
            firstCollectionView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            firstCollectionView.heightAnchor.constraint(equalToConstant: 44),
            
            secondLabel.topAnchor.constraint(equalTo: firstCollectionView.bottomAnchor, constant: 24),
            secondLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor),
            secondLabel.trailingAnchor.constraint(equalTo: firstLabel.trailingAnchor),
            
            secondCollectionView.topAnchor.constraint(equalTo: secondLabel.bottomAnchor, constant: 12),
            secondCollectionView.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor),
            secondCollectionView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -20),
            secondCollectionView.heightAnchor.constraint(equalToConstant: 90),
            
            alertButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -58),
            alertButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            alertButton.leadingAnchor.constraint(equalTo: thirdLabel.trailingAnchor, constant: 24),
            alertButton.heightAnchor.constraint(equalToConstant: 60),
            
            thirdLabel.centerYAnchor.constraint(equalTo: alertButton.centerYAnchor),
            thirdLabel.leadingAnchor.constraint(equalTo: firstLabel.leadingAnchor)
        ])
    }
}
extension ViewController {
    
    func setup(_ model: SurfModel) {
        myImage.image = UIImage(named: model.image)
        nameLabel.text = model.internLabel
        firstLabel.text = model.firstText
        secondLabel.text = model.secondText
        thirdLabel.text = model.thirdText
    }
    // MARK: - function for button
    @objc func tapButton() {
        
        UIView.animate(withDuration: 0.4) {
            self.alertButton.alpha = 0.8
            self.alertButton.backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.831372549, blue: 0.8549019608, alpha: 1)
        }
        
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Закрыть", style: .default) { _ in
            UIView.animate(withDuration: 0.4) {
                self.alertButton.alpha = 1
                self.alertButton.backgroundColor = #colorLiteral(red: 0.1921568627, green: 0.1921568627, blue: 0.1921568627, alpha: 1)
            }
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}

