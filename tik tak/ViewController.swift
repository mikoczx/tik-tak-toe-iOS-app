//
//  ViewController.swift
//  tik tak
//
//  Created by fizmat_student on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    
    
    enum Turn {
        case Nought
        case Cross
    }

    
    var FirstTurn = Turn.Cross
    var currentTurn = Turn.Nought
    var NOUGHT = "O"
    var CROSS = "X"
    var board = [UIButton]()
    override func viewDidLoad() {
        super.viewDidLoad()
        initBoard()
    }
    func initBoard()
    {
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
    // Do any additional setup after loading the view.
    
    
    @IBAction func taptoBoard(_ sender: UIButton){
        addToBoard(sender)
        
        if checkVictory(CROSS)
        {
            crossscore += 1
            resultAlert(title: "Crosses Win!")
            
        }
        if checkVictory(NOUGHT)
        {
            noughtscore += 1
            resultAlert(title: "Noughtes Win!")
        }
        
        if(fullBoard())
        {
            resultAlert(title: "Draw")
        }
        
    }
    
    func checkVictory(_ s :String ) -> Bool
    {
        if thisSymbol(a1,  s) && thisSymbol(a2, s) && thisSymbol(a3, s)
        {
            return true
        }
        if thisSymbol(b1,  s) && thisSymbol(b2, s) && thisSymbol(b3, s)
        {
            return true
        }
        if thisSymbol(c1,  s) && thisSymbol(c2, s) && thisSymbol(c3, s)
        {
            return true
        }
        if thisSymbol(a1,  s) && thisSymbol(b1, s) && thisSymbol(c1, s)
        {
            return true
        }
        if thisSymbol(a2,  s) && thisSymbol(b2, s) && thisSymbol(c2, s)
        {
            return true
        }
        if thisSymbol(a3,  s) && thisSymbol(b3, s) && thisSymbol(c3, s)
        {
            return true
        }
        if thisSymbol(a1,  s) && thisSymbol(c2, s) && thisSymbol(b3, s)
        {
            return true
        }
        if thisSymbol(a3,  s) && thisSymbol(c2, s) && thisSymbol(b1 , s)
        {
            return true
        }
        
        
        return false
    }
    func thisSymbol (_ button: UIButton, _ symbol: String) -> Bool
    {
        return button.title(for: .normal) == symbol
    }
    
    
    var noughtscore = 0
    var crossscore = 0
    
    
    
    func resultAlert(title: String){
        let message = "\nNoughtes: " + String(noughtscore) + "\nCrosses: " + String(crossscore)
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            
            self.resetBoard()
            
        }))
        self.present(ac, animated: true)
    }
    
    
    func resetBoard() {
        for button in board {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        if(FirstTurn == Turn.Nought)
        {
            FirstTurn = Turn.Cross
        }
        else if(FirstTurn == Turn.Cross)
        {
            FirstTurn = Turn.Nought
        }
        currentTurn = FirstTurn
    }
    
    func fullBoard() -> Bool
    {
        for button in board
        {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        return true
    }
    @IBAction func addToBoard(_ sender: UIButton) {
        if(sender.title(for: .normal) == nil ) {
            if(currentTurn == Turn.Nought) {
                sender.setTitle(NOUGHT , for: .normal)
                currentTurn = Turn.Cross
                
            }
            else if(currentTurn == Turn.Cross) {
                sender.setTitle(CROSS , for: .normal)
                currentTurn = Turn.Nought}
            
        }
            sender.isEnabled = false
    }
}

