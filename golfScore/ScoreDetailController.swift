//
//  ScoreDetailController.swift
//  golfScore
//
//  Created by gs_fukumoto on 2017/11/01.
//  Copyright © 2017年 gs_fukumoto. All rights reserved.
//

import UIKit

class ScoreDetailController: UIViewController{

    @IBAction func AddAction(_ sender: Any) {
        
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "ScoreList")
        present(nextView, animated: true, completion: nil)
    }
}
