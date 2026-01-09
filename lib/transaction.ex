import Funx.Macros, only: [eq_for: 2, ord_for: 2]
alias Funx.Optics.{Lens, Prism}

defmodule Transaction do
  defstruct [:id, :type, :item]

  def type_prism do
    Prism.path([{__MODULE__, :type}])
  end


  eq_for(
    Transaction,
    Lens.key(:id)
  )

  ord_for(
    Transaction,
    Prism.path([{Transaction, :item}, Item])
  )
end

defmodule Item do
  defstruct [:name, :price]

  ord_for(
    Item,
    Lens.key(:name)
  )
end

defmodule Charge do
  alias Funx.Optics.Prism
  defstruct [:payment, :status]

  def payment_prism do
    Prism.path([{__MODULE__, :payment}])
  end

  eq_for(
    Charge,
    Prism.path([{Charge, :payment}, :id])
  )

  ord_for(
    Charge,
    Prism.path([{Charge, :payment}, :name])
  )
end

defmodule Refund do
  alias Funx.Optics.Prism
  defstruct [:payment, :status]

  def payment_prism do
    Prism.path([{__MODULE__, :payment}])
  end

  eq_for(
    Refund,
    Prism.path([{Refund, :payment}, :id])
  )

  ord_for(
    Refund,
    Prism.path([{Refund, :payment}, :name])
  )
end

defmodule Check do
  alias Funx.Optics.Prism
  defstruct [:id, :name, :routing_number, :account_number, :amount]

  def amount_prism do
    Prism.path([{__MODULE__, :amount}])
  end

  eq_for(Check, Lens.key(:id))
  ord_for(Check, Lens.key(:name))
end

defmodule CreditCard do
  alias Funx.Optics.Prism
  defstruct [:id, :name, :number, :expiry, :amount]

  def amount_prism do
    Prism.path([{__MODULE__, :amount}])
  end

  eq_for(CreditCard, Lens.key(:id))
  ord_for(CreditCard, Lens.key(:id))
end
