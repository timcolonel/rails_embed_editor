module RailsEmbedEditor
  class EditorController < ApplicationController
    def edit

      render :json => params
    end
  end
end