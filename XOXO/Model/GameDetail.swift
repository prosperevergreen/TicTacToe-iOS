//
//  GameDetail.swift
//  XOXO
//
//  Created by Prosper Evergreen on 09.10.2020.
//

import Foundation

struct GameDetail {
    var gameLabel: String = "Your Turn: \(K.player1Turn)"
    var winPosition: [Int]?
    var playerIcon: String?
    var isWin: Bool = false
    var isDraw: Bool = false
}
