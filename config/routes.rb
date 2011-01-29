RailsMobileApp::Application.routes.draw do
  
  # standard rails mappings
  resources :posts
   match "sinfo", :to => "info#index"
  match '/sphoto/:id', :to => "photo#index"

   match '/sp1/:id', :to => "photo#index", :constraints => { :id => "1" }


  

  # mobile enhanced mappings
  match "check" => "check#user_agent"
  match "info", :to => "info#index$", :classifier => :mobile_classifier
  match "mobile", :to => "mobile#index", :mobile_only =>true, :classifier => :mobile_classifier
  match '/photo/:id', :to => "photo#index$", :as => :photo , :classifier => :mobile_classifier

   match '/p1/:id', :to => "photo#index$", :as => :p1 , :classifier => :mobile_classifier, :constraints => { :id => "1" }

  #-------- shortcut based mappings
  match "shortcut" => "info#index$", :classifier => :mobile_classifier

  get "contact/index$", :classifier => :mobile_classifier
end

MobileDispatch::Categories.add do
  def mobile_classifier(device)
   "_mobile"
  end
 
end