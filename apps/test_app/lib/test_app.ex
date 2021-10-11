defmodule TestApp do
  def sum(a, b) do
    a + b
  end

  def sum_list([h | t], acc) do
    sum_list(t, h + acc)
  end

  def sum_list([], acc) do
    acc
  end
end
