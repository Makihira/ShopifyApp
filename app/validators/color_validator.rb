class ColorValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        unless value == "ホワイト" or 
           value == "ブラック" or
           value == "ブルー" or
           value == "パープル" or 
           value == "レッド" 
           #エラーメッセージの追加
           record.errors[attribute] << (options[:message] || "is not a color")
        end
    end
end