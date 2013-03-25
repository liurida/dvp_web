class EcItem < ActiveRecord::Base
  REVIEWER =%w(DM_REVIEW INV_REVIEW CRA_REVIEW)
  belongs_to :dvp
  belongs_to :domain
  attr_accessible :author, :compiled_status, :creation_ts,
              :restriction,:description,
              :message, :modification_ts, :modified_by, :name, :proc_name,
              :reviewer, :tested_status,:dvp_id, :domain_id
  def to_s
    self.name
  end
  # validates_inclusion_of :compiled_status, :in=> ['Y','N']
  # validates_inclusion_of :tested_status, :in=> ['Y','N']
  # validates_inclusion_of :reviewer, :in=> REVIEWER,allow_nil: true
end
