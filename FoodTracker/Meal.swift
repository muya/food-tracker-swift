//
//  Meal.swift
//  FoodTracker
//
//  Created by Muya on 27/08/2015.
//  Copyright © 2015 muya. All rights reserved.
//

import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // initialization fails if name or rating is empty
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
