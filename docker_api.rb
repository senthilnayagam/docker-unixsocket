

# inspired by this code
# http://code.google.com/p/semicomplete/source/browse/codesamples/ruby-supervisorctl.rb?spec=svn3046&r=3046

require "net/http"
require "socket"


class DockerApi

def initialize(socket="/var/run/docker.sock")
@sock = Net::BufferedIO.new(UNIXSocket.new(socket))
end  

def version
get("/version")
end

def info
  get("/info") 
end  

def images(size=false)
if size
get("/images/json?all=1") 
else    
get("/images/json?all=0")
end
end  


def get(uri)
@request = Net::HTTP::Get.new(uri)
@request.exec(@sock, "1.1", uri)
process_response 
end

def post(uri,post_data={})
@request = Net::HTTP::Post.new(uri)
@request.set_form_data(post_data)
@request.exec(@sock, "1.1", uri)
process_response
end  

def delete(uri)
@request = Net::HTTP::Delete.new(uri)
@request.exec(@sock, "1.1", uri)
process_response 
end  

def put(uri,put_data={})
@request = Net::HTTP::Put.new(uri)
@request.set_form_data(put_data)
@request.exec(@sock, "1.1", uri)
process_response
end  
  
private
  
def process_response
begin
  response = Net::HTTPResponse.read_new(@sock)
end while response.kind_of?(Net::HTTPContinue)
  response.reading_body(@sock, @request.response_body_permitted?) { }

return [response.code,response.body]
end  

  
end  

