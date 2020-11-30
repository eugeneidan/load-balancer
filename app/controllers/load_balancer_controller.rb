class LoadBalancerController < ApplicationController
   @@register = []

   def new
   end
   
   def create
     if params[:ip]
      
      server_ip = params[:ip]
      if @@register.include?(server_ip)
        message = "IP already exists"
        status = "bad_request"
      else
        if @@register.size < 10
          @@register.push(server_ip)
          message = ""
          status = "created"
        else
          message = "IP register full"
          status = "bad_request"
        end
      end
     else
      message = ""
      status ="bad_request"
     end
     render json: { message: message }, status: status.to_sym
   end


end
