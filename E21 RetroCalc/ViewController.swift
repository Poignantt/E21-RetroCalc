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
    
    var btnSound: AVAudioPlayer!
    var runningNumber: String = ""
    var rightValString: String = ""
    var leftValString: String = ""
    var result: String = ""
    
    enum Chode: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Subtract = "-"
        case Empty = "Empty"
    }
    var currentOperation = Chode.Empty
    
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
        runningNumber += "\(sender.tag)"
        digOutput.text = runningNumber
        playSound()
    }
    
    func processOperation(operation: Chode) {
        playSound()
        if currentOperation != Chode.Empty {
            if runningNumber == "nan" || runningNumber == "inf" {
                runningNumber = ""
            }
            if runningNumber != "" {
                
                rightValString = runningNumber
                runningNumber = ""
                
                if currentOperation == Chode.Multiply {
                    result = "\(Double(leftValString)! * Double(rightValString)!)"
                } else if currentOperation == Chode.Divide {
                    result = "\(Double(leftValString)! / Double(rightValString)!)"
                } else if currentOperation == Chode.Add {
                    result = "\(Double(leftValString)! + Double(rightValString)!)"
                } else if currentOperation == Chode.Subtract {
                    result = "\(Double(leftValString)! - Double(rightValString)!)"
                }
                
                leftValString = result
                digOutput.text = result
            }
            
            currentOperation = operation
            
        } else {
            
            leftValString = runningNumber
            runningNumber = ""
            currentOperation = operation
            
        }
        
    }
    
    @IBAction func onMultiply(sender: UIButton) {
        processOperation(operation: .Multiply)
    }
    
    
    @IBAction func onDivide(sender: UIButton) {
        processOperation(operation: .Divide)
    }
    
    @IBAction func onAdd(sender: UIButton) {
        processOperation(operation: .Add)
    }
    
    @IBAction func onSubtract(sender: UIButton) {
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onEquil(sender: UIButton) {
        processOperation(operation: currentOperation)
        currentOperation = Chode.Empty
        runningNumber = ""
    }
        
    @IBAction func clrBtn (sender: UIButton) {
        currentOperation = Chode.Empty
        runningNumber = ""
        digOutput.text = "0"
        playSound()
    }
        func playSound () {
            if btnSound.isPlaying {
                btnSound.stop()
            }
            btnSound.play()
        }

}

