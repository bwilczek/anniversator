module Web
  module Controllers
    module SpecialDays
      class Index
        include Web::Action

        expose :special_days

        def call(params)
          @special_days = SpecialDayRepository.new.all
        end
      end
    end
  end
end
