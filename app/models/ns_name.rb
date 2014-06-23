class NsName < ActiveRecord::Base

  after_initialize :default_values

  attr_accessible :user_id, :ns1, :ns2

  belongs_to      :user

  private
    def default_values
      self.ns1 ||= Param.find_by_params('ns1_default').values
      self.ns2 ||= Param.find_by_params('ns2_default').values
    end
end