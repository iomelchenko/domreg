class NsName < ActiveRecord::Base

  after_initialize :default_values

  attr_accessible :user_id, :ns1, :ns2

  belongs_to      :user

  private
    def default_values
      self.ns1 ||= 'ns1.hostfabrica.ru'
      self.ns2 ||= 'ns2.hostfabrica.ru'
    end
end