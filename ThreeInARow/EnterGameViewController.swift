//
//  EnterGameViewController.swift
//  ThreeInARow
//
//  Created by Michael Bergsten on 2022-12-05.
//

import UIKit

class EnterGameViewController: UIViewController {
    
    @IBOutlet weak var playerOneTF: UITextField!
    @IBOutlet weak var playerTwoTF: UITextField!
    
    
    let segueToPlay = "segueToPlayView"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
        
    @IBAction func playBtn(_ sender: UIButton) {
        performSegue(withIdentifier: segueToPlay, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueToPlay {
            if let destinationVCOne = segue.destination as? ViewController {
                destinationVCOne.receivingPlayerOne = playerOneTF.text
            }
            if let destinationVCTwo = segue.destination as? ViewController {
                destinationVCTwo.receivingPlayerTwo = playerTwoTF.text
            }
        }
    }
    
    
    
}
