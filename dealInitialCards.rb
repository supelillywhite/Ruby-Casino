def dealInitialCards (deck, hand)
  hand << deck.delete_at(rand(deck.length))
  hand << deck.delete_at(rand(deck.length))
end
