//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Muya on 11/08/2015.
//  Copyright © 2015 muya. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    // MARK: Properties
    var rating = 0 {
        didSet {
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    var spacing: Int = 5
    var stars: Int = 5

    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // create the buttons
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        for _ in 0..<stars {
            print("About to add buttons")
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
            print("Finished adding buttons")
        }
       
    }
    override func layoutSubviews() {
        print("layoutSubviews called!")
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // offset each button's origin by length of button + spacing
        for (index, button) in ratingButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectedState()
    }
    
    // MARK: Button action
    func ratingButtonTapped(button: UIButton) {
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectedState()
    }
    
    func updateButtonSelectedState() {
        for (index, button) in ratingButtons.enumerate() {
            // select if it's index is less than rating
            button.selected = index < rating
        }
    }

}
