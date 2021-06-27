////
////  ViewController.swift
////  xylophone
////
////  Created by DIVYA GAHLOT on 12/06/21.
////
//
//import UIKit
//import AVFoundation
//
//
//
//class ViewController: UIViewController {
//
//    var player: AVAudioPlayer?
//
//    func playSound(sound: String) {
//        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else {
//            return
//
//        }
//
//        do {
//            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
//            try AVAudioSession.sharedInstance().setActive(true)
//
//            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
//
//            guard let player = player else { return }
//
//            player.play()
//
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
//
//
//    @IBAction func C(_ sender: UIButton) {
//        playSound(sound: sender.currentTitle!)
////        let generator = UINotificationFeedbackGenerator()
////        generator.prepare()
////        generator.notificationOccurred(.success)
//
//    }
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer?
        @IBAction func C(_ sender: UIButton) {
    //        let generator = UINotificationFeedbackGenerator()
    //        generator.prepare()
    //        generator.notificationOccurred(.success)
    
        }

    @IBAction func keyPressedC(_ sender: UIButton) {
       
        let generator = UINotificationFeedbackGenerator()
        generator.prepare()
        generator.notificationOccurred(.success)

        sender.alpha=0.5
        //Code should execute after 0.2 second delay.
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
             //Bring's sender's opacity back up to fully opaque.
             sender.alpha = 1.0
         }
        playSound(buttonTitle:sender.currentTitle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    func playSound(buttonTitle:String) {
        guard let url = Bundle.main.url(forResource: buttonTitle, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    

}
