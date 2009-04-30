module DenisJ
  module CustomForm
    module FormHelper

      def method_missing_with_label(method_name,*args)
        if method_name.to_s =~ /^custom_/
          options    = args.extract_options!
          label_text = options.delete(:label)
          args << options

          object_name = args.shift
          method = args.shift

          # build input field
          field_html = send(method_name.to_s.sub(/^custom_/,""), object_name, method,*args)

          # build 'div input' containing the input field
          input_html = content_tag('div', "#{field_html}", :class => "input")

          # build label tag
          label_html = label(object_name, method, label_text, {})

          # build 'div info' containing the label tag
          info_html = content_tag('div', "#{label_html}", :class => 'info')

          # build 'div field' containing 'div info' and 'div input'
          content_tag('div', "#{info_html} #{input_html}", :class => "field")
        else
          method_missing_without_label(method_name,*args)
        end
      end

    end
  end
end