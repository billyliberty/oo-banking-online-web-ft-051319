class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @sender.balance < @amount && @sender.status == 'closed'
      @status = 'rejected'
      return "Transaction rejected."
    elsif @status == 'complete'
      puts "Transaction already made."
    else
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = 'complete'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit( @amount )
      @receiver.deposit( @amount * -1)
      @status = 'reversed'
    end
  end

end
