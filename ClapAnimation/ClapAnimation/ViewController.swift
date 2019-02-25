//
//  ViewController.swift
//  TwitterLike
//
//  Created by Joker Hook on 2019/2/12.
//  Copyright © 2019 com.icloud@h76joker. All rights reserved.
//

import UIKit
import AudioToolbox.AudioServices // 加入震动反馈

class ViewController: UIViewController {
    
    var likeButton: UIButton!
    var feedbackGenerator : UIImpactFeedbackGenerator? = UIImpactFeedbackGenerator(style: .heavy)
    deinit {
        feedbackGenerator = nil
    }
    
    var flag: Bool = false
    let emitterLayer = CAEmitterLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedbackGenerator?.prepare()
        view.backgroundColor = .black
        initLikeButton()
    }
    
    func initLikeButton() {
        likeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        likeButton.center = self.view.center
        likeButton.setImage(UIImage(named: "1"), for: .normal)
        likeButton.addTarget(self, action: #selector(likeButtonTapped(sender:)), for: .touchDown)
        self.view.addSubview(likeButton)
    }
    
    @objc func likeButtonTapped(sender: UIButton) {
        feedbackGenerator?.impactOccurred()
        flag = !flag
        if flag {
            likeButton.setImage(UIImage(named: "2"), for: .normal)
            playAnimation()
            
            /**
             *设定一段时间以后停止发射粒子
             */
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { [weak self] in
                self!.emitterLayer.removeFromSuperlayer()
            }
            
        } else {
            likeButton.setImage(UIImage(named: "1"), for: .normal)
        }
        
        scaleLikeButton()
    }
    
    
    
    /**
     *发射粒子的核心代码
     */
    func playAnimation() {
        emitterLayer.emitterShape = .circle
        emitterLayer.emitterSize.width = 32
        emitterLayer.emitterPosition = self.likeButton.center
        emitterLayer.emitterMode = .surface
        
        let blueCell = CAEmitterCell()
        blueCell.birthRate = 4 // 指定每一次发射粒子数的多少
        blueCell.lifetime = 1 // 设定粒子发射的范围
        blueCell.velocity = 50 // 粒子的速度
        blueCell.scale = 0.005 // 粒子图片的大小
        blueCell.emissionRange = CGFloat.pi * 2.0 // 粒子发射方向的范围
        blueCell.contents = UIImage(named: "4.png")!.cgImage
        
        
        let redCell = CAEmitterCell()
        redCell.birthRate = 0.9 // 指定每一次发射粒子数的多少
        redCell.lifetime = 1 // 设定粒子发射的范围
        redCell.velocity = 50 // 粒子的速度
        redCell.scale = 0.005 // 粒子图片的大小
        redCell.emissionRange = CGFloat.pi * 2.0 // 粒子发射方向的范围
        redCell.contents = UIImage(named: "5.png")!.cgImage
        
        let greenCell = CAEmitterCell()
        greenCell.birthRate = 4 // 指定每一次发射粒子数的多少
        greenCell.lifetime = 1 // 设定粒子发射的范围
        greenCell.velocity = 50 // 粒子的速度
        greenCell.scale = 0.005 // 粒子图片的大小
        greenCell.emissionRange = CGFloat.pi * 2.0 // 粒子发射方向的范围
        greenCell.contents = UIImage(named: "6.png")!.cgImage
        
        let yellowCell = CAEmitterCell()
        yellowCell.birthRate = 4 // 指定每一次发射粒子数的多少
        yellowCell.lifetime = 1 // 设定粒子发射的范围
        yellowCell.velocity = 50 // 粒子的速度
        yellowCell.scale = 0.005 // 粒子图片的大小
        yellowCell.emissionRange = CGFloat.pi * 2.0 // 粒子发射方向的范围
        yellowCell.contents = UIImage(named: "7.png")!.cgImage
        
        
        emitterLayer.emitterCells = [redCell,greenCell, yellowCell,blueCell] // 设定有多少种粒子
        
        self.view.layer.addSublayer(emitterLayer)
        
    }
    
    // 爱心动画
    func scaleLikeButton() {
        UIView.animate(withDuration: 0.2, animations: {
            let scaleTransform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.likeButton.transform = scaleTransform
        }) { (_) in
            UIView.animate(withDuration: 0.2, animations: {
                self.likeButton.transform = CGAffineTransform.identity
            })
        }
    }
    
    
    
}

