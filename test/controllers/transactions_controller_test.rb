require "test_helper"

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction = transactions(:one)
  end

  test "should get index" do
    get transactions_url, as: :json
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post transactions_url, params: { transaction: { account_id: @transaction.account_id, new_balance: @transaction.new_balance, previous_balance: @transaction.previous_balance, transaction_date: @transaction.transaction_date, transaction_type: @transaction.transaction_type, value: @transaction.value } }, as: :json
    end

    assert_response 201
  end

  test "should show transaction" do
    get transaction_url(@transaction), as: :json
    assert_response :success
  end

  test "should update transaction" do
    patch transaction_url(@transaction), params: { transaction: { account_id: @transaction.account_id, new_balance: @transaction.new_balance, previous_balance: @transaction.previous_balance, transaction_date: @transaction.transaction_date, transaction_type: @transaction.transaction_type, value: @transaction.value } }, as: :json
    assert_response 200
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete transaction_url(@transaction), as: :json
    end

    assert_response 204
  end
end
