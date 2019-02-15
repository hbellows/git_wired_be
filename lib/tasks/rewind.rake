task :rewind do
  dir_path = "#{Dir.pwd}/spec/fixtures/vcr_cassettes"
  FileUtils.rm_rf Dir.glob(dir_path) if dir_path.present?
  print 'Rewind Complete - All Cassettes Removed'
end