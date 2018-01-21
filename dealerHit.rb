def dealerHit(total, hand, deck, usrTotal)
  if total < 16 && usrTotal < 22
    hand << deck.delete_at(rand(deck.length))
  end
  hand
end