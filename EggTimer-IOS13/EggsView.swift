//
//  EggsView.swift
//  EggTimer-IOS13
//
//  Created by Malik Em on 22.02.2023.
//

import UIKit
import AVFoundation

class EggsView: UIView {
    
    let label = UILabel()
    let softEggBtn = UIButton()
    let mediumEggBtn = UIButton()
    let hardEggBtn = UIButton()
    let stackView = UIStackView()
    let progressView = UIProgressView()
    
    let eggsTimeInSeconds = ["Soft": 300, "Medium": 420, "Hard": 720]
    
    var totalTime = 0
    var secondsPassed = 0
    
    var timer = Timer()
    var player: AVAudioPlayer?
    
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
        softEggBtn.tag = 1
        
        mediumEggBtn.setBackgroundImage(UIImage(named: "medium_egg"), for: .normal)
        mediumEggBtn.tag = 2
        
        hardEggBtn.setBackgroundImage(UIImage(named: "hard_egg"), for: .normal)
        hardEggBtn.tag = 3
        
        [softEggBtn, mediumEggBtn, hardEggBtn].forEach {
            $0.addTarget(self, action: #selector(eggBtnTapped), for: .touchUpInside)
        }
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "How do you like your eggs?"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 30)
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progressViewStyle = .bar
        progressView.progressTintColor = .systemYellow
        progressView.trackTintColor = .systemGray
        progressView.progress = 0.0
    }
    
    private func layout() {
        stackView.addArrangedSubview(softEggBtn)
        stackView.addArrangedSubview(mediumEggBtn)
        stackView.addArrangedSubview(hardEggBtn)
        addSubview(stackView)
        addSubview(label)
        addSubview(progressView)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 150),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 150)
            ])
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -150)
        ])
    }
}

extension EggsView {
    @objc func eggBtnTapped(_ sender: UIButton) {
        timer.invalidate()
        progressView.progress = 0.0
        secondsPassed = 0
        switch sender.tag {
        case 1:
            totalTime = eggsTimeInSeconds["Soft"]!
            label.text = "Soft"
        case 2:
            totalTime = eggsTimeInSeconds["Medium"]!
            label.text = "Medium"
        default:
            totalTime = eggsTimeInSeconds["Hard"]!
            label.text = "Hard"
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed)/Float(totalTime)
        } else {
            timer.invalidate()
            label.text = "DONE!"
            playSound()
        }
    }
    
    private func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player?.play()
    }
}
