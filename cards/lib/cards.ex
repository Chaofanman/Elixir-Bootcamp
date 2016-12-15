defmodule Cards do
	@moduledoc """
	Provides methods for creating and handling a deck of cards
	"""

	@doc """
	Returns a list of strings which represents a deck of playing cards
	"""
	def create_deck do
		values = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
		suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

		for suit <- suits, value <- values do
			"#{value} of #{suit}"
		end
	end

	@doc """
	Shuffles the deck of cards.  
	"""
	def shuffle(deck) do
		Enum.shuffle(deck)
	end

	@doc """
	Checks the deck if a certain card is in there, will return true, otherwise false
	"""
	def contains?(deck, card) do
		Enum.member?(deck, card)
	end

	@doc """
	Divides a deck into a hand and the remainder of the deck.
	`hand_size` arguments indicates how many cards should be in 
	a hand.

	## Examples
		iex> deck = Cards.create_deck
		iex> {hand, deck} = Cards.deal(deck, 1)
		iex> hand
		["Ace of Spades"] 
	"""
	def deal(deck, hand_size) do
		Enum.split(deck, hand_size)
	end

	@doc """
	Save's the deck as a binary.  Argument deck is the collection we'll turn 
	into binary and filename will be its given filename.
	"""
	def save(deck, filename) do
		binary = :erlang.term_to_binary(deck)
		File.write(filename, binary)
	end

	@doc """
	Loads the given filename. 
	"""
	def load(filename) do		
		case File.read(filename) do
			{:ok, binary} -> :erlang.binary_to_term(binary)
			{:error, _reason} -> "File does not exist"
		end
	end

	@doc """ 
	Creates a hand given a hand size.
	"""
	def create_hand(hand_size) do
		Cards.create_deck 
		|> Cards.shuffle 
		|> Cards.deal(hand_size) 
		|> elem(0)
	end
end
