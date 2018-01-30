defmodule SmsConverterTest do
  use ExUnit.Case
  doctest SmsConverter

  test "greets the world" do
    assert SmsConverter.hello() == :world
  end
end
