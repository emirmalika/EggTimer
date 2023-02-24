//
//  ViewController.swift
//  EggTimer-IOS13
//
//  Created by Malik Em on 22.02.2023.
//

import UIKit

class EggsViewController: UIViewController {
    
    let label = UILabel()
    let eggsView = EggsView()
    let progressView = UIProgressView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension EggsViewController {
    private func style() {
        view.backgroundColor = UIColor((#colorLiteral(red: 0.7960784314, green: 0.9490196078, blue: 0.9882352941, alpha: 1)))
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How do you like your eggs?"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 30)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .bar
        progressView.progressTintColor = .systemYellow
        progressView.trackTintColor = .systemGray
    }
    
    private func layout() {
        view.addSubview(label)
        view.addSubview(eggsView)
        view.addSubview(progressView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
       
        NSLayoutConstraint.activate([
            eggsView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            eggsView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            eggsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eggsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            eggsView.heightAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150)
        ])
    }
}

