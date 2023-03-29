# frozen_string_literal: true

module HexletCode
  # class Form
  class Form
    def initialize(entity)
      # entity.to_h.each { |key, value| instance_variable_set("@#{key}", value) }
      @entity = entity
      @output_buffer = []
    end

    def input(name, **options)
      label = options.fetch(:label, name.to_s.capitalize)
      type = options[:as] || :string
      value = @entity.to_h.key?(name) ? @entity.public_send(name) : nil
      attributes = options.except(:label, :as)

      input_field(name, type, label, value, attributes)
    end

    # create html for button
    def submit(name = 'Save')
      @output_buffer << "\n<input type=\"submit\" value=\"#{name}\">"
    end

    def render
      @output_buffer.join
    end

    private

    # rubocop:disable Metrics/MethodLength
    def input_field(name, type, label, value, attributes)
      input_attrs = attributes.map { |attr, val| "#{attr}=\"#{val}\"" }.join(' ')

      label_tag = "<label for=\"#{name}\">#{label}</label>"

      input_tag = if value.nil?
                    # raise NoMethodError, "undefined method `#{name}' for #{@entity}"
                    public_send(name)
                  else
                    {
                      # rubocop:disable Layout/LineLength
                      string: "\n#{label_tag}\n<input type=\"text\" id=\"#{name}\" name=\"#{name}\" value=\"#{value}\"#{input_attrs}>",
                      password: "\n#{label_tag}\n<input type=\"password\" id=\"#{name}\" name=\"#{name}\" value=\"#{value}\"#{input_attrs}>",
                      text: "<textarea id=\"#{name}\" name=\"#{name}\" #{input_attrs}>#{value}</textarea>"
                      # rubocop:enable Layout/LineLength
                    }[type]
                  end

      @output_buffer << input_tag
    end
    # rubocop:enable Metrics/MethodLength
  end
end
