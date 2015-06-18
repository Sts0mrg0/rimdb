module Utils

  def self.load_fixture(name)
    puts FileUtils.pwd
    path = File.join(File.dirname(File.expand_path(__FILE__)), 'fixtures', name)
    raise StandardError.new "Unable to locate fixture #{path}" unless File.exists? path
    File.read path
  end

end
