module CalcHelper

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

  def clean
    list_clean = Action.all
    list_clean.each { |item| item.destroy if item.user_id == current_user.id }
    @user = User.find(current_user.id)
    @user.statistics = 0
    @user.save
  end

  def add_statistics(stat)
    @user = User.find(current_user.id)
    @user.statistics = stat
    @user.save
  end

end
