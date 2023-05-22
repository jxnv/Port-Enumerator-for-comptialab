# Port Scanner

This is a simple port scanner script written in Ruby. It allows you to scan a range of ports on a target IP address or hostname and determine which ports are open.

## Usage

1. Update the following variables in the code:

   - `target_ip`: Replace with the desired IP address or hostname of the target.
   - `start_port`: Replace with the desired start point of the port scan.
   - `end_port`: Replace with the desired endpoint of the port scan.

2. Run the script:

   ```shell
   ruby port_scanner.rb
This will scan the specified range of ports on the target and display the list of open ports.

View the scan results:

The script will write the scan results to a file named scanresults.txt. Open the file to view the list of open ports.

Example
Here is an example of how to use this port scanner:

ruby
Copy code
# Set the target IP address or hostname and the port range
target_ip = '192.168.0.6'
start_port = 1
end_port = 100

# Scan the ports and retrieve the list of open ports
open_ports = scan_ports(target_ip, start_port, end_port)

# Display the list of open ports
puts "Open ports: #{open_ports.join(', ')}"
This will scan the ports 1 to 100 on the target IP address 192.168.0.6 and display the list of open ports.

Note
This script uses multi-threading to scan multiple ports concurrently, which can significantly speed up the scanning process. However, please use this tool responsibly and ensure that you have proper authorization to scan the target.
