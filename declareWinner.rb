def declareWinner(dlr, usr, winner)
  case
    when dlr == usr 
      puts "Push!"
      @winner = "Tie"
    when dlr < 22 && usr > 21
      puts "Dealer Wins!"
      @winner = "Dealer"
    when usr < 22 && dlr > 21
      puts "You Win!"
      @winner = "User"
    when dlr > usr
      puts "Dealer Wins!"
      @winner = "Dealer"
    when usr > dlr
      puts "You Win!"
      @winner = "User"
  end
  @winner
end