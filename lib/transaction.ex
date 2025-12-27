import Funx.Macros, only: [ord_for: 2]
alias Funx.Optics.{Lens, Prism}

defmodule Transaction do
  defstruct [:type]

  def type_prism do
    Prism.path([{__MODULE__, :type}])
  end

  ord_for(
    Transaction,
    Lens.path([:type, :payment, :name])
  )
end

defmodule Charge do
  alias Funx.Optics.Prism
  defstruct [:payment]

  def payment_prism do
    Prism.path([{__MODULE__, :payment}])
  end

  ord_for(
    Charge,
    Lens.path([:payment, :name])
  )
end

defmodule Refund do
  alias Funx.Optics.Prism
  defstruct [:payment]

  def payment_prism do
    Prism.path([{__MODULE__, :payment}])
  end

  ord_for(
    Refund,
    Lens.path([:payment, :name])
  )
end

defmodule Check do
  alias Funx.Optics.Prism
  defstruct [:name, :routing_number, :account_number, :amount]

  def amount_prism do
    Prism.path([{__MODULE__, :amount}])
  end

  ord_for(Check, Lens.key(:name))
end

defmodule CreditCard do
  alias Funx.Optics.Prism
  defstruct [:name, :number, :expiry, :amount]

  def amount_prism do
    Prism.path([{__MODULE__, :amount}])
  end

  ord_for(CreditCard, Lens.key(:name))
end
