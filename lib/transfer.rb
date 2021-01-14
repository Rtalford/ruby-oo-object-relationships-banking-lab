require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end 

  def valid? 
    if receiver.valid? && sender.valid?
      true 
    else 
      false 
    end 
  end 

  def execute_transaction
    #binding.pry
    
      if valid? && @sender.balance > @amount && @status == "pending"
        receiver.balance += @amount 
        sender.balance -= @amount
        @status = "complete"
      else 
        @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      end
  end
  
    def reverse_transfer
      if valid? && @receiver.balance > @amount && @status == "complete"
        @sender.balance += @amount
        @receiver.balance -= @amount
        @status = "reversed"
      end 
    end 

end
