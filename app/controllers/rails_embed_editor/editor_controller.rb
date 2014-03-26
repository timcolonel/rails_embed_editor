module RailsEmbedEditor
  class EditorController < ApplicationController
    def edit
      filename = params[:filename]
      text = params[:content]
      if filename.nil? or text.nil?
        render :json => {:success => false, :params => params.to_json}
      else
        manager = RailsEmbedEditor::FileManager.from_options(filename, params)
        manager.save_text text
        render :json => {:success => true}
      end

    end
  end
end