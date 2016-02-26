require 'test_helper'

class Api::V1::EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @api_v1_entry = api_v1_entries(:one)
  end

  test "should get index" do
    get api_v1_entries_url
    assert_response :success
  end

  test "should create api_v1_entry" do
    assert_difference('Api::V1::Entry.count') do
      post api_v1_entries_url, params: { api_v1_entry: { author: @api_v1_entry.author, content: @api_v1_entry.content, date_published: @api_v1_entry.date_published, id: @api_v1_entry.id, permalink: @api_v1_entry.permalink, title: @api_v1_entry.title } }
    end

    assert_response 201
  end

  test "should show api_v1_entry" do
    get api_v1_entry_url(@api_v1_entry)
    assert_response :success
  end

  test "should update api_v1_entry" do
    patch api_v1_entry_url(@api_v1_entry), params: { api_v1_entry: { author: @api_v1_entry.author, content: @api_v1_entry.content, date_published: @api_v1_entry.date_published, id: @api_v1_entry.id, permalink: @api_v1_entry.permalink, title: @api_v1_entry.title } }
    assert_response 200
  end

  test "should destroy api_v1_entry" do
    assert_difference('Api::V1::Entry.count', -1) do
      delete api_v1_entry_url(@api_v1_entry)
    end

    assert_response 204
  end
end
