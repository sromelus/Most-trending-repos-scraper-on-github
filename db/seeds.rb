# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'nokogiri'
require 'json'

CURRENT_FILE_PATH = File.dirname(__FILE__)

TRENDING_URL = 'https://github.com/trending?since=weekly'

TREDING_REPOS = {}

document = open(TRENDING_URL)

page = Nokogiri::HTML(document)

repo_list_items = page.css(".repo-list").css("li")

num_repo_trending = page.css(".repo-list").css("li").length

puts ""

puts "Below is this week's list of the #{num_repo_trending} most trending repositories on github."

repo_with_non_listed_prog_lang = []

repo_list_items.each do |repo|
    repo_name = repo.css('h3').text.strip
    repo_description = repo.css('p').text.strip
    repo_written_language = repo.css('[itemprop="programmingLanguage"]').text

    TREDING_REPOS["#{repo_name}"] = {}

    puts ""
    puts repo_name
    puts '========================='
    puts repo_description
    puts ""
    if repo_written_language != ""
      puts  "Written primarily in " + repo_written_language.strip
    else
      puts "Written primarily in N/A"
      repo_with_non_listed_prog_lang << repo_name
    end
    puts ""

    contributors = []
    repo.css('.d-inline-block.mr-3').css('img').each do |name|
      contributor = name.attributes['alt'].value.delete "@"
      contributors << contributor.capitalize
    end

    if contributors === ""
       puts "Primary Contributors: N/A"
    else
      puts "Primary Contributors: #{contributors.join(", ")}"
    end
    puts '-------------------------'
    puts ""

    #Trending_repo.create(name: repo_name, description: repo_description, language: repo_written_language, contributors: contributors)
end

puts  "----------------------------------------------------------------------------------"
puts  "Below is a list of repositories that does not specify a programming language."
puts  ""
puts                        repo_with_non_listed_prog_lang
puts  "----------------------------------------------------------------------------------"

# puts TREDING_REPOS

# json_formatted_data = JSON.pretty_generate(TREDING_REPOS, indent: '  ')
# File.write(CURRENT_FILE_PATH + '/trending-repos.json', json_formatted_data)
