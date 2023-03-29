# frozen_string_literal: true

require 'cgi'

# module HexletCode
module HexletCode
  # Tag module
  module Tag
    SINGL_TAGS = {
      'br' => true,
      'img' => true,
      'input' => true,
      'area' => true,
      'base' => true,
      'col' => true,
      'command' => true,
      'embed' => true,
      'hr' => true,
      'keygen' => true,
      'meta' => true,
      'param' => true,
      'source' => true,
      'track' => true,
      'wbr' => true
    }.freeze

    def self.build(name, attributes = {})
      body = yield if block_given?

      if SINGL_TAGS.include?(name)
        attributes.empty? ? "<#{name}>" : "<#{name}#{attr_str(attributes)}>"
      elsif body.nil?
        attributes.empty? ? "<#{name}></#{name}>" : "<#{name}#{attr_str(attributes)}></#{name}>"
      else
        attributes.empty? ? "<#{name}>#{body.join}</#{name}>" : "<#{name}#{attr_str(attributes)}>#{body.join}</#{name}>"
      end
    end

    def self.attr_str(attributes)
      attributes.map do |key, value|
        if value == ''
          "#{CGI.escape_html(key.to_s)}='#'"
        else
          " #{CGI.escape_html(key.to_s)}=\"#{CGI.escape_html(value.to_s)}\""
        end
      end.join
    end
  end
end
