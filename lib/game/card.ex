defmodule Game.Card do
  use Funx.Eq
  use Funx.Ord
  import Funx.Macros, only: [eq_for: 2, ord_for: 2]
  alias Funx.Optics.Lens

  defstruct [:id, :rank, :suit]

  def new(rank, suit) do
    %__MODULE__{
      id: :erlang.unique_integer([:positive]) |> Integer.to_string(),
      rank: rank,
      suit: suit
    }
  end

  def suit_eq do
    eq do
      on Lens.key(:suit)
    end
  end

  def rank_eq do
    eq do
      on Lens.key(:rank)
    end
  end

  def card_eq do
    eq do
      rank_eq()
      suit_eq()
    end
  end

  def playable_eq do
    eq do
      any do
        rank_eq()
        suit_eq()
      end
    end
  end

  def card_ord do
    ord do
      asc Lens.key(:suit)
      desc Lens.key(:rank)
    end
  end

  eq_for(Game.Card, Game.Card.card_eq())
  ord_for(Game.Card, Game.Card.card_ord())
end
