//
//  ViewController.swift
//  swimeeAR
//
//  Created by Yamaguchi Kyoya on 2021/11/21.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    @IBOutlet var scoreLabel: UILabel! //スコア表示Label
    @IBOutlet var timerLabel: UILabel! //タイマー表示Label
    @IBOutlet var backgrounds: [UIVisualEffectView]! //ラベルの背景
    
    var score = 0 //スコア
    var timer: Timer! //タイマー
    var remainingTime: Int = 30 //制限時間
    var stageSize: Float = 0.5 //ステージサイズ(半径, 単位はm)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgrounds.forEach { $0.rounded(20) }
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if remainingTime > 0 {
            remainingTime -= 1
            timerLabel.text = String(remainingTime.timerFormat)
        } else {
            DispatchQueue.main.async {
                self.timeup()
            }
        }
    }
    
    func timeup() {
        timer.invalidate()
        let alert = UIAlertController(title: "TIME UP!", message: "スコア：\(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    var randomCoordinate: Float {
        Float.random(in: -stageSize...stageSize)
    }
}
