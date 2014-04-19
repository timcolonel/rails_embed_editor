module RailsEmbedEditor
  class EditorController < RailsEmbedEditor::ApplicationController
    def edit
      unless _authorize :edit, :local_file
        render :json => {:success => false, :message => 'You dont have access to this file!'}
        return
      end

      filename = params[:filename]
      text = params[:content]
      if filename.nil? or text.nil?
        render :json => {:success => false, :params => params.to_json}
      else
        puts text.lines.map{|x| "#{x.chomp}\n"}.to_s
        p text
        manager = RailsEmbedEditor::FileManager.from_options(filename, params)
        manager.save_text text
        render :json => {:success => true}
      end

    end
  end
end