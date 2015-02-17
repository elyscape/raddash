# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
require 'rest_client'
require 'json'
username = ENV['rad_user']
password = ENV['rad_pass']
host = ENV['pup_host']

SCHEDULER.every '1m', :first_in => 0 do |job|
  response = RestClient.post "https://#{host}/auth/login?redirect=%2Fradiator.json", :username=>"#{username}", :password=>"#{password}"
  @cookies = response.cookies
  current = RestClient.get "https://#{host}/radiator.json", :cookies=> @cookies
  parsed = JSON.parse(current)
  failed = parsed['failed']
  noop = parsed['noop']
  unresponsive = parsed['unresponsive']
  changed = parsed['changed']
  unchanged = parsed['unchanged']
  unreported = parsed['unreported']
  all = parsed['all']

  send_event('total', {current: all})
  send_event('failed', {current: failed})
  send_event('noop', {current: noop})
  send_event('unreported', {current: unreported})
  send_event('unchanged', {current: unchanged})
  send_event('changed', {current: changed})
  send_event('unresponsive', {current: unresponsive})
end
