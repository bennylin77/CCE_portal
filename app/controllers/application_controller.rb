class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def checkIdentity(hash={})
    user=User.find(session[:user_id])
    case hash[:no]
    when 1
      unless hash[:identity1]==user.identity
        flash[:title]="權限"         
        flash[:notice]="您沒有此動作權限" 
        redirect_to root_url
      end
    when 2
      unless hash[:identity1]==user.identity or hash[:identity2]==user.identity
        flash[:title]="權限"         
        flash[:notice]="您沒有此動作權限" 
        redirect_to root_url
      end
    when 3
      unless hash[:identity1]==user.identity or hash[:identity2]==user.identity or hash[:identity3]==user.identity
        flash[:title]="權限"         
        flash[:notice]="您沒有此動作權限" 
        redirect_to root_url
      end
    else
      flash[:title]="權限"         
      flash[:notice]="您沒有此動作權限" 
      redirect_to root_url
    end    
  end    
  
  def checkUser(hash={})
    user=User.find(session[:user_id])
    unless hash[:id].to_s==session[:user_id].to_s or user.identity == GLOBAL_VAR['identity_CCE']
      flash[:title]="權限"         
      flash[:notice]="您沒有此動作權限" 
      redirect_to root_url
    end    
  end 
  
  def authorize
    unless User.find_by_id(session[:user_id])
      #session[:original_uri]=request.url
      flash[:title]="登入"         
      flash[:notice]="請先登入"      
      redirect_to root_url
    end
  end   
end
