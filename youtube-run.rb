# Test Runner
class Runner
  system("bundle exec ladon-run -a automations/nice_music.rb -f ui_url:'https://youtube.com/',output_file:output.json,output_format:to_json -p log.json")
end
