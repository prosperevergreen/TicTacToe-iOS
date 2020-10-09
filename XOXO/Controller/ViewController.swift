//
//  ViewController.swift
//  XOXO
//
//  Created by Prosper Evergreen on 05.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    // create an instance of Game Engine
    private var gameEngine: GameEngine!
    
    // get a ref to the UIlabel to dislay whose turn or win/draw
    @IBOutlet weak var gameLbl: UILabel!
    // get an arr of all buttons
    @IBOutlet var allXOXObuttons: [UIButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // assign new game engine instance
        gameEngine = GameEngine()
    }
    
    
    // when a game button is pressed
    @IBAction func XOXOBtnPressed(_ sender: UIButton) {
        
        // check if it is an empty button else skip and do nothing
        if sender.currentTitle == K.emptyIcon {
            // get info on the current changes needed to make on the UI based on the last played
            let gameUpdate = gameEngine.check(LastPosition: allXOXObuttons.firstIndex(of: sender)!)
            
            // set the button and label to the new state based on the game play
            sender.setTitle(gameUpdate.playerIcon, for: .normal)
            gameLbl.text = gameUpdate.gameLabel
            
            // check if there is a win||draw disable all buttons and set label color to red
            if gameUpdate.isWin {

                for button in allXOXObuttons {
                    gameLbl.textColor = .red
                    button.isEnabled = false
                    
                    //set the winning buttons to red
                    if gameUpdate.winPosition!.contains(allXOXObuttons.firstIndex(of: button)!){
                        button.setTitleColor(.red, for: .normal)
                    }
                }
            }else if gameUpdate.isDraw{
                gameLbl.textColor = .red
                for button in allXOXObuttons {
                    button.isEnabled = false
                }
            }
 

        }
    }
    
    // reset button pressed
    @IBAction func resetBtnPressed(_ sender: UIBarButtonItem) {
        // create new game engine instance and reset all properties to new game
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

