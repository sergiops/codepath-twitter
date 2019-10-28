//
//  SlideSegue.swift
//  Twitter
//
//  Created by Sergio P. on 10/27/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class SlideSegue: UIStoryboardSegue {
    
    override func perform() {
        if let navigation = self.source.navigationController {
            navigation.pushViewController(self.destination, animated: true)
        }
    }

}
