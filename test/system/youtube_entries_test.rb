require "application_system_test_case"

class YoutubeEntriesTest < ApplicationSystemTestCase
  setup do
    @youtube_entry = youtube_entries(:one)
  end

  test "visiting the index" do
    visit youtube_entries_url
    assert_selector "h1", text: "Youtube entries"
  end

  test "should create youtube entry" do
    visit youtube_entries_url
    click_on "New youtube entry"

    fill_in "Embed link", with: @youtube_entry.embed_link
    fill_in "Title", with: @youtube_entry.title
    fill_in "User", with: @youtube_entry.user_id
    click_on "Create Youtube entry"

    assert_text "Youtube entry was successfully created"
    click_on "Back"
  end

  test "should update Youtube entry" do
    visit youtube_entry_url(@youtube_entry)
    click_on "Edit this youtube entry", match: :first

    fill_in "Embed link", with: @youtube_entry.embed_link
    fill_in "Title", with: @youtube_entry.title
    fill_in "User", with: @youtube_entry.user_id
    click_on "Update Youtube entry"

    assert_text "Youtube entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Youtube entry" do
    visit youtube_entry_url(@youtube_entry)
    click_on "Destroy this youtube entry", match: :first

    assert_text "Youtube entry was successfully destroyed"
  end
end
