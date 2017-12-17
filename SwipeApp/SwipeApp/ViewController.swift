//
//  ViewController.swift
//  SwipeApp
//
//  Created by 김진선 on 2017. 12. 13..
//  Copyright © 2017년 JinseonKim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var divisor: CGFloat!
    var imageArray = [#imageLiteral(resourceName: "beyonce"), #imageLiteral(resourceName: "emma"), #imageLiteral(resourceName: "dwayne"), #imageLiteral(resourceName: "kendall"), #imageLiteral(resourceName: "ryan"), #imageLiteral(resourceName: "lawrence")]
    var cardArray:[SwipeCard] = []
    
    let padding:CGFloat = 20
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        divisor = (view.frame.width / 2) / 0.61
        
        for i in 0 ..< imageArray.count {
            let card = SwipeCard(origin: self.view.center, image: imageArray[i])
            cardArray.append(card)
        }
        
        setUpCards()
        
        
    }
    
    func setUpCards() {
        for card in cardArray.reversed() {
            self.view.addSubview(card)
            card.likeLabel.alpha = 0
            card.nopeLabel.alpha = 0
            let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture(_:)))
            card.addGestureRecognizer(gesture)
        }
        
    }
    
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        guard let card = sender.view else { return }
        let swipeCard = cardArray[index]
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        
        
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        card.transform = CGAffineTransform(rotationAngle: -xFromCenter / divisor)
        
        if xFromCenter > 0 {
            swipeCard.likeLabel.isHidden = false
            swipeCard.nopeLabel.isHidden = true
        } else {
            swipeCard.likeLabel.isHidden = true
            swipeCard.nopeLabel.isHidden = false
        }
        
        swipeCard.likeLabel.alpha = abs(xFromCenter) / view.center.x
        swipeCard.nopeLabel.alpha = abs(xFromCenter) / view.center.x
        
        if sender.state == UIGestureRecognizerState.ended {
            
            if card.center.x < 75 {
                
                UIView.animate(withDuration: 0.5, animations: {
                    card.center = CGPoint(x: card.center.x - 300, y: card.center.y)
                }, completion: { (success) in
                    if success {
                        swipeCard.removeFromSuperview()
                        self.index = self.index + 1
                    }
                })
                return
                
            } else if card.center.x > self.view.frame.width - 75 {
                UIView.animate(withDuration: 0.5, animations: {
                    card.center = CGPoint(x: card.center.x + 300, y: card.center.y)
                }, completion: { (success) in
                    if success {
                        swipeCard.removeFromSuperview()
                        self.index = self.index + 1
                    }
                })
                return
            }
            
            UIView.animate(withDuration: 0.5) {
                card.center = self.view.center
                swipeCard.likeLabel.alpha = 0
                swipeCard.nopeLabel.alpha = 0
                card.transform = .identity
            }
            
        }
    }
    
}

