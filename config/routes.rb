Rails.application.routes.draw do
#	resources :investments, :constraints => { :id => /[^\/]+/ }

	#  get 'pages/home'

	#fix the period on the route's parameter. Ex: Nissan Altima 2.5s. Not sure where to put	
	#match 'some_action/:id' => 'controller#action', :constraints  => { :id => /[0-z\.]+/ }

	get 'pages/about'

	get 'pages/blogs'

	post 'invs/get_month_of_year_transactions'

	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	# You can have the root of your site routed with "root"
	root 'pages#home'

	# Example of regular route:
	#   get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

	# Example resource route (maps HTTP verbs to controller actions automatically):
	#   resources :products

	# Example resource route with options:
	#   resources :products do
	#     member do
	#       get 'short'
	#       post 'toggle'
	#     end
	#
	#     collection do
	#       get 'sold'
	#     end
	#   end

	# Example resource route with sub-resources:
	#   resources :products do
	#     resources :comments, :sales
	#     resource :seller
	#   end
	#
#	resources :investments, :constraints => { :id => /[^\/]+/ } do
#		resources :investment_transactions
#	end

  resources :invs do
	  resources :inv_trans
  end

	# Example resource route with more complex sub-resources:
	#   resources :products do
	#     resources :comments
	#     resources :sales do
	#       get 'recent', on: :collection
	#     end
	#   end

	# Example resource route with concerns:
	#   concern :toggleable do
	#     post 'toggle'
	#   end
	#   resources :posts, concerns: :toggleable
	#   resources :photos, concerns: :toggleable

	# Example resource route within a namespace:
	#   namespace :admin do
	#     # Directs /admin/products/* to Admin::ProductsController
	#     # (app/controllers/admin/products_controller.rb)
	#     resources :products
	#   end
end
