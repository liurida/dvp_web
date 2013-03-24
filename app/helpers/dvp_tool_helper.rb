module DvpToolHelper
  def breadcrumb(t_type, obj)
    if t_type == 'ec'
      t_study = link_to obj.dvp.study.name, show_study_path(obj.dvp.study)
      t_dvp = link_to obj.dvp.name, show_dvp_path(obj.dvp)
      t_ec = obj
    elsif t_type == 'dvp'
      t_study = link_to obj.study.name, show_study_path(obj.study)
      t_dvp = link_to obj.name, show_dvp_path(obj)
      t_ec = nil
    elsif t_type == 'study'
      t_study = link_to obj.name, show_study_path(obj)
      t_dvp = nil
      t_ec = nil
    end
    render  :partial => "breadcrumb",
            :locals => {:t_study => t_study,
                        :t_dvp =>  t_dvp,
                        :t_ec =>  t_ec}
  end

end
