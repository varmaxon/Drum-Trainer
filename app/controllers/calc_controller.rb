# frozen_string_literal: true

# Controller with Turbo AJAX
class CalcController < ApplicationController

  def result
    start = Time.now
    cnt = 0
    10000000.times { |i| cnt += i }
    finish = Time.now

    @result = finish - start
  end

end