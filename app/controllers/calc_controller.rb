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

  def final_result(mas)
    cnt_ok = 0.0
    mas.each { |item| cnt_ok += 1 if item == '✅' }
    stat = (cnt_ok / mas.length * 100).round(2)
    add_statistics stat
    stat
  end

  def result
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
        res_analysis = analysis(dl, @@mas)
        @result = [@@mas, res_analysis, (1.00/dl[-1].to_i).round(2), final_result(res_analysis), current_user.id]
        @@mas = []
        @@fl = 0
      end
    end
  end

  def add_statistics(stat)
    @users_stat = current_user.email
  end

end