//
//  practicexylo.swift
//  xylophone
//
//  Created by DIVYA GAHLOT on 13/06/21.
//

import UIKit
import AVFoundation


class practicexylo: UIViewController {
    var data: String = ""
    var arr: Array<String> = []
    
    @IBOutlet weak var KeyNotes: UILabel!
    var songTiles = [
        "teri meri": ["D", "A", "G", "A", "F", "G", "A", "F", "G", "A", "G", "F", "E", "D", "E", "D", "C", "D", "E", "F", "E", "F", "E", "G", "A", "G", "F", "E", "D", "D"],
        "faded": ["B", "A", "B", "A"],
        "darmiyan": ["A", "B", "B", "A"],
        "hangover": ["B", "A", "B", "A"],
        "dna": ["A", "A", "A", "A"],
        "fire": ["A", "B", "B", "A"],
        "springday": ["C", "A", "A", "A"],
        "gotcha": ["C", "A", "A", "A"],
        "aurora": ["C", "A", "A", "A"],
        "fadedremix": ["A", "B", "A", "B"]
    ]
    @IBOutlet weak var chosensong: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        chosensong.text = data
        print((String(describing: songTiles[data]!)))
        arr = songTiles[data]!
        KeyNotes.text = (String(describing: songTiles[data]!))
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func key(_ sender: UIButton) {
        if (sender.currentTitle == arr[0]) {
            arr.removeFirst()
            print("Correct!")
            playSound(sound: sender.currentTitle!)
            KeyNotes.text = (String(describing: arr))
        }
        
    }
    
    func playSound(sound: String) {
        guard let url = Bundle.main.url(forResource: sound, withExtension: "wav") else {
            return

        }
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
    
    var player: AVAudioPlayer?
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
