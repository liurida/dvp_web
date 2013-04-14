module DvpToolHelper

  def breadcrumb(t_type, obj)
    if t_type == 'ec'
      t_study = link_to obj.dvp.study.name, show_study_path(obj.dvp.study)
      t_dvp = link_to obj.dvp.name, show_dvp_path(obj.dvp)
      t_ec = obj.to_s
    elsif t_type == 'dvp'
      t_study = link_to obj.study.name, show_study_path(obj.study)
      t_dvp = link_to obj.name, show_dvp_path(obj)
      t_ec = nil
    elsif t_type == 'study'
      t_study = link_to obj.name, show_study_path(obj)
      t_dvp = nil
      t_ec = nil
    end

    output = '<ul class="breadcrumb">'
    output <<  "<li>" + t_study + '<span class="divider"> /</span></li>' if t_study
    output <<  "<li>" + t_dvp + '<span class="divider"> /</span></li>' if t_dvp
    output <<  "<li>" + t_ec + '<span class="divider"> /</span></li>' if t_ec
    output <<  "</ul>"
    raw(output)

#    render  :partial => "breadcrumb",
#            :locals => {:t_study => t_study,
#                        :t_dvp =>  t_dvp,
#                        :t_ec =>  t_ec}
  end

  def current_domain
    if session[:domain]
      domain_name =  session[:domain]
    else
      domain_name = 'All'
    end
    raw("<h4>#{domain_name}</h4>")
  end

  def ec_cols(view_name='ctt')
    #define the ec_cols for different role (ctt, cda, ctom)
    col_name = Hash.new
    col_name['ctt'] = %w(name description check_method)
    col_name['ctom'] =col_name['ctt'] + %w(reviewer proc_name)
    col_name['cda'] = col_name['ctom'] + %w(programmed_status tested_status)
    col_name['tester'] = col_name['cda']
    col_name['all'] = col_name['cda']
    return col_name[view_name]
  end

  def disable_except(*role_list)
    role_list = role_list.map{|i| i.upcase}.sort
    user_roles = current_user.study_members(:study => @dvp.study).map {|item| item.role.blank? ? nil : item.role.name }.sort
    p role_list
    p user_roles
    if user_roles - role_list == user_roles
      true
    else
      false
    end
  end


  def show_col_value(obj, key)
    if key == 'programmed_status' and session[:ec_view]=='cda'
      render :partial => "programmed_status_form", :locals => {:ec => obj}
    elsif key == 'tested_status' and session[:ec_view]=='tester'
      render :partial => "tested_status_form", :locals => {:ec => obj}
    else
      obj[key]
    end
  end

  def comment_filter(obj)
    if !params[:comment_to].blank? and ['ctom','cda','tester'].include? params[:comment_to]
      where_c = "%#{params[:comment_to]}%"
      results = obj.comments.where("comment like ?", where_c).where("created_at > ?", Date.today-1.month).reverse
    else
      results = obj.comments.where("created_at > ?", Date.today-1.month).reverse
    end
  end

  def ec_editable?
    if current_user.studies.include? @dvp.study
      true
    else
      false
    end
  end

  def ec_destroyable?
    if ec_editable? and
        current_user.study_members(:study => @dvp.study).map {|item| item.role.blank? ? nil : item.role.name  }.include? 'CTOM'
      true
    else
      false
    end

  end
end
