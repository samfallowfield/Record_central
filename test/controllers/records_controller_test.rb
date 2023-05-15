require "test_helper"

class RecordsControllerTest < ActionDispatch::IntegrationTest

  def setup
    # @record = Record.create(artist: 'Idles', album: 'test', genre: 'punk', variant: 'blue', description: 'first album')
    @user = User.create(username: "John doe", email: "johndoe@example.com",
                            password: "password", admin: false)
    logged_in_as(@user)
  end
  test "get new record and create new record listing" do
    get "/records/new"
    assert_response :success
      post records_path, params: {record: {artist: 'Idles', album: 'test',
                                           genre: 'punk', variant: 'blue', description: 'first album'}}
      assert_response :redirect

    follow_redirect!
    assert_response :success
    assert_match "Idles", response.body
  end
end
