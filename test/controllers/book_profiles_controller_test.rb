require 'test_helper'

class BookProfilesControllerTest < ActionController::TestCase
  setup do
    @book_profile = book_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:book_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book_profile" do
    assert_difference('BookProfile.count') do
      post :create, book_profile: { autor: @book_profile.autor, book_id: @book_profile.book_id, classificacion: @book_profile.classificacion, isbn: @book_profile.isbn, label: @book_profile.label, published: @book_profile.published, title: @book_profile.title }
    end

    assert_redirected_to book_profile_path(assigns(:book_profile))
  end

  test "should show book_profile" do
    get :show, id: @book_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book_profile
    assert_response :success
  end

  test "should update book_profile" do
    patch :update, id: @book_profile, book_profile: { autor: @book_profile.autor, book_id: @book_profile.book_id, classificacion: @book_profile.classificacion, isbn: @book_profile.isbn, label: @book_profile.label, published: @book_profile.published, title: @book_profile.title }
    assert_redirected_to book_profile_path(assigns(:book_profile))
  end

  test "should destroy book_profile" do
    assert_difference('BookProfile.count', -1) do
      delete :destroy, id: @book_profile
    end

    assert_redirected_to book_profiles_path
  end
end
