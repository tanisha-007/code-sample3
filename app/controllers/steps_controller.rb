class StepsController < InheritedResources::Base
  
  def index
    @steps = Step.all
    respond_to do |format|
      format.html
      format.csv { send_data @steps.to_csv}
    end
  end

  def update
    update!(:notice => "Great! Step has updated successfully.") { steps_url }
  end

  def import
    Step.import(params[:import][:step_csv])
    redirect_to steps_path
  end

  private

    def step_params
      params.require(:step).permit(:title)
    end

end
