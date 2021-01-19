class Transfer
 attr_accessor :sender, :receiver, :status, :transfer, :amount
  def initialize(sender, receiver, transfer)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @transfer = transfer
    @amount = 50
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
  
   if self.valid? == false || self.status == "complete" || @transfer >= @sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @receiver.balance += self.amount
      @sender.balance -= self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.balance -= self.amount
      @sender.balance += self.amount
      self.status = "reversed"
   #between two accounts (@sender, @receiver)
   #can only reverse executed transfers (meaning status = complete)
    end
  end

end
