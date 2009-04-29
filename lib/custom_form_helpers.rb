require 'denisj/customform/form_builder'
require 'denisj/customform/form_helper'

ActionView::Helpers::FormHelper.send(:include, DenisJ::CustomForm::FormHelper)
ActionView::Helpers::FormHelper.alias_method_chain :method_missing, :label

ActionView::Base.send(:include, DenisJ::CustomForm::FormHelper)

ActionView::Helpers::FormBuilder.send(:include, DenisJ::CustomForm::FormBuilder)
ActionView::Helpers::FormBuilder.alias_method_chain :method_missing, :label