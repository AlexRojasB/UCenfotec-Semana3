//
//  Player.swift
//  Scoreboard-Navigation
//
//  Created by Alexander Rojas Benavides on 9/1/21.
//

import UIKit
struct Player{
    var name: String
    var game: String
    var stars: Int
    
    init(name: String = "", game: String = "", stars: Int = 5) {
        self.name = name
        self.game = game
        self.stars = stars
    }
}
