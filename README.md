# LikeEffect

I worte this demo for learning, this demo is a clap animation can be used in many app.

## Requirements
- Xcode9 and later
- iOS 12.1 and later
- Swift4.0 and later

## Demo
let's see what would happen when you run this simple project.
![demo gif](https://github.com/HuangRunHua/LikeEffect/blob/master/ClapAnimation/ClapAnimation/demo/IMB_S6TJjc.gif)

## Usage
First you must develop your own clap button, and add the code in ViewController.swift

The following codes are the function when you touch the button.
~~~swift
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
~~~

## More
If you want to know how it was built, you can see [make a simple clap demo](https://medium.com/@h76joker/制作一个点赞效果-d73077b34b5f) for reference

