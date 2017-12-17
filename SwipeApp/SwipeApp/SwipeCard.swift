//
//  SwipeCard.swift
//  SwipeApp
//
//  Created by 김진선 on 2017. 12. 14..
//  Copyright © 2017년 JinseonKim. All rights reserved.
//

import UIKit

class SwipeCard: UIView {

    let likeLabel:UILabel = {
        let label = UILabel()
        label.text = " LIKE "
        label.textColor = UIColor.green
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.clipsToBounds = true
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.green.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let nopeLabel:UILabel = {
        let label = UILabel()
        label.text = " NOPE "
        label.textColor = UIColor.red
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.clipsToBounds = true
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.red.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "emma"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        self.insertSubview(likeLabel, aboveSubview: imageView)
        likeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        likeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        self.insertSubview(nopeLabel, aboveSubview: imageView)
        nopeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        nopeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
    
    convenience init(origin: CGPoint, image: UIImage) {
        let screen = UIScreen.main.bounds
        self.init(frame: CGRect(x: origin.x - ((screen.width - 40) / 2), y: origin.y - ((screen.height - screen.height / 3) / 2), width: screen.width - 40, height: screen.height - screen.height / 3))
        imageView.image = image
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
