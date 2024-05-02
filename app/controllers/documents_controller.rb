class DocumentsController < ApplicationController

        before_action :set_document,only: %i[show edit update destroy]
    
    
    
        def index
            @documents = Document.all
        end
    
        def new
            @document = Document.new
        end
    
        def create
            @document = Document.new(document_params)
    
            if @document.save
                redirect_to documents_path, notice: 'New Document details has been saved successfully'
            else
                render :new
            end
    
        end
    
        def edit
            #@employee = Employee.find(params[:id])
            
        end
    
        def update
            #@employee = Employee.find(params[:id])
            if @document.update(document_params)
                redirect_to documents_path
            else
                render :edit
            end
            
        end
    
        def show
            #@employee = Employee.find(params[:id])
        end
    
        def destroy
            #@employee = Employee.find(params[:id])
            if @document.destroy
                redirect_to documents_path, notice: "Document is deleted successfully"
            end
            
        end
    
    
    
    
    private
    def document_params
        params.require(:document).permit(:name,:doc_type,:employee_id,:image)
    end
    
    def set_document
        @document = Document.find(params[:id])
        rescue ActiveRecord::RecordNotFOund => error
            redirect_to documents_path, notice: error
    
    end
    
    
    

end