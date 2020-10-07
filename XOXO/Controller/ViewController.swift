//
//  ViewController.swift
//  XOXO
//
//  Created by Prosper Evergreen on 05.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameLbl: UILabel!
    @IBOutlet var allXOXObuttons: [UIButton]!
    var firstPlayer: Bool?{
        willSet{
            if newValue! {
                gameLbl.text = "Your Turn: Player 1"
            }else{
                gameLbl.text = "Your Turn: Player 2"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPlayer = true
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func XOXOBtnPressed(_ sender: UIButton) {
        
        if sender.currentTitle == "-" {
            if firstPlayer! {
                sender.setTitle("O", for: .normal)
            }else{
                sender.setTitle("X", for: .normal)
            }
            
            let win = checkWin(playerIcon: [sender.currentTitle!], lastPosition: allXOXObuttons.firstIndex(of: sender)!)
            if win {
                for button in allXOXObuttons {
                    button.isEnabled = false
                }
                gameLbl.text = "\(firstPlayer! ? "player 1" : "player 2") won"
                gameLbl.textColor = .red
            }else if checkDraw(){
                gameLbl.text = "Draw Game"
                gameLbl.textColor = .red
                for button in allXOXObuttons {
                    button.isEnabled = false
                }
            }else{
                firstPlayer = !firstPlayer!
            }
            
        }
        
        //        print(allXOXObuttons.firstIndex(of: sender)!)
    }
    
    @IBAction func resetBtnPressed(_ sender: UIBarButtonItem) {
        for btn in allXOXObuttons {
            btn.setTitle("-", for: .normal)
            btn.isEnabled = true
            gameLbl.textColor = .label
        }
        firstPlayer = true
    }
    
    private func checkDraw() -> Bool{
        var isNotDraw = true
        var possibilities = 0
        for index in 0...8 {
            if allXOXObuttons[index].currentTitle == "-"{
                //check the number of possible wins
                isNotDraw = checkWin(playerIcon: ["O", "-"], lastPosition: index) || checkWin(playerIcon: ["X", "-"], lastPosition: index)
                
                
                possibilities = isNotDraw ? possibilities + 1 : possibilities
            }
        }
        if possibilities > 0{
            return false
        }else{
            return true
        }
    }
    
    private func checkWin(playerIcon: [String], lastPosition: Int) -> Bool {
        var win = false
        switch lastPosition {
        case 0:
            win = check(playerIcon: playerIcon, places: [0,1,2])
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [0,3,6])}
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [0,4,8])}
            if win { return true }
        case 1:
            win = check(playerIcon: playerIcon, places: [0,1,2])
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [1,4,7])}
            if win { return true }
        case 2:
            win = check(playerIcon: playerIcon, places: [0,1,2])
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [2,4,6])}
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [2,5,8])}
            if win { return true }
        case 3:
            win = check(playerIcon: playerIcon, places: [0,3,6])
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [3,4,5])}
            if win { return true }
        case 4:
            win = check(playerIcon: playerIcon, places: [0,4,8])
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [1,4,7])}
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [2,4,6])}
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [3,4,5])}
            if win { return true }
        case 5:
            win = check(playerIcon: playerIcon, places: [3,4,5])
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [2,5,8])}
            if win { return true }
        case 6:
            win = check(playerIcon: playerIcon, places: [0,3,6])
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [2,4,6])}
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [6,7,8])}
            if win { return true }
        case 7:
            win = check(playerIcon: playerIcon, places: [1,4,7])
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [6,7,8])}
            if win { return true }
        case 8:
            win = check(playerIcon: playerIcon, places: [0,4,8])
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [2,5,8])}
            if win { return true } else{ win = check(playerIcon: playerIcon, places: [6,7,8])}
            if win { return true }
        default:
            return false
        }
        return false
    }
    
    private func check(playerIcon: [String], places: [Int]) -> Bool{
        for index in places {
            if !playerIcon.contains(allXOXObuttons[index].currentTitle!) {
                return false
            }
        }
        return true
    }
    
}

