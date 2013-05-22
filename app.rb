#!/usr/bin/env ruby

require 'rubygems' #ruby < 1.9
require 'thor'
require 'github_api'

class Gitthor < Thor

  @@github = Github.new

  # Login to github (Basic auth)
  # Arguments: username, password (required, required)
  desc "login", "Login to github [ARGS = username, password]"
  def login(username, password)
    github = Github.new basic_auth: "#{username}:#{password}"
    # TODO FINISH LOGIN ALSO WITH OAUTH
  end

  # Get list os a users repos
  # Arguments: username (required)
  desc "repos", "See users repos [ARGS = username]"
  def repos(username)
    user_repos = @@github.repos.list user: username
    user_repos.each do |repo|
      puts repo['name']
    end
  end

  # Get list os a users repos
  # Arguments: username (required)
  desc "repos", "See users repos [ARGS = username]"
  def repos(username)
    user_repos = @@github.repos.list user: username
    user_repos.each do |repo|
      puts repo['name']
    end
  end

  # Search Github for repos
  # Arguments: seach term (required)
  desc "search", "Search for Users / Repos / Issues / Email [ARGS = Searchtype / Searchterm]"
  def search(type, term)
    search = @@github
    result = search.search.users keyword: "#{term}"

    puts result
  end



end #Class end

Gitthor.start
