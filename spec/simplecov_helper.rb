require 'simplecov'


SimpleCov.start 'rails' do
  add_filter '/spec/'
  add_filter '/config/'

end
