ActiveAdmin.register Maker do

    permit_params :name, :description, :meta_title, :meta_description, :keywords
  
  end