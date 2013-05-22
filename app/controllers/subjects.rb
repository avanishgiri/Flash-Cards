get '/ruby' do 
  @subject = Subject.find_by_name('Ruby')
  erb :subjects
end

get '/skillcrush' do
  @subject = Subject.find_by_name('Skillcrush')
  erb :subjects	
end

get '/command_line' do
  @subject = Subject.find_by_name('Command Line')
  erb :subjects	
end

get '/other' do
  @subject = Subject.find_by_name('Other')
  erb :subjects	
end