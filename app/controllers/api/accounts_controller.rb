class Api::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]

  # GET /accounts
  def index
    @accounts = Account.all

    render json: @accounts
  end

  # GET /accounts/1
  def show
    my_transactions = []

    @account.transactions.each do |transaction|
      my_transactions.push({
        transaction_type: transaction.transaction_type,
        previous_balance: transaction.previous_balance,
        value: transaction.value,
        new_balance: transaction.new_balance
      })
    end

    render json: {
      account_number: @account.account_number,
      balance: @account.balance,
      transactions: my_transactions
    }
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      @account.update(account_number: (@account.id + 500).to_s, balance: 0.0)
      render json: {
        account_number: @account.account_number,
        password: @account.password
      }
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # DELETE /accounts/1
  def destroy
    @account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:name, :cpf, :rg, :dt_nasc, :balance, :password)
    end
end
