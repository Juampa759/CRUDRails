Rails.application.routes.draw do
  get 'user/index'

  get 'user/new'

  get 'user/edit'

  get 'user/destroy'

  post 'user/create'

  post 'user/update'

end
