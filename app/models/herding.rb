class Herding < ApplicationRecord
    belongs_to :dog
    before_save :compute_final_points

    validates :category, presence: true
    validates :points, presence: true, numericality:{ only_integer: true, message: "must be an integer" }
    validates :num_dogs, numericality:{ only_integer: true, message: "must be an integer" }, allow_blank: true
    validates :position, numericality:{ only_integer: true, message: "must be an integer" }, allow_blank: true
    validate :position_and_num_dogs_presence_for_iht
    validate :points_range

    private

    def position_and_num_dogs_presence_for_iht
        if ["IHT1", "IHT2", "IHT3"].include?(category)
            if position.blank? || num_dogs.blank?
                errors.add(:base, "V kategorii #{category} musí být specifikován počet účastníků a pozice psa.")
            end
        end
    end

    def compute_final_points
        case category
        when "NHAT"
            self.final.points = 30
        when "HWT"
            self.final_points = self.points
        when "IHT1", "IHT2", "IHT3"
            self.final_points = compute_iht_points
        end
    end

    def compute_iht_points
        case category
        when "IHT1"
            self.final_points = (self.points * 1.5).round
        when "IHT2"
            self.final_points = (self.points * 2)
        when "IHT3"
            self.final_points = (self.points * 2.5).round
        end
        self.final_points += position_points
        self.final_points += ranking_points
    end

    def position_points
        case position
        when 1
            15
        when 2
            10
        when 3
            5
        else 
            0
        end
    end

    def ranking_points
        (self.num_dogs - self.position) * 5
    end

    def points_range
        case category
        when "HWT", "IHT1"
          unless (60..100).include?(points)
            errors.add(:base, message: "Počet bodů v kategorii #{category} musí být mezi 60 a 100.")
          end
        when "IHT2"
            unless (72..120).include?(points)
                errors.add(:base, message: "Počet bodů v kategorii #{category} musí být mezi 72 a 120.")
            end
        when "IHT3"
            unless (90..150).include?(points)
                errors.add(:base, message: "Počet bodů v kategorii #{category} musí být mezi 90 a 150.")
            end
        end
    end
    
end

