# CRUD in Ruby on Rails
Well, a crud is “Create”, “Read”, “Update” and “Delete”.		
First of all you must have installed ruby 2.3, rails Installer and sqlite 3.
Now, open cmd or powershell, and go where you want to save your project  and write the next code.
rails new MyFirstApp

![Captura1](https://user-images.githubusercontent.com/51441319/59140155-ac78b100-895f-11e9-8c79-5dd2f8c1fc24.PNG)

If everything is right you should to see something like that
![Captura2](https://user-images.githubusercontent.com/51441319/59140209-3a549c00-8960-11e9-9cf0-f723161829a3.PNG)

Now, you have to open your favorite ide like sublime, Atom or Visual studio code. 
I wil open Atom, open the project. Go to File and  open folder, search your project.
![Captura3](https://user-images.githubusercontent.com/51441319/59140217-4e000280-8960-11e9-94ff-f0bfbcdadf62.PNG)

Open Gemfile and write in the line 12 this
gem 'sqlite3', '~> 1.3.7'
Write in cmd cd bin and bundle install, you should have some like that 

![Captura4](https://user-images.githubusercontent.com/51441319/59140229-6a03a400-8960-11e9-9790-772267de52c7.PNG)

Now, go to cmd and write bundle install, and you should have this 
![Captura5](https://user-images.githubusercontent.com/51441319/59140242-91f30780-8960-11e9-917e-00313b50383f.PNG)

It´s time to create the model, I will create the model User, write this code.
cd bin
rails generate model user name:string phone:string email:string

![Captura6](https://user-images.githubusercontent.com/51441319/59140253-b64ee400-8960-11e9-85ba-9eb3a4164974.PNG)


We have to migrate de data base.
Rake db:migrate
![Captura7](https://user-images.githubusercontent.com/51441319/59140259-d5e60c80-8960-11e9-8182-a9641bdde8d1.PNG)

Create the controller, write 
rails generate controller User index
![Captura8](https://user-images.githubusercontent.com/51441319/59140266-f7df8f00-8960-11e9-98a1-c8929f846e30.PNG)

Now go to controller in your IDE. And paste this 
class UserController < ApplicationController
  def index
    @all_users=User.all
  end
  def new
    @user=User.all
  end

  def create
    @user=User.new(name: params[:user][:name],
      phone: params[:user][:phone],
      email: params[:user][:email])
      if @user.save
        redirect_to action "index"
      else
        render :new
      end
  end
  def edit
    @user = User.find(params[:id])
    render :new
  end
  def update
    @user = User.find(params[:id])
    if @user.update(name: params[:user][:name],
      phone: params[:user][:phone],
      email: params[:user][:email])
      redirect_to action: "index"
    else
      render 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to action: "index"
  end
end

here we have The crud inside of controller, Now we go to install bootstrap. Go to views/layouts/application.html.erb, replace this code:
<!DOCTYPE html>
<html>
  <head>
    <title>MyFirstApp</title>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.css"/>
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.js"></script>
    <script language="javascript">
    $(document).ready(function() {
        $('#example').DataTable();
    } );
    </script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">  </head>

  <body>
    <%= yield %>
  </body>
</html>
We are finishing. Go to views/index.html.erb paste this code.
<table id="example" class="table table-striped dt-responsive nowrap" style="width:100%">
  <thead>
    <tr>
      <th>Name</th>
      <th>Phone</th>
      <th>Email</th>
    </tr>
  </thead>
  <tbody>
      <%@all_users.each do |x|%>
  	     <tr>
           <td><%=x.name%></td>
           <td><%=x.phone%></td>
           <td><%=x.email%></td>
           <td>
             <%=link_to controller: "user", action: "edit", id:x.id do%>
             <i class="far fa-edit fa-2x"></i>
             <%end%>
           </td>
           <td>
             <%=link_to controller: "user", action: "destroy", id:x.id do%>
             <i class="far fa-trash-alt fa-2x"></i>
             <%end%>
           </td>
         </tr>
      <%end%>
    </tbody>
</table>
<a href="/user/new">
<button type="button" class="btn btn-success" name="button">Add new user</button>
</a>
Go to cmd and run the server.
rails server

![Captura9](https://user-images.githubusercontent.com/51441319/59140286-2bbab480-8961-11e9-8d1c-7d849b6a4ddc.PNG)

Now go to your browser and write localhost:3000/user/index
![Captura10](https://user-images.githubusercontent.com/51441319/59140302-54db4500-8961-11e9-896c-f361f1532609.PNG)

Last one is create the “Add new user”, well go to your IDE and in views/user right click New file and create the file new.html.erb
![Captura11](https://user-images.githubusercontent.com/51441319/59140318-7b997b80-8961-11e9-9c63-b0797044b5f1.PNG)

 
Open the file and write this code
<%if @user.id==nil%>
  <%@action_name="create"%>
<%else%>
  <%@action_name="update"%>
<%end%>

<div class="formbody">
  <div class="container">
    <p class="h2 text-center">New user</p>
    <%=form_for :user, url:@action_name do |user_form|%>
      <div class="form-group">
        <label>Full Name:</label>
        <%=user_form.text_field :name, placeholder: "Enter your Name",:required => true,  class: "form-control"%>
      </div>
      <div class="form-group">
        <label>Phone:</label>
        <%=user_form.text_field :phone, placeholder: "Enter your Name",:required => true,  class: "form-control"%>
      </div>
      <div class="form-group">
        <label>Email:</label>
          <%=user_form.text_field :email, placeholder: "Enter your city",:required => true,   class: "form-control"%>
      </div>
      <div class="">
        <%if @user.id==nil%>
        <%=user_form.submit "Create", class:"btn btn-success btn-block"%>
        <%else%>
        <%=user_form.hidden_field :id%>
        <input class="btn btn-primary btn-block" type="submit" value="Update!!">
        <%end%>
      </div>
    <%end%>
  </div>
</div>

that is all, run the server rails server and try it.
if you have this mistake

![Captura](https://user-images.githubusercontent.com/51441319/59140341-d632d780-8961-11e9-8e8c-68297ae2a284.PNG)

you just have to change in application_controller.rb
![Captura12](https://user-images.githubusercontent.com/51441319/59140377-1f832700-8962-11e9-85c9-fe3bc8fe74af.PNG)

thanks for watching, have a nice day.



