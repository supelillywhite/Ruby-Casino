def totalHand(hand, total)
  if hand.inject { |accumulator, numbers| accumulator + numbers } > 21
    total = hand.inject { |accumulator, numbers| accumulator + numbers }
    puts "Sorry, you bust!"
  elsif hand.include?(1)
    if hand.inject { |accumulator, numbers| accumulator + numbers } + 10 < 22
      total = (hand.inject { |accumulator, numbers| accumulator + numbers } + 10)
      puts "Because you have an ace in your hand, your total is #{total} or #{total - 10}"
    else
      total = hand.inject { |accumulator, numbers| accumulator + numbers }
      puts "Your total is #{total}"
    end
  else
    total = hand.inject { |accumulator, numbers| accumulator + numbers }
    puts "Your total is #{total}"
  end
  total
end
