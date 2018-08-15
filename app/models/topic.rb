  class Topic < ActiveRecord::Base
    belongs_to :student
    has_many :subjects

    validates :title, :presence => true
    validates :lab, :presence => true


    accepts_nested_attributes_for :subjects
    # scope :two_subjects_or_more, -> {)}

     def self.two_subjects_or_more
       self.select {|topic| topic.subjects.size > 2 }
     end


  end
