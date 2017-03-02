//
//  ViewController.swift
//  E21 RetroCalc
//
//  Created by Koorosh Khadembashi on 1/3/17.
//  Copyright © 2017 Atiz. All rights reserved.
//

import UIKit
import AVFoundation

/*
Tags
 10 - (+)
 11 - (-)
 12 - (x)
 13 - (/)
 14 - (=)
*/

class ViewController: UIViewController {
    
    var btnSound: AVAudioPlayer!
    var digOutputValue: Float = 0.0
    var str: String!
    
    @IBOutlet weak var digOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        digOutput.text = "0"
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        
        do {
          try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
        print(err.debugDescription)
        }

    }
    
    @IBAction func numberPressed(sender: UIButton) {
        playSound()
        
        
        if digOutput.text != "0" {
        digOutput.text = digOutput.text! + "\(sender.tag)"
        }else{
        digOutput.text = "\(sender.tag)"
        }
        
    }
    
    
    
        func playSound () {
            if btnSound.isPlaying {
                btnSound.stop()
            }
            btnSound.play()
        }

}

