//
//  ViewController.swift
//  E21 RetroCalc
//
//  Created by Koorosh Khadembashi on 1/3/17.
//  Copyright © 2017 Atiz. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var btnSound = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        
        do {
          try btnSound = AVAudioPlayer(contentsOf: soundURL)
            
        } catch let err as NSError {
        
            
        }

    


}

