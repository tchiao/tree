module EntriesHelper

  def current_date_val(num)
    unless num == nil
      sprintf('%02i', num)
    end
  end

end
