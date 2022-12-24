# frozen_string_literal: true

# Controller with Turbo AJAX
class CalcController < ApplicationController

  @@mas = []
  @@start = 0
  @@fl = 0

  def analysis(dl, mas)
    beats_sec = dl[-1].to_i
    mas_res = []
    mas.each do |item|
      delta = (item - (1.0/beats_sec).round(2)).abs
      if delta >= 0.05/beats_sec
        mas_res.push((delta.abs * 100).round(2))
      else
        mas_res.push('✅')
      end
    end
    mas_res
  end

  def final_result(mas, dl)
    cnt_ok = 0.0
    mas.each { |item| cnt_ok += 1 if item == '✅' }
    stat = (cnt_ok / mas.length * 100).round(2)

    Action.create(gen_results: stat, user_id: current_user.id) if stat != 0

    sr_stat = progress
    add_statistics(sr_stat) if dl == 'Hard' || ((stat * sr_stat != 0) && (mas.length / dl[-1].to_i >= 5))
    
    stat
  end

  def hard_level_analysis(mas)
    mas_res = []
    mas.each_index do |item|
      if item % 4 != 3
        if (mas[item] - 1.25).abs > 0.07
          mas_res.push(((mas[item] - 1.25).abs * 100).round(2))
        else
          mas_res.push('✅')
        end
      else
        if (mas[item] - 0.25).abs > 0.07
          mas_res.push(((mas[item] - 0.25).abs * 100).round(2))
        else
          mas_res.push('✅')
        end
      end
    end
    mas_res
  end

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
      Action.destroy_all
      @user = User.find(current_user.id)
      @user.statistics = 0
      @user.save
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

  def add_statistics(stat)
    @user = User.find(current_user.id)
    @user.statistics = stat
    @user.save
  end

end