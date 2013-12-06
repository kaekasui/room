step 'access the :page page.' do |page|
  case page
    when 'HOME' then visit root_path
  end
end
