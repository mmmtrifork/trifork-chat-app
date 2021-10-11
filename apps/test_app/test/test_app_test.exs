defmodule TestAppTest do
  use ExUnit.Case
  doctest TestApp

  test "sum works" do
    assert TestApp.sum(1,3) == 4
  end
  
  test "sum list works" do
    assert TestApp.sum_list([1,2,3,4,5,6,7,8,9], 0) == 45
  end
end
