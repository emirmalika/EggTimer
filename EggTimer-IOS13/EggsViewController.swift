//
//  ViewController.swift
//  EggTimer-IOS13
//
//  Created by Malik Em on 22.02.2023.
//

import UIKit

class EggsViewController: UIViewController {
    
    let eggsView = EggsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
}

extension EggsViewController {
    private func style() {
        view.backgroundColor = UIColor((#colorLiteral(red: 0.7960784314, green: 0.9490196078, blue: 0.9882352941, alpha: 1)))
    }
    
    private func layout() {
        view.addSubview(eggsView)
        
        NSLayoutConstraint.activate([
            eggsView.topAnchor.constraint(equalTo: view.topAnchor),
            eggsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            eggsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            eggsView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

