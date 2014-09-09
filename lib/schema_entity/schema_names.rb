# Encoding: utf-8
module SchemaEntity
  # Attribute names of value types
  module SchemaNames
    # Names for DayOfWeek
    def self.days_of_week
      { 'DayOfWeek' => [:day_of_week] }
    end
    # Names for DateTime
    def self.date_times
      { 'DateTime' => [:arrival_time, :availability_ends,
                       :availability_starts, :available_from,
                       :available_through, :web_checkin_time,
                       :booking_time, :checkin_time, :checkout_time,
                       :date_issued, :departure_time, :door_time,
                       :dropoff_time, :end_time, :expected_arrival_from,
                       :expected_arrival_until, :modified_time, :order_date,
                       :owned_from, :owned_through, :payment_due,
                       :pickup_time, :scheduled_time, :start_time,
                       :temporal, :valid_from, :valid_through] }
    end
    # Names for Date
    def self.dates
      { 'Date' => [:birth_date, :comment_time, :date_created,
                   :date_modified, :date_posted, :date_published,
                   :death_date, :dissolution_date, :end_date,
                   :expires, :founding_date, :guideline_date,
                   :last_reviewed, :previous_start_date, :price_valid_until,
                   :release_date, :start_date, :upload_date,
                   :valid_until] }
    end
    # Names for Duration
    def self.durations
      { 'Duration' => [:activity_duration, :cook_time, :duration,
                       :estimated_flight_duration, :opening_hours, :prep_time,
                       :processing_time, :time_required, :total_time,
                       :valid_for] }
    end
    # Names for Time
    def self.times
      { 'Time' => [:closes, :opens] }
    end
    # Names for URL
    def self.urls
      { 'URL' => [:accepts_reservations, :additional_type, :ticket_token,
                  :application_category, :application_sub_category, :warning,
                  :code_repository, :content_url, :discussion_url, :payment_url,
                  :download_url, :embed_url, :tracking_url, :has_map, :url,
                  :image, :install_url, :is_based_on_url, :label_details,
                  :license, :logo, :memory_requirements, :menu, :named_position,
                  :feature_list, :prescribing_info, :publishing_principles,
                  :related_link, :release_notes, :reply_to_url, :requirements,
                  :same_as, :screenshot, :service_url, :significant_link,
                  :storage_requirements, :target_url, :thumbnail_url] }
    end
    # Names for Number
    def self.numbers_one
      { 'Number' => [:amount_of_this_good, :base_salary, :best_rating,
                     :billing_increment, :child_max_age, :child_min_age,
                     :cost_per_unit, :discount, :dose_value, :elevation,
                     :high_price, :latitude, :longitude, :low_price, :max_price,
                     :max_value, :min_price, :min_value, :num_adults, :price,
                     :number_of_episodes, :number_of_seasons, :party_size,
                     :ratin_count, :repetitions, :review_count, :worst_rating,
                     :step_value, :strength_value, :suggested_max_age,
                     :to_location, :total_price, :value, :value_max_length,
                     :value_min_length, :value_pattern, :version] }
    end
    # Names for Number
    def self.numbers_two
      { 'Number' => [:copyright_year, :from_location, :num_children,
                     :stage_as_number, :suggested_min_age] }
    end
    # Names for Number
    def self.numbers
      hash = numbers_one
      hash['Number'] << numbers_two['Number']
      hash
    end
  end
end
