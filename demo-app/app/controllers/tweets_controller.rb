class TweetsController < ApplicationController

  # A list of standard controller methods are listed below

  # def index -> List all tweets
  # def show -> Show a single tweet
  # def new -> Show a new tweet format
  # def edit -> Show an edit tweet form
  # def create -> Create a new tweet
  # def upate -> Update a tweet
  # def destroy -> Delete a tweet


  # This method maps to the show.html.erb file contained
  # in the views/tweets/ folder
  def show

    # Create a tweet from a hash
    @tweet = Tweet.create(params[:tweet])

    # The above code however will allow users to send in additional
    # keys and values, so we can setup requirements for the params

    # We only need to use Strong Params when
    # multiple attributes are being created or updated. The line below
    # requires a tweet and permits the status from that tweet hash
    # to be used.
    @tweet = Tweet.create(params.require(:tweet).permit(:status))

    # An list of possible attributes to be used can also
    # be defined using an array.
    @tweet = Tweet.create(params.require(:tweet).permit([:status, :location]))

    # If we want to show a different view besides the
    # views/tweets/show.html.erb, we can use the line
    # below to specify the name of a different file in
    # the same path -
    # render action: 'status'

    respond_to do |format|
      # show.html.erb
      format.html
      # Render the json object for this tweet
      format.json { render json: @tweet}
      # Render the xml
      format.xml {render xml: @tweet}
    end
  end

  def edit
    # no longer needed due to before action methods defined
    # @tweet = Tweet.find(params[:id])
  end

  # These keywords specify methods to call before the logic of methods
  # edit, update, or destory is executed. If the only: keyword isn't included
  # then these before_actions will apply to all methods.
  before_action :get_tweet, only: [:edit, :update, :destroy]
  before_action :check_auth, only: [:edit, :update, :destroy]

  def get_tweet
    @tweet = Tweet.find(params[:id])
  end

  def check_auth
    # Check to see if the user information stored in the
    # session hash is equal to the current user id
    # NOTE: this has not been implemented yet and this value
    # will need to be implemented on our own
    if session[:zombie_id] != @tweet.zombie_id
      flash[:notice] = "Sorry, you can't edit this tweet"
      redirect_to(tweets_path)
    end
  end

  #def new
  #end

end
