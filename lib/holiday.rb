require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
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
  # return the second element in the 4th of July array

  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season.to_sym][holiday_name.to_sym] = supply_array

  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies_array = []

  holiday_hash[:winter].each do |event, supplies_array|
    winter_supplies_array += supplies_array
  end

  winter_supplies_array
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, events|
     # => {:winter => {:christmas => ["supplies"], :new_years => ["supplies"]}}
     # events = {:christmas => ["supplies"], :new_years => ["supplies"]}

    season_string = season.to_s.capitalize! + ":"
    puts season_string

    events.each do |event, supplies_array|
      #:christmas => ["supplies"]

      #need to grab event name, split into array, capitalize each array element
      #then join array into string with " " between words

      event_array = event.to_s.delete(":").split("_")
      capitalized_event_array = []
      event_array.each do |word|
        capitalized_event_array.push(word.capitalize)
      end
      capitalized_event_string = capitalized_event_array.join(" ")

      #event_string will be be printed out once completed for each event

      event_string = "  " + capitalized_event_string + ": "

      #iterator to go thorugh current array of supplies
      #continuing to construct event_string

      supplies_array.each do |array_element|
        #["supply1", "supply2"]
        string_element = array_element.to_s
        event_string += string_element
        array_position = supplies_array.index(array_element) + 1
        if array_position < supplies_array.size
          event_string += ", "
        end
      end

      #completed event_string for the current event!
      puts event_string
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_array = []

  holiday_hash.each do |season, events|
     # => {:winter => {:christmas => ["supplies"], :new_years => ["supplies"]}}
     # events = {:christmas => ["supplies"], :new_years => ["supplies"]}

     events.each do |event, supplies_array|
       #:christmas => ["supplies"]

       supplies_array.each do |array_element|
         #["supply1", "supply2"]

         if array_element == "BBQ"
           bbq_array.push(event)
         end
       end

     end
   end

   bbq_array
end
