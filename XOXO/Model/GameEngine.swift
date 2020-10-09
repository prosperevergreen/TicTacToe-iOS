//
//  GameEngine.swift
//  XOXO
//
//  Created by Prosper Evergreen on 07.10.2020.
//


import Foundation

// Game Engine
struct GameEngine{
    // create array to keep track of current game state
    var btnArr = Array(repeating: K.emptyIcon, count: 9)
    // get a struct for the updating the game
    var gameDetail = GameDetail()
    // init first player as true
    var firstPlayer: Bool = true
    
    // check what's next to do based on last play (win, draw or keep playing) and update the game
    mutating func check(LastPosition: Int) -> GameDetail {
        btnArr[LastPosition] = firstPlayer ? K.player1Icon : K.player2Icon
        let win = checkWin(playerIcon: [btnArr[LastPosition]], lastPosition: LastPosition)
        if win.count == 3 {
            gameDetail.isWin = true
            gameDetail.gameLabel = "\(firstPlayer ? K.player1Turn : K.player2Turn) won"
            gameDetail.winPosition = win
        }else if checkDraw(){
            gameDetail.gameLabel = K.drawGame
            gameDetail.isDraw = true
        }else{
            firstPlayer = !firstPlayer
            gameDetail.gameLabel = firstPlayer ? "Your Turn: \(K.player1Turn)" : "Your Turn: \(K.player2Turn)"
        }
        gameDetail.playerIcon = btnArr[LastPosition]
        
        return gameDetail
    }
    
    //check for draw game
    private func checkDraw() -> Bool{
        var isNotDraw: Int = 0
        for index in 0...8 {
            if btnArr[index] == K.emptyIcon{
                for icon in [K.player1Icon, K.player2Icon] {
                    //check the number of possible wins
                    isNotDraw += checkWin(playerIcon: [icon, K.emptyIcon], lastPosition: index).count
                    if isNotDraw > 0{
                        return false
                    }
                }
            }
        }
        return true
    }
    
    //check if there is a possible wins from specified location
    private func checkWin(playerIcon: [String], lastPosition: Int) -> [Int] {
        var win = false
        switch lastPosition {
        case 0:
            win = checkMatch(playerIcon: playerIcon, places: [0,1,2])
            if win { return [0,1,2] } else{ win = checkMatch(playerIcon: playerIcon, places: [0,3,6])}
            if win { return [0,3,6] } else{ win = checkMatch(playerIcon: playerIcon, places: [0,4,8])}
            if win { return [0,4,8] }
        case 1:
            win = checkMatch(playerIcon: playerIcon, places: [0,1,2])
            if win { return [0,1,2] } else{ win = checkMatch(playerIcon: playerIcon, places: [1,4,7])}
            if win { return [1,4,7] }
        case 2:
            win = checkMatch(playerIcon: playerIcon, places: [0,1,2])
            if win { return [0,1,2] } else{ win = checkMatch(playerIcon: playerIcon, places: [2,4,6])}
            if win { return [2,4,6] } else{ win = checkMatch(playerIcon: playerIcon, places: [2,5,8])}
            if win { return [2,5,8] }
        case 3:
            win = checkMatch(playerIcon: playerIcon, places: [0,3,6])
            if win { return [0,3,6] } else{ win = checkMatch(playerIcon: playerIcon, places: [3,4,5])}
            if win { return [3,4,5] }
        case 4:
            win = checkMatch(playerIcon: playerIcon, places: [0,4,8])
            if win { return [0,4,8] } else{ win = checkMatch(playerIcon: playerIcon, places: [1,4,7])}
            if win { return [1,4,7] } else{ win = checkMatch(playerIcon: playerIcon, places: [2,4,6])}
            if win { return [2,4,6] } else{ win = checkMatch(playerIcon: playerIcon, places: [3,4,5])}
            if win { return [3,4,5] }
        case 5:
            win = checkMatch(playerIcon: playerIcon, places: [3,4,5])
            if win { return [3,4,5] } else{ win = checkMatch(playerIcon: playerIcon, places: [2,5,8])}
            if win { return [2,5,8] }
        case 6:
            win = checkMatch(playerIcon: playerIcon, places: [0,3,6])
            if win { return [0,3,6] } else{ win = checkMatch(playerIcon: playerIcon, places: [2,4,6])}
            if win { return [2,4,6] } else{ win = checkMatch(playerIcon: playerIcon, places: [6,7,8])}
            if win { return [6,7,8] }
        case 7:
            win = checkMatch(playerIcon: playerIcon, places: [1,4,7])
            if win { return [1,4,7] } else{ win = checkMatch(playerIcon: playerIcon, places: [6,7,8])}
            if win { return [6,7,8] }
        case 8:
            win = checkMatch(playerIcon: playerIcon, places: [0,4,8])
            if win { return [0,4,8] } else{ win = checkMatch(playerIcon: playerIcon, places: [2,5,8])}
            if win { return [2,5,8] } else{ win = checkMatch(playerIcon: playerIcon, places: [6,7,8])}
            if win { return [6,7,8] }
        default:
            return []
        }
        return []
    }
    
    //check if their is a match or possible match
    private func checkMatch(playerIcon: [String], places: [Int]) -> Bool{
        for index in places {
            if !playerIcon.contains(btnArr[index]) {
                return false
            }
        }
        return true
    }
    
    
}

