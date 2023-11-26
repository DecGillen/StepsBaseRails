require "test_helper"

class YoutubeEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @youtube_entry = youtube_entries(:one)
  end

  test "should get index" do
    get youtube_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_youtube_entry_url
    assert_response :success
  end

  test "should create youtube_entry" do
    assert_difference("YoutubeEntry.count") do
      post youtube_entries_url, params: { youtube_entry: { embed_link: @youtube_entry.embed_link, title: @youtube_entry.title, user_id: @youtube_entry.user_id } }
    end

    assert_redirected_to youtube_entry_url(YoutubeEntry.last)
  end

  test "should show youtube_entry" do
    get youtube_entry_url(@youtube_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_youtube_entry_url(@youtube_entry)
    assert_response :success
  end

  test "should update youtube_entry" do
    patch youtube_entry_url(@youtube_entry), params: { youtube_entry: { embed_link: @youtube_entry.embed_link, title: @youtube_entry.title, user_id: @youtube_entry.user_id } }
    assert_redirected_to youtube_entry_url(@youtube_entry)
  end

  test "should destroy youtube_entry" do
    assert_difference("YoutubeEntry.count", -1) do
      delete youtube_entry_url(@youtube_entry)
    end

    assert_redirected_to youtube_entries_url
  end
end
