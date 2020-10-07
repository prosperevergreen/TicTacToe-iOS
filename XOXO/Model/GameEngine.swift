//
//  GameEngine.swift
//  XOXO
//
//  Created by Prosper Evergreen on 07.10.2020.
//
struct GameDetail {
    var gameLabel: String?
    var winPosition: [Int]?
    var playerIcon: String?
    var isWin: Bool = false
    var isDraw: Bool = false
}


import Foundation

struct GameEngine{
    var btnArr = Array(repeating: "-", count: 9)
    var gameDetail = GameDetail()
    var firstPlayer: Bool = true
    
    
    mutating func check(LastPosition: Int) -> GameDetail {
        btnArr[LastPosition] = firstPlayer ? "O" : "X"
        let win = checkWin(playerIcon: [btnArr[LastPosition]], lastPosition: LastPosition)
        if win.count == 3 {
            gameDetail.isWin = true
            gameDetail.gameLabel = "\(firstPlayer ? "player 1" : "player 2") won"
            gameDetail.winPosition = win
        }else if checkDraw(){
            gameDetail.gameLabel = "Draw Game"
            gameDetail.isDraw = true
        }else{
            firstPlayer = !firstPlayer
            gameDetail.gameLabel = firstPlayer ? "Your Turn: Player 1" : "Your Turn: Player 2"
        }
        gameDetail.playerIcon = btnArr[LastPosition]
        
        return gameDetail
    }
    
    private func checkDraw() -> Bool{
        var isNotDraw: Int = 0
        for index in 0...8 {
            if btnArr[index] == "-"{
                for icon in ["O", "X"] {
                    //check the number of possible wins
                    isNotDraw += checkWin(playerIcon: [icon, "-"], lastPosition: index).count
                    if isNotDraw > 0{
                        return false
                    }
                }
            }
        }
        return true
    }
    
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
    
    private func checkMatch(playerIcon: [String], places: [Int]) -> Bool{
        for index in places {
            if !playerIcon.contains(btnArr[index]) {
                return false
            }
        }
        return true
    }
    
    
}

