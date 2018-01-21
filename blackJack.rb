require_relative "dealInitialCards"
require_relative "totalHand"
require_relative "dealerTotalHand"
require_relative "userHit"
require_relative "dealerHit"
require_relative "declareWinner"
require_relative "casino"

def blackJack (wallet)
  playAgain = "h"
  until playAgain == "n"
    puts ""
    puts "Welcome to the BlackJack Table!"
    sleep 1
    puts ""
    puts "How much would you like to bet?"
    puts ""
    bet = gets.chomp!
    bet = bet.to_i
    money_won = bet
    money_lost = - bet
    break if (@wallet + money_lost) < 0
    spades = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    hearts = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    clubs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    diamonds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    @deck = [spades, hearts, clubs, diamonds]
    @deck = @deck.flatten
    userHand = []
    dealerHand = []
    userHand = dealInitialCards(@deck, userHand)
    userTotal = 0
    dealerTotal = 0
    hit = "h"
    @winner = "n"
    puts ""
    puts "Ok, the dealer will deal you in"
    
    dealerHand = dealInitialCards(@deck, dealerHand) 
    
    #while loop starts here userTotal < 22 or dealerTotal < 22
    until (userTotal > 21 || dealerTotal > 21) || (dealerTotal > 15 && hit == "n" )
      sleep 3
      puts ""
      puts "Your hand is, #{userHand}"
      puts ""
      sleep 1
      userTotal = totalHand(userHand, userTotal)
      dealerTotal = dealerTotalHand(dealerHand, dealerTotal)
      sleep 1
      puts ""
      puts "The dealer's visible cards are #{dealerHand[1..-1]}"

      sleep 3
      puts ""
      puts "Would you like to hit? (y/n)"
      sleep 1
      puts ""
      hit = gets.chomp!
      puts ""

      userHand = userHit(hit, userHand, @deck)
      puts "Your hand is, #{userHand}"
      sleep 2
      userTotal = totalHand(userHand, userTotal)

      puts ""
      puts "Dealer turn"
      puts ""
      sleep 1
      dealerHand = dealerHit(dealerTotal, dealerHand, @deck, userTotal)
      puts "The dealer's visible cards are #{dealerHand[1..-1]}"
      dealerTotal = dealerTotalHand(dealerHand, dealerTotal)
      puts ""
      sleep 2
    end

    sleep 2
    p "The dealer's final hand was"
    p dealerHand
    puts ""
    puts "The dealer's total was #{dealerTotal}"
    puts ""

    sleep 2

    p "Your final hand was"
    p userHand
    puts ""
    puts "Your total was #{userTotal}"
    puts ""

    sleep 2

    declareWinner(dealerTotal, userTotal, @winner)

    puts ""

    sleep 2
    
    if @winner == "User"
      bet = bet
      puts "You win $#{bet}!"
    elsif @winner == "Tie"
      bet = 0
      puts "You push!"
    elsif @winner == "Dealer"
      bet = -bet
      puts "You lose $#{-bet} :("
    end

    puts ""

    sleep 2



    puts "Would you like to play again? (y/n)"
    playAgain = gets.chomp!
  end

end