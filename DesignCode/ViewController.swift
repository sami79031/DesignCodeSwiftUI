//
//  ViewController.swift
//  DesignCode
//
//  Created by Sami Ali on 1/20/20.
//  Copyright © 2020 Sami Ali. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    let homeView = UIHostingController(rootView: Home())
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .red
        addChild(homeView)
        homeView.view.frame = self.view.frame
        self.view.addSubview(homeView.view)
        homeView.didMove(toParent: self)
        

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
