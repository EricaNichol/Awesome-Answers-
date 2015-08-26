class WelcomeController < ApplicationController
#setting the layout in here changes the default layout for all the actions in this controller.
#layout "special"

  def index
    # render({text: "Hello World"})
    #this will just send a plain text response back to the client
    #render text: "Hello World"

    #rails automatically renders a template with the views subfolder matching
    #the controllers name. In this case the welcome folder. It will look for a file named index with the appropriate format and templating language so we can write this but it's redundant:
    #render :index, layout: "application"
    #render :index, layouts: "special"

    #every controller action must have a single render or a sigle *redirect*
  end

  def hello
    @name = params[:name]
  end


end
