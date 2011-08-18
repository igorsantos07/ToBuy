namespace :ar do

  available_tables = ['currencies','tracking_systems']

  desc 'Default values for one of the tables: '+available_tables.join('; ')
  task :default, :table do |t,args|
    puts "Inserting default values into table \"#{args[:table]}\":"

    case args[:table]
    when 'currencies'
        model = Currency
        data = [
          {:code => 'BRL', :name => 'Real brasileiro', :symbol => 'R$'},
          {:code => 'JPY', :name => 'Yen japonês', :symbol => '¥'},
          {:code => 'GBP', :name => 'Libra esterlina', :symbol => '$'},
          {:code => 'USD', :name => 'Dólar americano', :symbol => '$'},
          {:code => 'AUD', :name => 'Dólar australiano', :symbol => '$'},
          {:code => 'CAD', :name => 'Dólar canadense', :symbol => '$'},
          {:code => 'CNY', :name => 'Yuan chinês', :symbol => '¥'}
        ]
    when 'tracking_systems'
      model = TrackingSystem
      data = [
        {:name => 'Correios', :url => 'http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&P_TIPO=001&P_COD_UNI=%s'},
        {:name => 'Muambator', :url => 'http://muambator.com.br/view/%s'},
        {:name => 'EMS', :url => 'http://www.ems-tracking.net/verification.php?number=%s', :method => 'POST'}
      ]
    when 'test'
      model = Account
      data = [{:email => 'test@example,com', :role => 'user'}]
    else
      puts 'Specify a table name: '+available_tables.join('; ')
      exit
    end

    data.each do |line|
      print "\tInserting \"#{line[:name] || line.first[1]}\"... "
      to_create = model.new
      to_create.attributes = line
      result = to_create.save
      puts (result)? "\033[0;32mtrue\033[0m" : "\033[0;31mfalse\033[0m"
    end

  end

# BUG there's something strange with this code, because it can't call the task more than one time
#  desc 'Default values for all available tables'
#  task :default_values do
#    available_tables.each { |table| Rake.application.invoke_task "ar:default[#{table}]" }
#  end
end