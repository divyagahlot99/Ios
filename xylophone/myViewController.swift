//
//  myViewController.swift
//  xylophone
//
//  Created by DIVYA GAHLOT on 14/06/21.
//

import UIKit
import AVFoundation


class myViewController: UIViewController {
    @IBOutlet weak var myCollectionView: UICollectionView!
    

    var charList: Array<String> = []
    
    var data: String = ""
    
    var songTiles = [
        "teri meri": ["D", "A", "G", "A", "F", "G", "A", "F", "G", "A", "G", "F", "E", "D", "E", "D", "C", "D", "E", "F", "E", "F", "E", "G", "A", "G", "F", "E", "D", "D"],
        "faded": ["F", "F", "D", "F", "D", "F", "G", "A", "F", "F", "D", "A", "F", "F", "E", "E", "E", "D", "F", "F", "F", "D", "F", "D", "F", "G", "A", "F", "F", "C", "A", "F", "F", "G", "A", "A", "A", "G", "A", "A", "A", "A", "G", "A", "A", "A", "A", "G", "A", "F", "G", "G", "G", "A", "G", "F", "D", "A", "A", "A", "G", "A", "F", "G", "G", "G", "A", "G", "F", "E", "D", "A", "A", "A", "G", "A", "F", "E", "D"],
        "darmiyan": ["A", "B", "B", "A"],
        "hangover": ["B", "A", "B", "A"],
        "dna": ["A", "A", "A", "A"],
        "fire": ["A", "B", "B", "A"],
        "springday": ["C", "A", "A", "A"],
        "gotcha": ["C", "A", "A", "A"],
        "aurora": ["C", "A", "A", "A"],
        "fadedremix": ["A", "B", "A", "B"]
    ]
    
    
    @IBOutlet weak var chosenSong: UILabel!

    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var B: UIButton!
    
    
    //    @IBAction func keyNote(_ sender: UIButton) {
//        if (sender.currentTitle == charList[0]) {
//            charList.removeFirst()
//            print("Correct!")
//            playSound(sound: sender.currentTitle!)
//        }
//    }
    
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
    
    var colorHighlight = UIColor(red: 1, green: 1, blue: 0.8, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charList = songTiles[data]!
        chosenSong.text = data
        
        if charList[0] == "A" {
            A.backgroundColor = colorHighlight
        } else if charList[0] == "B" {
            B.backgroundColor = colorHighlight
        } else if charList[0] == "C" {
            C.backgroundColor = colorHighlight
        } else if charList[0] == "D" {
            D.backgroundColor = colorHighlight
        } else if charList[0] == "E" {
            E.backgroundColor = colorHighlight
        } else if charList[0] == "F" {
            F.backgroundColor = colorHighlight
        } else if charList[0] == "G" {
            G.backgroundColor = colorHighlight
        }
        

        // Do any additional setup after loading the view.
    }

    
}
 

extension myViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBAction func keyNote(_ sender: UIButton) {
        
        if (sender.currentTitle == charList[0]) {
            
            if sender.currentTitle == "A" {
                A.backgroundColor = UIColor.systemBlue
            } else if sender.currentTitle == "B" {
                B.backgroundColor = UIColor.systemPurple
            } else if sender.currentTitle == "C" {
                C.backgroundColor = UIColor.systemRed
            } else if sender.currentTitle == "D" {
                D.backgroundColor = UIColor.systemOrange
            } else if sender.currentTitle == "E" {
                E.backgroundColor = UIColor.systemYellow
            } else if sender.currentTitle == "F" {
                F.backgroundColor = UIColor.systemGreen
            } else if sender.currentTitle == "G" {
                G.backgroundColor = UIColor.systemTeal
            }
            
            
            charList.removeFirst()
            print("Correct!")
            let theIndex = IndexPath(row: 0, section: 0)
            myCollectionView.deleteItems(at: [theIndex])
//            myCollectionView.reloadData()
            playSound(sound: sender.currentTitle!)
            if charList.isEmpty {
                
            } else {
                if charList[0] == "A" {
                    A.backgroundColor = colorHighlight
                } else if charList[0] == "B" {
                    B.backgroundColor = colorHighlight
                } else if charList[0] == "C" {
                    C.backgroundColor = colorHighlight
                } else if charList[0] == "D" {
                    D.backgroundColor = colorHighlight
                } else if charList[0] == "E" {
                    E.backgroundColor = colorHighlight
                } else if charList[0] == "F" {
                    F.backgroundColor = colorHighlight
                } else if charList[0] == "G" {
                    G.backgroundColor = colorHighlight
                }
            }
            
        }
    }
    
    
    
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
return charList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        myCollectionView.reloadItems(at: [indexPath])
     //   collectionView.reloadData()
//        myCollectionView.reloadData()

        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myCollectionViewCell
        cell.myImage.image = UIImage(named: charList[indexPath.row])
//        myCollectionView.reloadItems(at: [indexPath])
        
        return cell
    }
    
    
}


