require "application_system_test_case"

class WebConfigsTest < ApplicationSystemTestCase
  setup do
    @web_config = web_configs(:one)
  end

  test "visiting the index" do
    visit web_configs_url
    assert_selector "h1", text: "Web Configs"
  end

  test "creating a Web config" do
    visit web_configs_url
    click_on "New Web Config"

    click_on "Create Web config"

    assert_text "Web config was successfully created"
    click_on "Back"
  end

  test "updating a Web config" do
    visit web_configs_url
    click_on "Edit", match: :first

    click_on "Update Web config"

    assert_text "Web config was successfully updated"
    click_on "Back"
  end

  test "destroying a Web config" do
    visit web_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Web config was successfully destroyed"
  end
end
