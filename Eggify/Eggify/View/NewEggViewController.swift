//
//  NewEggViewController.swift
//  Eggify
//
//  Created by DIVYA GAHLOT on 14/06/21.
//

import UIKit
import  AVFoundation



class NewEggViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.progress.progress = Float(0)
        TimerLabel.text = "Timer"
        dialogMessage.addAction(ok)
    }
    
    
    @IBOutlet weak var TensDigit: UIImageView!
    
    @IBOutlet weak var OnesDigit: UIImageView!
    
    @IBOutlet weak var Speed: UILabel!
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    
    
    
    var value = 0.0
    var timer = Timer()
    var red = CGFloat(0)
    var green = CGFloat(1)
    var totalTime = CGFloat(0)
    var counter = 0
    var timerVal = 0
    var dialogMessage = UIAlertController(title: "Wohoooo!", message: "Your eggs are Ready :)", preferredStyle: .alert)
    let ok = UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in print("Ok button tapped")})
    var player: AVAudioPlayer?
    
    
    
    @IBAction func EggType(_ sender: UIButton) {
        timer.invalidate()
        red = CGFloat(0)
        green = CGFloat(1)
        value = 0
        counter = 0
        timerVal = 0
        Speed.text = sender.currentTitle! + " :)"
        if sender.currentTitle! == "Soft" {
            totalTime = 1000
        } else if sender.currentTitle! == "Medium" {
            totalTime = 4000
        } else {
            totalTime = 8000
        }
        TensDigit.image = numDict[Int(totalTime/1000) - 1]!
        OnesDigit.image = numDict[9]!
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateProgressView), userInfo: ["totalTime": totalTime] , repeats: true)
    }
    
    
    
    
    // Declaring Number Images Dict
    var numDict = [0: #imageLiteral(resourceName: "0"),
                      1: #imageLiteral(resourceName: "1"),
                      2: #imageLiteral(resourceName: "2"),
                      3: #imageLiteral(resourceName: "3"),
                      4: #imageLiteral(resourceName: "4"),
                      5: #imageLiteral(resourceName: "5"),
                      6: #imageLiteral(resourceName: "6"),
                      7: #imageLiteral(resourceName: "7"),
                      8: #imageLiteral(resourceName: "8"),
                      9: #imageLiteral(resourceName: "9")]
    
    
    
    
    
    // Stop Button
    @IBAction func StopButton(_ sender: UIButton) {
        red = CGFloat(0)
        green = CGFloat(1)
        self.progress.progress = Float(0)
        value = 0
        timer.invalidate()
        TimerLabel.text = "Timer"
        Speed.text = " "
        changeTensDigit(image: numDict[0]!)
        changeOnesDigit(image: numDict[0]!)
    }
    
    
    
    
    // Change Digit Animations
    func changeTensDigit(image: UIImage) {
        UIView.transition(with: TensDigit, duration: 0.3, options: [.transitionFlipFromTop], animations: { self.TensDigit.image = image})
    }
    
    func changeOnesDigit(image: UIImage) {
        UIView.transition(with: OnesDigit, duration: 0.3, options: [.transitionFlipFromTop], animations: { self.OnesDigit.image = image})
    }
    
    func decrementNumber(number: Int) {
        let newTensDigit = (number-1)/10
        let newOnesDigit = (number-1)%10
        if number > 0 {
            if newTensDigit != (number)/10 {
            changeTensDigit(image: numDict[newTensDigit]!)
            }
            changeOnesDigit(image: numDict[newOnesDigit]!)
        }
    }
    
    
    
    
    // Update the Progress View
    @objc func updateProgressView() {
        let division = CGFloat(1/0.01)
        counter = counter + 1
        timerVal = counter/Int(division)
        let params = timer.userInfo as! Dictionary<String, CGFloat>
        let totalTime = CGFloat(params["totalTime"]!)
        let incr = Float(1)/Float(totalTime)
        let rem = Int(totalTime/division) - counter/Int(division)
        
        
        // Decrementing Number
        if counter%Int(division) == 0 {
            decrementNumber(number: (rem))
            
            // Play Last 3 Sec sound
            if rem < 5 && rem > 1 { playSound(sound: "lastthreesec") }
            if rem == 1 { playSound(sound: "done") }
        }
        
        
        TimerLabel.text = "Time Left in seconds!"
        value = value + Double(incr)
        
        
        // Changing Progress Bar colors
        if value < 0.5 { red = CGFloat(value*2)
        } else { green = 1 - (CGFloat((value - 0.5)*2)) }
        
        self.progress.progress = Float(value)
        self.progress.tintColor = UIColor(red: red, green: green, blue: 0, alpha: 1.0)
        
        
        // Terminating
        if value > 1.0 {
            timer.invalidate()
            TimerLabel.text = "And You're done! :)"
            self.present(dialogMessage, animated: true, completion: nil)
            self.progress.progress = Float(0)
            Speed.text = " "
        }
    }
    
    
    
    
    // Play Sound
    func playSound(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else { return}
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else { return }
            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    

}
