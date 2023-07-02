class SessionsController < ApplicationController
  
#   route handler
  get '/articles/:id' do
    # initialize page to 0
    # || using to set initial value
    session[:page_views] || = 0
    # for every request increment
    session[:page_views] += 1

    if session[:page_views] < 3
        # if less than 3 render dta
        article_id = params[:id]
        article_data = get_article_data(article_id)
        json_response(article_data)
    else
        status 401
        json_response({error: "You have reached the maximum page views." })
    end

  end
#   helper method to convert data to JSONs
  def json_response(data)
    content_type :json
    data.to_json
  end

end