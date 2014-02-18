require "ninja_server/version"
require "ninja_server/tiny_server"

module NinjaServer
  defaultDir = './public' if Dir.exists?('public')
  defaultDir = Dir.pwd unless defaultDir

  s = TinyServer.new(
    ARGV[0] || 1337,
    ARGV[1] || defaultDir
  )

  trap('INT') { s.shutdown }

  s.start
end
