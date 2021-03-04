class Mycontact < ApplicationRecord
    validates :name, presence:{message:'は、必須項目です。'}
    validates :age, numericality:{message:'は、数字で入力してください。'}
    validates :nationality, inclusion:{in:[true,false], message:'は、真偽値です。'}
end
