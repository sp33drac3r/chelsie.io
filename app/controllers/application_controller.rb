class ApplicationController < ActionController::API
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  def index
    render :json => {'response': 'You are not alone.',
                    'about': 'chelsie.io is a publicly available API that serves location-specific help resources for survivors of sexual assault. Currently, chelsie.io serves information about local RAINN affiliate rape crisis centers.',
                    'routes': {
                      id: 'chelsie.io/centers/:id',
                      services: 'chelsie.io/centers/:id/services',
                      populations: 'chelsie.io/centers/:id/populations_served',
                      query: 'chelsie.io/centers/search/:query',
                      geo: 'chelsie.io/centers/geo/:lat/:lng/:radius'
                    },
                    'who is chelsie': 'https://mjakobhayes.wordpress.com/2016/04/25/to-kenyon-college-for-failing-my-little-sister/',
                    'controbuting': 'Contributions welcome! Fork it, clone it, change it and make a pull request with a clear, detailed description of the change or feature. We will review and merge it.'
                  }
  end

end
