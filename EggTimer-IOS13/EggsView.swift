//
//  EggsView.swift
//  EggTimer-IOS13
//
//  Created by Malik Em on 22.02.2023.
//

import UIKit

class EggsView: UIView {
    
    let softEggBtn = UIButton()
    let mediumEggBtn = UIButton()
    let hardEggBtn = UIButton()
    
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EggsView {
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        [softEggBtn, mediumEggBtn, hardEggBtn, stackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        softEggBtn.setBackgroundImage(UIImage(named: "soft_egg"), for: .normal)
        mediumEggBtn.setBackgroundImage(UIImage(named: "medium_egg"), for: .normal)
        hardEggBtn.setBackgroundImage(UIImage(named: "hard_egg"), for: .normal)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
    }
    
    private func layout() {
        stackView.addArrangedSubview(softEggBtn)
        stackView.addArrangedSubview(mediumEggBtn)
        stackView.addArrangedSubview(hardEggBtn)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
}
