class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :destroy]

  def index
    @entries = Entry.all

    render json: EntrySerializer.new(@entries)
  end

  def show
    render json: @entry
  end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      render json: EntrySerializer.new(@entry), status: :created, location: @entry
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params.require(:entry).permit(:message, :user_id)
  end
end
