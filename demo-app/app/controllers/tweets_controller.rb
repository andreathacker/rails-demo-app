class TweetsController < AppicationController

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

  def edit
    @tweet = Tweet.find(params[:id])
  end


  # A list of standard controller methods are listed below

  # def index -> List all tweets
  # def show -> Show a single tweet
  # def new -> Show a new tweet format
  # def edit -> Show an edit tweet form
  # def create -> Create a new tweet
  # def upate -> Update a tweet
  # def destroy -> Delete a tweet

end
