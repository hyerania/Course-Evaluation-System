# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'
    
    when /^the student page$/
      '/'
    
    when /^the Evaluations page$/
      '/admin/evaluations'
    
    when /^the New page$/
      '/admin/evaluations/new'
      
    when /^the new question page$/
      '/admin/questions/new'
      
    
    when /^the admin questions page$/
      '/admin/questions/show'
      
    when /^the edit question page for "(.*)"/
      "/admin/questions/edit/#{$1}"
    
    when /^the student registration page$/
      '/students/register'

    when /^the student login page$/
      '/students/welcome'
      
    when /^the student personal page$/
      '/students/show'
      
    when /^the admin page$/
      '/admin/show'
    
    when /^the student questions page$/
      '/questions'
      
    when /^the student home page$/
      '/students/show'
      
    when /^the admin login page$/
      '/admin/login'
      
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)