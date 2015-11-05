require 'test_helper'

class InvestmentTransactionsControllerTest < ActionController::TestCase
  setup do
    @investment_transaction = investment_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investment_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investment_transaction" do
    assert_difference('InvestmentTransaction.count') do
      post :create, investment_transaction: { amount: @investment_transaction.amount, investment_desc: @investment_transaction.investment_desc, transaction_date: @investment_transaction.transaction_date, transaction_desc: @investment_transaction.transaction_desc }
    end

    assert_redirected_to investment_transaction_path(assigns(:investment_transaction))
  end

  test "should show investment_transaction" do
    get :show, id: @investment_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @investment_transaction
    assert_response :success
  end

  test "should update investment_transaction" do
    patch :update, id: @investment_transaction, investment_transaction: { amount: @investment_transaction.amount, investment_desc: @investment_transaction.investment_desc, transaction_date: @investment_transaction.transaction_date, transaction_desc: @investment_transaction.transaction_desc }
    assert_redirected_to investment_transaction_path(assigns(:investment_transaction))
  end

  test "should destroy investment_transaction" do
    assert_difference('InvestmentTransaction.count', -1) do
      delete :destroy, id: @investment_transaction
    end

    assert_redirected_to investment_transactions_path
  end
end
