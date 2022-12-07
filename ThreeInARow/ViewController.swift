//
//  ViewController.swift
//  ThreeInARow
//
//  Created by Michael Bergsten on 2022-11-29.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn {
        case Circle
        case Cross
    }
    
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!

    
    var receivingPlayerOne : String?
    var receivingPlayerTwo : String?
    
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    
    var CROSS = "X"
    var CIRCLE = "O"
    
    
    var board = [UIButton]()
    
    var circlesScore = 0
    var crossesScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
        turnLabel.text = receivingPlayerOne
    }
    
    func initBoard() {
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
    }
    
    @IBAction func tapButton(_ sender: UIButton) {
        
        addToBoard(sender)
        
        if checkForVictory(CROSS){
            crossesScore += 1
        resultAlert(title: "\(receivingPlayerOne ?? "Crosses") Win!")
            
        }
        
        if checkForVictory(CIRCLE){
            circlesScore += 1
        resultAlert(title: "\(receivingPlayerTwo ?? "Circles") Win!")
            
        }
        
        if(fullBoard()) {
            resultAlert(title: "Draw")
            
        }
        
    }
    
    func checkForVictory(_ s :String) -> Bool {
        
        //Horizontal Victory
        
        if thisSymbol(a1, s) && thisSymbol(a2, s) && thisSymbol(a3, s) {
            return true
        }
        
        if thisSymbol(b1, s) && thisSymbol(b2, s) && thisSymbol(b3, s) {
            return true
        }
        
        if thisSymbol(c1, s) && thisSymbol(c2, s) && thisSymbol(c3, s) {
            return true
        }
        
        //Vertical Victory
        
        if thisSymbol(a1, s) && thisSymbol(b1, s) && thisSymbol(c1, s) {
            return true
        }
        
        if thisSymbol(a2, s) && thisSymbol(b2, s) && thisSymbol(c2, s) {
            return true
        }
        
        if thisSymbol(a3, s) && thisSymbol(b3, s) && thisSymbol(c3, s) {
            return true
        }
        
        //Diagonal Victory
        
        if thisSymbol(a1, s) && thisSymbol(b2, s) && thisSymbol(c3, s) {
            return true
        }
        
        if thisSymbol(a3, s) && thisSymbol(b2, s) && thisSymbol(c1, s) {
            return true
        }
        
        return false
    }
    
    func thisSymbol(_ button: UIButton, _ symbol: String) -> Bool {
        return button.title(for: .normal) == symbol
    }
    
    func resultAlert(title : String){
        
            let message = "\n\(receivingPlayerOne ?? "Crosses") " + String(crossesScore) + "\n\(receivingPlayerTwo ?? "Circles") " + String(circlesScore)
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            ac.addAction(UIAlertAction(title: "Continue Playing", style: .default, handler: {(_) in
                self.resetBoard()
            }))
        
            self.present(ac, animated: true)
    }
    
    func resetBoard() {
        
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if (firstTurn == Turn.Circle){
            firstTurn = Turn.Cross
            turnLabel.text = receivingPlayerOne
            
        } else if (firstTurn == Turn.Cross){
            firstTurn = Turn.Circle
            turnLabel.text = receivingPlayerTwo
        }
        
        currentTurn = firstTurn
        
    }
    
    func fullBoard() -> Bool {
        
        for button in board {
            if button.title(for: .normal) == nil {
                return false
            }
        }
        
        return true
    }
    
    func addToBoard(_ sender: UIButton) {
        if (sender.title(for: .normal) == nil) {
            if (currentTurn == Turn.Circle) {
                sender.setTitle(CIRCLE, for: .normal)
                currentTurn = Turn.Cross
                turnLabel.text = receivingPlayerOne
                
            } else if (currentTurn == Turn.Cross) {
                sender.setTitle(CROSS, for: .normal)
                currentTurn = Turn.Circle
                turnLabel.text = receivingPlayerTwo
                
            }
            
            sender.isEnabled = false
        }
    }
}
