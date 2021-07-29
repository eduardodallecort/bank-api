class Api::TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :update, :destroy]

  # GET /transactions
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create  
    
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.create(transaction_params)

    if @transaction.transaction_type == 'credit'
      @transaction.update(previous_balance: @account.balance)
      if @account.update(balance: @account.balance + @transaction.value)
        @transaction.update(new_balance: @account.balance)
        render json: {
          account_number: @transaction.account.account_number,
          previous_balance: @transaction.previous_balance,
          new_balance: @transaction.new_balance
        }
      end
    elsif @transaction.transaction_type == 'debt'
      @transaction.update(previous_balance: @account.balance)
      if @account.update(balance: @account.balance - @transaction.value)
        @transaction.update(new_balance: @account.balance)
        render json: {
          account_number: @transaction.account.account_number,
          previous_balance: @transaction.previous_balance,
          new_balance: @transaction.new_balance
        }
      end
    end
    # if @account.update(balance: @account.balance)
    #   render json: @transaction, status: :created, location: @transaction
    # else
    #   render json: @transaction.errors, status: :unprocessable_entity
    # end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:transaction_type, :value, :transaction_date, :account_id, :previous_balance, :new_balance)
    end
end
