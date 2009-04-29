module DenisJ
  module CustomForm
    module FormBuilder
      
      def method_missing_with_label(method_name, *args)
        if method_name.to_s =~ /^custom_/
          @template.send(method_name, @object_name, *args)
        else
          method_missing_without_label(method_name,*args)
        end
      end
      
    end
  end
end