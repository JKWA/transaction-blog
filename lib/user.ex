defmodule Transaction.User do
  require Funx.Macros
  alias Funx.Optics.Lens

  defstruct [:id, :name, :age, :status]

  Funx.Macros.ord_for(Transaction.User , Lens.key(:name))
  Funx.Macros.eq_for(Transaction.User , Lens.key(:id))
end

# defimpl Funx.Eq.Protocol, for: User do
#   alias Funx.Eq.Protocol, as: Eq
#   def eq?(%User{id: v1}, %User{id: v2}), do: Eq.eq?(v1, v2)
#   def not_eq?(%User{id: v1}, %User{id: v2}), do: Eq.not_eq?(v1, v2)
# end

# defimpl Funx.Ord.Protocol, for: User do
#   alias Funx.Ord.Protocol, as: Ord
#   def lt?(%User{name: v1}, %User{name: v2}), do: Ord.lt?(v1, v2)
#   def le?(%User{name: v1}, %User{name: v2}), do: Ord.le?(v1, v2)
#   def gt?(%User{name: v1}, %User{name: v2}), do: Ord.gt?(v1, v2)
#   def ge?(%User{name: v1}, %User{name: v2}), do: Ord.ge?(v1, v2)
# end
