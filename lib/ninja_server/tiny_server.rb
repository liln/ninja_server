require 'socket'
require 'uri'

class TinyServer
  def initialize(port,root)
    @port = port
    @root = root
  end

  CONTENT_TYPE_MAPPING = {
    'html' => 'text/html',
    'txt' => 'text/plain',
    'png' => 'image/png',
    'jpg' => 'image/jpeg'
  }

  DEFAULT_CONTENT_TYPE = 'application/octet-stream'

  def start
    server = TCPServer.new("localhost", @port) # Server bound to port

    loop do
      client = server.accept    # Wait for a client to connect
      request = client.gets
      STDERR.puts request
      path = requested_file(request)

      path = File.join(path, 'index.html') if File.directory?(path)

      if File.exist?(path) && !File.directory?(path)
        File.open(path,"rb") do |file|
          client.print "HTTP/1.1 200 OK\r\n" + #status
                       "Content-Type: #{content_type(file)}\r\n" +
                       "Content-Length: #{file.size}\r\n" +
                       "Connection: close\r\n" +
                       "\r\n"
          IO.copy_stream(file,client)
        end
      else
        message = "File not found\n"
        client.print "HTTP/1.1 404 Not Found\r\n" +
                     "Content-Type: text/plain\r\n" +
                     "Content-Length: #{message.size}\r\n" +
                     "Connection: close\r\n" +
                     "\r\n"
        client.print message
      end
      client.close
    end
  end

  def shutdown
    exit
  end

  private
    # helper method to obtain content type from file extension
    def content_type(path)
      ext = File.extname(path).split('.').last
      CONTENT_TYPE_MAPPING.fetch(ext, DEFAULT_CONTENT_TYPE)
    end

    # helper method to generate path on server
    def requested_file(request_line)
      request_uri = request_line.split(' ')[1]
      path = URI.unescape(URI(request_uri).path)

      clean = []

      parts = path.split('/')
      parts.each do |part|
        next if part.empty? || part == '.'
        part == '..' ? clean.pop : clean << part
      end

      File.join(@root, *clean)
    end
end
