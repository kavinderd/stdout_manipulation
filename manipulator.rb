# Messing around with printing and updating to stdout

module Manipulator

  extend self

  # Timer

  def timer(seconds)
    current = 1
    puts "Timer:"
    until current == seconds
      print "\r"
      print "Seconds Passed: #{current}"
      sleep 1
      current += 1
    end
    print "\n"
    puts "Times Up!"
  end

  # Simple Countdown
  def countdown(from)
    print "READY"
    sleep 1
    print "\r"
    from.downto(0) do |i|
      print "Countdown: #{i}"
      sleep 1
      print "\r"
    end
    print "WooHoo"
  end

  # Watch a file
  def file_status
    create_file unless File.exists?("test.txt")
    puts "Watching File: test.txt"
    puts "First line:"
    loop do
      readlines = File.readlines("test.txt")
      print readlines[0].sub("\n", "")
      sleep 5
      print "\r"
    end
  end

  def create_file
    File.open("test.txt","w+") do |file|
      file.write("This is the default first line\n")
    end
  end


end
