class Sneaker < ApplicationRecord
    validates :name, presence:{message:'は、必須項目です。'}
    validates :price, numericality:{only_integer:true, 
                                    greater_than:0, 
                                    message:'は、1以上の数値を入力してください。'}
    validates :color, color:{message:'はホワイト、ブラック、パープル、レッド、ブルーのみ入力可能です。'}
end
