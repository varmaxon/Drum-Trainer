# frozen_string_literal: true

# Controller with Turbo AJAX
class CalcController < ApplicationController

  @@mas = []
  @@start = 0
  @@fl = true

  def result
    if params[:a_button]
      if @@fl
        @@start = Time.now
        @@fl = false
      else
        finish = Time.now
        delta = (finish - @@start).round(2)
        @@mas.push(delta)
      end
      @@start = Time.now
    else
      @result = @@mas
      @@mas = []
      @@fl = true
    end
  end

end