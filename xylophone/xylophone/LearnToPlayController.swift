//
//  LearnToPlayController.swift
//  xylophone
//
//  Created by DIVYA GAHLOT on 12/06/21.
//

import UIKit

class LearnToPlayController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Learn to play Screen"
        tableView.isHidden = true
        dialogMessage.addAction(ok)

        // Do any additional setup after loading the view.
    }
    
    var songList = ["teri meri", "faded", "darmiyan", "hangover", "dna", "fire", "springday", "gotcha", "aurora", "fadedremix"]
    
    var dialogMessage = UIAlertController(title: "Alert", message: "Please select a song!", preferredStyle: .alert)
    
    let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
         print("Ok button tapped")
    })
    
    var d = ""
    
    
    @IBOutlet weak var songbtn: UIButton!
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func songButton(_ sender: UIButton) {
        if (tableView.isHidden) {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    func animate(toggle: Bool) {
        if (toggle) {
            UIView.animate(withDuration: 0.3) {
                // animation
                self.tableView.isHidden = false
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                // animation
                self.tableView.isHidden = true
            }
        }
    }
    @IBAction func practiceButton(_ sender: UIButton) {
        if (songbtn.currentTitle == "Select Song") {
            print("Please select a song!")
            
            self.present(dialogMessage, animated: true, completion: nil)
        } else {
            let vc = storyboard?.instantiateViewController(identifier: "myViewController") as? myViewController
            vc?.data = d
            self.navigationController?.pushViewController(vc!, animated: true)
        }
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

extension LearnToPlayController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = songList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        songbtn.setTitle("\(songList[indexPath.row])", for: .normal)
        d = "\(songList[indexPath.row])"
        animate(toggle: false)
    }
}
