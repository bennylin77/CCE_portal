# encoding: utf-8
class System < ActionMailer::Base
  default from: "國立交通大學推廣教育中心 <cce@nctu.edu.tw>"
  helper ApplicationHelper  
  
  def sendVerification(hash={})
    @user=hash[:user]
    mail( to: @user.email, subject: "國立交通大學推廣教育中心 會員邀請函" )
  end
  def sendResetPw(hash={})
    @user=hash[:user]
    @new_pw=hash[:new_pw]
    mail( to: @user.email, subject:"國立交通大學推廣教育中心  密碼重設通知")
  end 
  def sendEDM(hash={})
    @user=hash[:user]
    @edm=hash[:edm]
    mail( to: @user.email, subject: @edm.title)    
  end   
  
end
