desc 'Check the dependencies and start the app'
task :start do
  if File.file?('tmp/rack.pid')
    puts 'The server is already running! (tmp/rack.pid exists!)'
    exit 1
  else
    system('mkdir tmp') unless File.directory? 'tmp'
    system('rackup -D --pid tmp/rack.pid')
  end
end

desc 'Stop the server'
task :stop do
  if File.file?('tmp/rack.pid')
    Process.kill 'TERM', File.read('tmp/rack.pid').to_i
    File.delete 'tmp/rack.pid'
  else
    puts 'The server is not running! (tmp/rack.pid doesn\'t exists!)'
  end
end
