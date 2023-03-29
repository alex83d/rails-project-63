# frozen_string_literal: true

require_relative 'hexlet_code/version'

# generator form
module HexletCode
  class Error < StandardError; end
  autoload(:Tag, File.expand_path('hexlet_code/tag', __dir__))
  autoload(:Form, File.expand_path('hexlet_code/form', __dir__))

  def self.form_for(entity, url: '#', **attributes)
    form_attributes = attributes.merge(action: url)
    form_attributes[:method] ||= 'post'
    form_attributes[:id] ||= "#{entity.class.to_s.downcase}_form"
    form_attributes[:name] ||= "#{entity.class.to_s.downcase}_form"

    builder = Form.new(entity)
    Tag.build('form', form_attributes) do
      yield(builder) if block_given?
    end
  end
end

# User = Struct.new(:name, :job, :gender, keyword_init: true)
# user = User.new name: 'rob', job: 'hexlet', gender: 'm'

# res = HexletCode.form_for user do |f|
#   f.input :name
#   f.input :job
#   f.input :age
# end

# puts res
