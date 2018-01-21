def userHit(hit, hand, deck)
  if hit == "y"
    hand << deck.delete_at(rand(deck.length))
  end
  hand
end