# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
MockedIssue.create name:'current_user is nil before sign_out is called ', 
											description: "Hi, i'm calling destroy method to logout user, but it can't find any users in scope. 
																		And i checked that before sign_out is called, curren_user is already nil. 
																		I'm using devise with simple_token_authentication. What could be wrong?"

MockedIssue.create name:"Add deliver_later option in send_devise_notification ",
											description: 'some very long and cool description of this issue'

MockedIssue.create name:"Rails 'config.relative_url_root' not taken into account",
											description: "Devise routes don't seem to take into account the config.relative_url_root parameter set in a Rails app (config/environments/production.rb). 
																		All links automatically prepend the relative URL, but Devise forms still redirect to the initial root folder."

MockedIssue.create name:'Send dedicated reconfirmation email ',
											description: "Devise offers the option to reconfirm an email address that has been changed. This is great and very useful.
																		A tiny flaw in this process is that devise sends out the normal (account) confirmation email which is kind of misleading for a user that just changed his email address.
																		I'd be happy to provide a PR for a separate email when confirming an updated / changed email address.
																		Waiting for feedback now. Thanks."






