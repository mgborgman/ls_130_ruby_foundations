require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
    @transaction = Transaction.new(50)
  end

  def test_accept_money
    @transaction.amount_paid = 50
    assert_equal(150, @cash_register.accept_money(@transaction))
  end

  def test_change
    @transaction.amount_paid = 60
    assert_equal(10, @cash_register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $50.\n") {@cash_register.give_receipt(@transaction)}
  end
end