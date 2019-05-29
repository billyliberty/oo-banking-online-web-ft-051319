class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if sender.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = 'rejected'
      return "Transaction rejected."
    elsif @status == 'complete'
      puts "Transaction already done."
    else
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = 'complete'
    end
  end

end
