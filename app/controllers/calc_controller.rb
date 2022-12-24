# frozen_string_literal: true

# Controller with Turbo AJAX
class CalcController < ApplicationController
  include CalcHelper

  @@mas = []
  @@start = 0
  @@fl = 0

  def progress
    @progress = []
    actions = Action.all
    actions.each do |action|
      if action.user_id == current_user.id
        @progress.push(action.gen_results)
      end
    end
    if @progress.length.zero?
      0
    else
      (@progress.sum / @progress.length).round(2)
    end
  end

  def result
    if params[:clean]
      clean
    else
      dl = params[:dl]
      if dl.nil?
        @result = 'Сначала нужно выбрать длительность'
      else
        if params[:a_button]
          if @@fl == 0
            @@fl += 1
          elsif @@fl == 1
            @@fl += 1
            @@start = Time.now
          else
            finish = Time.now
            delta = (finish - @@start).round(4)
            @@mas.push(delta)
          end
          @@start = Time.now
        elsif params[:b_button]
          if @@mas.length < 3
            @result = 'Кликните не менее 3-х раз'
          else
            if dl == 'Hard'
              res_analysis = hard_level_analysis @@mas
            else
              res_analysis = analysis(dl, @@mas)
            end
            final_res = final_result(res_analysis, dl)
            @result = [@@mas, res_analysis, (1.00 / dl[-1].to_i).round(2), final_res, User.find(current_user.id).email, dl]
            @@mas = []
            @@fl = 0
          end
        end
      end
    end
  end

end