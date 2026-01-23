import Funx.Macros, only: [eq_for: 2, ord_for: 2]
alias Funx.Optics.{Lens, Prism}
use Funx.Eq

defmodule Transaction do
  defstruct [:id, :type]

  def type_prism do
    Prism.path([{__MODULE__, :type}])
  end

  eq_for(
    Transaction,
    Lens.key([:id])
  )

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

  eq_for(
    Charge,
    Lens.path([:payment, :amount])
  )

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

  eq_for(
    Refund,
    Lens.path([:payment, :amount])
  )

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

  eq_for(
    Check,
    eq do
      on Prism.path([{Check, :routing_number}])
      on Prism.path([{Check, :account_number}])
    end
  )

  ord_for(Check, Lens.key(:name))
end

defmodule CreditCard do
  alias Funx.Optics.Prism
  defstruct [:name, :number, :expiry, :amount]

  def amount_prism do
    Prism.path([{__MODULE__, :amount}])
  end

  eq_for(
    CreditCard,
    eq do
      on Prism.path([{CreditCard, :number}])
    end
  )

  ord_for(CreditCard, Lens.key(:name))
end
