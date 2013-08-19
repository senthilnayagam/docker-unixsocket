require 'pp'
load "docker_api.rb"

 def dump(response)
 code,body =  response
 pp code
 pp body 
  end 


d = DockerApi.new

puts "version"
dump d.get("/version")

#dump d.get("/containers/json") 

puts "containers"
 dump d.get("/containers/json?all=1&size=1")
 
 
 
 
puts "images" 
 dump d.get("/images/json?all=0")
puts "images with size" 
 dump d.get("/images/json?all=1") 

puts "images viz" 
 dump d.get("/images/viz")  


 dump d.get("/info") 

# dump d.get("/events?since=1374067924")
# dump d.get("/info")
# dump d.get("/info")


dump d.post("/images/create?fromImage=base",{})