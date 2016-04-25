
/*The Deinitalization is a method that only class can use, for run clean-ups processes before the object had been removed.
This method cannot be call manually,it only called by Swift*/

class Bank {
    
    static var availableCoins = 10_000
    
    static func vendCoins(var numberOfCoinsToVend: Int) -> Int{
        
        numberOfCoinsToVend = min(numberOfCoinsToVend, availableCoins)
        
        availableCoins -= numberOfCoinsToVend
        
        return numberOfCoinsToVend
    }
    
    
    static func receiveCoins(coins: Int){
        availableCoins += coins
    }
    
}


class Player {
    
    var playerCoins = 0
    
    init(coins: Int){
        playerCoins = Bank.vendCoins(coins)
    }
    
    //Method for assign money to the player
    
    func gainCoin(toGain: Int){
        playerCoins += Bank.vendCoins(toGain)
    }
    
    
    deinit{
        Bank.receiveCoins(playerCoins)
    }
    
}


var player1: Player? = Player(coins:500)

//Available in the bank after create the player
Bank.availableCoins

player1!.playerCoins

//Giving money to the player
player1!.gainCoin(2000)
Bank.availableCoins

//Creating a new Player 

var player2: Player? = Player(coins: 6700)
player2?.playerCoins
Bank.availableCoins

player1 = nil
player2 = nil

//All the money is back to the bank
Bank.availableCoins



