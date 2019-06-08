# CRUD in Ruby on Rails
Well, a crud is “Create”, “Read”, “Update” and “Delete”.		
First of all you must have installed ruby 2.3, rails Installer and sqlite 3.
Now, open cmd or powershell, and go where you want to save your project  and write the next code.
rails new MyFirstApp

![Captura1](https://user-images.githubusercontent.com/51441319/59140155-ac78b100-895f-11e9-8c79-5dd2f8c1fc24.PNG)

If everything is right you should to see something like that
img 2

Now, you have to open your favorite ide like sublime, Atom or Visual studio code. 
I wil open Atom, open the project. Go to File and  open folder, search your project.
img3

Open Gemfile and write in the line 12 this
gem 'sqlite3', '~> 1.3.7'
Write in cmd cd bin and bundle install, you should have some like that 
img4

Now, go to cmd and write bundle install, and you should have this 
img5

It´s time to create the model, I will create the model User, write this code.
cd bin
rails generate model user name:string phone:string email:string
img6

We have to migrate de data base.
Rake db:migrate
img7

