module EnumHelper
  def enum_select_i18n(class_name, enum, has_value:false)
    class_name.send(enum.to_s.pluralize).map do |key, value|
      [find_i18n_string(class_name, enum, key), (has_value ? value : key)]
    end
  end

  def find_i18n_string(class_name, enum, key)
    I18n.t("activerecord.attributes
            .#{class_name.model_name.i18n_key}
            .#{enum.to_s.pluralize}.#{key}")
  end
end
