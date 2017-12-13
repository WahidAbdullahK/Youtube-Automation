require 'ladon'
require 'ladon/watir'
require 'models/page_objects/index'

# Run this automation if you want to listen to nice music.
# `ladon-run -a ./nice_music.rb -s NiceMusicAutomation`
class NiceMusicAutomation < Ladon::Watir::BrowserAutomation
  def self.default_ui_url
    'http://youtube.com'
  end

  def build_model
    super

    model.use_state_type(YouTubeIndexPage)
  end

  def execute
    navigate_to_video

    # Take a screenshot after 10 seconds.
    sleep 10
    screenshot('selenium grid sauce labs')

    sleep 10 # sleep for 10 seconds
  end

  def navigate_to_video
    model.current_state do |page|
      page.enter_search(term: 'selenium grid sauce labs')
    end

    model.make_transition

    model.current_state do |page|
      page.find_result(title: 'SauceLabs - How to Run a Selenium Test on SauceLabs')
    end

    model.make_transition
  end
end
