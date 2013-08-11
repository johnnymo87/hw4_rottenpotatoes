# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create!(movie)
  end
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  flunk "Unimplemented"
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(', ').each do |rating|
    uncheck.nil? ? check(rating) : uncheck(rating)
  end
end

#Given /I have added "(.*)" with rating "(.*)"/ do |title, rating|
#  steps %Q{
#        Given I am on the Create New Movie page
#        When  I fill in "Title" with "#{title}"
#        And   I select "#{rating}" from "Rating"
#        And   I press "Save Changes"
#      }
#end
#
#Then /I should see "(.*)" before "(.*)" on (.*)/ do |string1, string2, path|
#  step "I am on #{path}"
#  regexp = /#{string1}.*#{string2}/m #  /m means match across newlines
#  page.body.should =~ regexp
#end

Then /I (don't )?see movies with the following ratings: (.*)/ do |dont, rating_list|
  rating_list.split(', ').each do |rating|
    if dont.nil?
      page.should have_css("table#movies tbody td", :text => "#{rating}")
    else
      page.should_not have_css("table#movies tbody td", :text => "#{rating}")
    end
  end
end

Then(/^I should see all the movies$/) do
  page.all('table#movies tbody tr').count.should == Movie.all.count
end

Then(/^I should see '(.*)' before '(.*)'.$/) do |string1, string2|
  page.body.should =~ /#{string1}.*#{string2}/m
end
Then(/^I should see dates '(.*)' before '(.*)'.$/) do |date1, date2|
  date1, date2 = [date1, date2].each { |date| Date.strptime(date, '%d-%b-%Y').strftime('%Y-%m-%d') }
  page.body.should =~ /#{date1}.*#{date2}/m
end