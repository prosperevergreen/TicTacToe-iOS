//
//  ViewController.swift
//  XOXO
//
//  Created by Prosper Evergreen on 05.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var gameEngine = GameEngine()
    @IBOutlet weak var gameLbl: UILabel!
    @IBOutlet var allXOXObuttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
//        gameEngine = GameEngine()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func XOXOBtnPressed(_ sender: UIButton) {
        
        if sender.currentTitle == "-" {
            
            let gameUpdate = gameEngine.check(LastPosition: allXOXObuttons.firstIndex(of: sender)!)
        
            sender.setTitle(gameUpdate.playerIcon, for: .normal)
            gameLbl.text = gameUpdate.gameLabel
            
            if gameUpdate.isWin {
                for button in allXOXObuttons {
                    button.isEnabled = false
                    if gameUpdate.winPosition!.contains(allXOXObuttons.firstIndex(of: button)!){
                        button.setTitleColor(.red, for: .normal)
                    }
                }
                gameLbl.textColor = .red
            }else if gameUpdate.isDraw{
                gameLbl.text = gameUpdate.gameLabel
                gameLbl.textColor = .red
                for button in allXOXObuttons {
                    button.isEnabled = false
                }
            }
 

        }
    }
    
    @IBAction func resetBtnPressed(_ sender: UIBarButtonItem) {
        gameEngine = GameEngine()
        for btn in allXOXObuttons {
            btn.setTitle("-", for: .normal)
            btn.isEnabled = true
            btn.setTitleColor(.label, for: .normal)
        }
        gameLbl.textColor = .label
        gameLbl.text = gameEngine.gameDetail.gameLabel
    }
    
}

