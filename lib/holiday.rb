require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_supplies[:summer][:fourth_of_july][1]
end


def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.collect do |season, holidays|
    if season == :winter 
      holidays.collect do |holiday, sup|
        sup.push(supply)
      end 
    end 
  end 
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.collect do |season, holidays|
    if season == :spring 
      holidays.collect do |holiday, sup|
        if holiday == :memorial_day
          sup.push(supply)
        end
      end
    end
  end
end 

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season] = {holiday_name => supply_array}
  holiday_hash
end
   # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten 
end

def all_supplies_in_holidays(holiday_hash)
  
    holiday_hash.collect do |season, holidays|
      puts "#{season.capitalize}:"
      holidays.collect do |holiday, supplies|
        puts "  #{holiday.to_s.split("_").collect {|day|
          day.capitalize}.join(" ")}: #{supplies.join(", ")}"
          end 
        end 
      end  

def all_holidays_with_bbq(holiday_hash)
  with_BBQ = []
  holiday_hash.collect do |season, holidays|
    holidays.collect do |holiday, supplies|
      supplies.collect do |supply|
        if supply == "BBQ"
          with_BBQ.push(holiday)
        end 
      end 
    end 
  end 
  with_BBQ
end 







