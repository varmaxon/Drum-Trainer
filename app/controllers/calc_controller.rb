# frozen_string_literal: true

# Controller with Turbo AJAX
class CalcController < ApplicationController
  def init_mas(num)
    mas = []
    mas[0] = 0
    mas[1] = 0
    i = 2
    (num - 2).times do
      mas[i] = 1
      i += 1
    end
    mas
  end

  def init_one(num, mas, k_iter = 2)
    (num - 2).times do
      break if k_iter * k_iter >= num

      if mas[k_iter] == 1
        l = k_iter * k_iter
        while l <= num
          mas[l] = 0
          l += k_iter
        end
      end
      k_iter += 1
    end
    mas
  end

  def find_prime_numbers(num)
    mas = init_mas num
    mas = init_one num, mas
    massive = []
    mas.each_index do |item|
      massive.push(item) if mas[item] == 1
    end
    massive
  end

  def foo_request(mas, num)
    array = []
    (mas.length - 1).times do |i|
      array.push([mas[i], mas[i + 1]]) if (mas[i] >= num) && (mas[i] <= 2 * num) && (mas[i + 1] - mas[i] == 2)
    end
    array
  end

  def result
    n = params[:numbers]
    @input_data = n
    n = n.to_i
    @result = find_prime_numbers(n * 2)
    @result = foo_request @result, n  # не заходит в функции, по-моему
    @result = [['ERROR', 'not found numbers']] if @result.length.zero?
  end
end