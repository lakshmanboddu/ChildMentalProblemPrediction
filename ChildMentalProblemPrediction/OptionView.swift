//
//  OptionView.swift
//  ChildMentalProblemPrediction
//
//  Created by Lakshman Babu Boddu on 25/11/18.
//  Copyright © 2018 Lakshman Babu Boddu Lakshman Babu Boddu. All rights reserved.
//

import UIKit

class OptionView: UIControl {
    
    @IBOutlet var containerView : UIView!
    @IBOutlet weak var stackView : UIStackView!
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var lblTitle : UILabel!
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInt()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInt()
    }
    
    func commonInt(){
        Bundle.main.loadNibNamed("OptionView", owner: self, options: nil)
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    override var isSelected: Bool{
        
        didSet{
            imageView.image = isSelected == true ? UIImage(named: "radio-s") : UIImage(named: "radio")
        }
    }
    
}
