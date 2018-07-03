#!/usr/bin/env python2

import socket
import SocketServer, SimpleHTTPServer

IP = "127.0.0.1"
PORT = 12072

class AMIServer(SimpleHTTPServer.SimpleHTTPRequestHandler):
	def do_GET(self):
			SimpleHTTPServer.SimpleHTTPRequestHandler.do_GET(self)


print "Starting AM Instant Server on " + IP + ":" + str(PORT)

SocketServer.TCPServer.allow_reuse_address = True
server = SocketServer.TCPServer(('', PORT), AMIServer)
server.serve_forever()
