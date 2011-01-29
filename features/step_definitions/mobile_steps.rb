Given /^(?:|I )am a mobile user$/ do
  add_headers('HTTP_USER_AGENT'=>"Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Mobile/7D11")
end

Given /^(?:|I )am a normal user$/ do
  add_headers('HTTP_USER_AGENT'=>'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)')
end

Then /^(?:|I )should get a (\d+) status code$/ do |code|
  puts page.body
  assert_equal(code.to_i,page.status_code)
end

Then /^I should get a (.+) Exception$/ do |exception_name|

  assert_equal(exception_name, @exception.class.name) {  }
end