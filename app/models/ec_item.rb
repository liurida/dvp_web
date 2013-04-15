class EcItem < ActiveRecord::Base
  acts_as_commentable

  REVIEWER =%w(DM_REVIEW INV_REVIEW CRA_REVIEW)
  CHECK_METHOD = %w(AUTO MANUAL)
  belongs_to :dvp
  belongs_to :domain
  attr_accessible :author,  :creation_ts,
              :restriction,:description,
              :message, :modification_ts, :modified_by, :name, :proc_name,
              :reviewer, :tested_status,:dvp_id, :domain_id, :programmed_status,
              :check_method, :removed

  def to_s
    self.name
  end

  def list_reviewer
    REVIEWER
  end

  def list_check_method
    CHECK_METHOD
  end
  # validates_inclusion_of :compiled_status, :in=> ['Y','N']
  # validates_inclusion_of :tested_status, :in=> ['Y','N']
  # validates_inclusion_of :reviewer, :in=> REVIEWER,allow_nil: true
end
