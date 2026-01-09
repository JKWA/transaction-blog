defmodule Slow.Validation do
  alias Funx.Monad.Either
  alias Funx.Errors.ValidationError

  require Logger

    @behaviour Funx.Validate.Behaviour


  @impl true
  def validate(value, opts, env) do

      delay_ms = Keyword.get(opts, :delay_ms, 500)

    Either.lift_predicate(
      value,
      fn _value -> slow_check(delay_ms,env) end,
      fn _value -> ValidationError.new("Slow check failed") end
    )
  end

  defp slow_check(delay_ms, env) do
    :timer.sleep(delay_ms)

    Logger.info("Env: #{inspect(env)}")
    Logger.info("Completed slow check in #{delay_ms}ms")

    true
  end
end
