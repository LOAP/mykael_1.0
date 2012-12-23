class BiosController < ApplicationController
  load_and_authorize_resource :except => :read

  # GET /bios/1
  # GET /bios/1.json
  def show
    @bio = Bio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bio }
    end
  end

  # GET /bios/1/edit
  def edit
    @bio = Bio.find(params[:id])
  end

  # POST /bios
  # POST /bios.json
  def create
    @bio = Bio.new(params[:bio])

    respond_to do |format|
      if @bio.save
        format.html { redirect_to @bio, notice: 'Bio was successfully created.' }
        format.json { render json: @bio, status: :created, location: @bio }
      else
        format.html { render action: "new" }
        format.json { render json: @bio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bios/1
  # PUT /bios/1.json
  def update
    @bio = Bio.find(params[:id])

    respond_to do |format|
      if @bio.update_attributes(params[:bio])
        format.html { redirect_to @bio.user.profile, notice: 'Bio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bios/1
  # DELETE /bios/1.json
  def destroy
    @bio = Bio.find(params[:id])
    @bio.destroy

    respond_to do |format|
      format.html { redirect_to bios_url }
      format.json { head :no_content }
    end
  end
end
