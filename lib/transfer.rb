require 'pry'
class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount=50, status="pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid? #check if both accounts (sender and receiver) are valid
    if sender.valid? && receiver.valid?
      return true
    else 
      return false
    end
  end

  def execute_transaction
    if self.status == "pending" && !sender.valid? || !receiver.valid? || amount > sender.balance 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.status == "pending" && sender.valid?
      receiver.deposit(amount)
      sender.balance -= amount
      @status = "complete"
    else
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount)
      receiver.balance -= amount
      @status = "reversed"
    else
    end
  end

end
