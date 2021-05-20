//
//  ViewController.swift
//  Traffic Lights
//
//  Created by Олег on 19.05.21.
//

import UIKit

enum CurrentLight {
    case red, yellow, green, redAndYellow
}

class ViewController: UIViewController {
    @IBOutlet var redLights: UIView!
    @IBOutlet var yellowLights: UIView!
    @IBOutlet var greenLights: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1.0
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.layer.cornerRadius = 20
        
        redLights.alpha = lightIsOff
        yellowLights.alpha = lightIsOff
        greenLights.alpha = lightIsOff
        
        redLights.layer.masksToBounds = true
        redLights.layer.cornerRadius = redLights.frame.width/2
        
        yellowLights.layer.masksToBounds = true
        yellowLights.layer.cornerRadius = yellowLights.frame.width/2
        
        greenLights.layer.masksToBounds = true
        greenLights.layer.cornerRadius = greenLights.frame.width/2
        
    }
    
    @IBAction func tappedNextButton() {
        startButton.setTitle("Next", for: .normal)
        
        switch currentLight {
        case .red:
            redLights.alpha = lightIsOn
            yellowLights.alpha = lightIsOff
            currentLight = .redAndYellow
        case .redAndYellow:
            yellowLights.alpha = lightIsOn
            currentLight = .green
        case .green:
            redLights.alpha = lightIsOff
            yellowLights.alpha = lightIsOff
            greenLights.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            yellowLights.alpha = lightIsOn
            greenLights.alpha = lightIsOff
            currentLight = .red
        }
        
    }
    
}

