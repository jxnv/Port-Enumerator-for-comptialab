require 'socket'

def scan_ports(target, start_port, end_port)
  open_ports = []

  mutex = Mutex.new
  threads = []

  (start_port..end_port).each do |port|
    threads << Thread.new do
      begin
        socket = TCPSocket.new(target, port)
        mutex.synchronize { open_ports << port }
        socket.close
      rescue Errno::ECONNREFUSED, Errno::ETIMEDOUT
        next
      end
    end
  end

  threads.each(&:join)

  open_ports
end

# Main Usage of script here in this section
# ===========================================================================
target_ip = '192.168.0.6' # Replace with the required IP address or hostname
start_port = 1 # Replace with desired start point of port scan
end_port = 100 # Replace with desired endpoint of port scan
# ===========================================================================

result_file = File.open('scanresults.txt', 'w')

result_file.puts "Scanning ports #{start_port}-#{end_port} on #{target_ip}..."
open_ports = scan_ports(target_ip, start_port, end_port)

puts open_ports

result_file.puts "Open ports: #{open_ports.join(', ')}"

result_file.close

puts "Scan results written to scanresults.txt"
