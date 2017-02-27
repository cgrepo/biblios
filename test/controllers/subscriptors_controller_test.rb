require 'test_helper'

class SubscriptorsControllerTest < ActionController::TestCase
  setup do
    @subscriptor = subscriptors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscriptors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscriptor" do
    assert_difference('Subscriptor.count') do
      post :create, subscriptor: { account: @subscriptor.account, address: @subscriptor.address, age: @subscriptor.age, celular: @subscriptor.celular, city: @subscriptor.city, colony: @subscriptor.colony, cp: @subscriptor.cp, email: @subscriptor.email, fullname: @subscriptor.fullname, group_id: @subscriptor.group_id, gurantor: @subscriptor.gurantor, notes: @subscriptor.notes, picture: @subscriptor.picture, scool_id: @subscriptor.scool_id, state: @subscriptor.state, telephone: @subscriptor.telephone, vigencyEnd: @subscriptor.vigencyEnd, vigencyStart: @subscriptor.vigencyStart }
    end

    assert_redirected_to subscriptor_path(assigns(:subscriptor))
  end

  test "should show subscriptor" do
    get :show, id: @subscriptor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscriptor
    assert_response :success
  end

  test "should update subscriptor" do
    patch :update, id: @subscriptor, subscriptor: { account: @subscriptor.account, address: @subscriptor.address, age: @subscriptor.age, celular: @subscriptor.celular, city: @subscriptor.city, colony: @subscriptor.colony, cp: @subscriptor.cp, email: @subscriptor.email, fullname: @subscriptor.fullname, group_id: @subscriptor.group_id, gurantor: @subscriptor.gurantor, notes: @subscriptor.notes, picture: @subscriptor.picture, scool_id: @subscriptor.scool_id, state: @subscriptor.state, telephone: @subscriptor.telephone, vigencyEnd: @subscriptor.vigencyEnd, vigencyStart: @subscriptor.vigencyStart }
    assert_redirected_to subscriptor_path(assigns(:subscriptor))
  end

  test "should destroy subscriptor" do
    assert_difference('Subscriptor.count', -1) do
      delete :destroy, id: @subscriptor
    end

    assert_redirected_to subscriptors_path
  end
end
