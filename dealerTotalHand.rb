def dealerTotalHand(hand, total)
  if hand.inject { |accumulator, numbers| accumulator + numbers } > 21
    total = hand.inject { |accumulator, numbers| accumulator + numbers }
    puts "Yay! the dealer busts!"
  elsif hand.include?(1)
    if hand.inject { |accumulator, numbers| accumulator + numbers } + 10 < 22
      total = (hand.inject { |accumulator, numbers| accumulator + numbers } + 10)
    else
      total = hand.inject { |accumulator, numbers| accumulator + numbers }
    end
  else
    total = hand.inject { |accumulator, numbers| accumulator + numbers }
  end
  total 
end