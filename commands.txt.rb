scp -i pem_file.pem ubuntu@ec2-12-34-56-78.compute-1.amazonaws.com:/path/filename .
scp -r -i pem_file.pem ubuntu@ec2-12-34-56-78.compute-1.amazonaws.com:/path/foldername .
scp -r -i pem_file.pem ubuntu@ec2-12-34-56-78.compute-1.amazonaws.com:/path/filename filename
********************** Ubuntu Commands **********************
copy file
  cp file_name /destination/
copy folder
  cp -R /source_folder/* /destination_folder/
Delete/Remove File
  rm file_name
Delete/Remove Folder
  rm -R folder_name
Increase Workspace:
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ vsize 3
gsettings set org.compiz.core:/org/compiz/profiles/unity/plugins/core/ hsize 3

Check if port is open:
	nc -z <host> <port>; echo $?

ubuntu-support-status
sudo apt-get install unity-tweak-tool
uname -i
dpkg --print-architecture

.deb	=>	double click to install

 ==> Java Installation from .tar.gz
#Login as root
sudo su

#create jdk directory
mkdir /opt/jdk

"DANGER"
#delete/remove directory
rm -R directory_name

#uncompress, change to your file name
tar -zxf jdk-8u5-linux-x64.tar.gz -C /opt/jdk

#check if files are there
#ls /opt/jdk

#update alternatives so the command java point to the new jdk 
update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_05/bin/java 100


#update alternatives so the command javac point to the new jdk 
update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_05/bin/javac 100

#check if java command is pointing to " link currently points to /opt/jdk/jdk1.8.0_05/bin/java"
update-alternatives --display java

#check if java command is pointing to " link currently points to /opt/jdk/jdk1.8.0_05/bin/javac"
update-alternatives --display javac

#check if java is running
java -version

#Check upu usage
sudo apt-get install sysstat
iostat

#Check memory
free -m

#Check hardware architecture
lscpu

Sublime License:
----- BEGIN LICENSE -----
eldon
Single User License
EA7E-1122628
C0360740 20724B8A 30420C09 6D7E046F
3F5D5FBB 17EF95DA 2BA7BB27 CCB14947
27A316BE 8BCF4BC0 252FB8FF FD97DF71
B11A1DA9 F7119CA0 31984BB9 7D71700C
2C728BF8 B952E5F5 B941FF64 6D7979DA
B8EB32F8 8D415F8E F16FE657 A35381CC
290E2905 96E81236 63D2B06D E5F01A69
84174B79 7C467714 641A9013 94CA7162
------ END LICENSE ------

Sublime Text 2.x (Still valid for all v3 beta versions)
--- BEGIN LICENSE -----
ZYNGA INC.
50 User License
EA7E-811825
927BA117 84C9300F 4A0CCBC4 34A56B44
985E4562 59F2B63B CCCFF92F 0E646B83
0FD6487D 1507AE29 9CC4F9F5 0A6F32E3
0343D868 C18E2CD5 27641A71 25475648
309705B3 E468DDC4 1B766A18 7952D28C
E627DDBA 960A2153 69A2D98A C87C0607
45DC6049 8C04EC29 D18DFA40 442C680B
1342224D 44D90641 33A3B9F2 46AADB8F
------ END LICENSE ------
----- BEGIN LICENSE -----
Molex, Inc.
Single User License
EA7E-818977
AE248E13 C08A1CDF 2D6751EF 32243003
53F5EF8A 1522F537 6A09E721 030DC36C
C477DA16 2BD1681C 0164D104 BB58D77F
1C221EE9 3296957E 5784C10F 51AA0020
6F2E553C D8147ADF 7A5B7A4C F843F2A6
2489CCA4 05759326 1D16227F 4813084D
61821A38 F4CD6E01 CFC5A7A5 C7D8B685
1D56D4DB 6B3C3094 57A6F2F3 7CD4177B
------ END LICENSE ------
—– BEGIN LICENSE —–
Die Socialisten GmbH
10 User License
EA7E-800613
51311422 E45F49ED 3F0ADE0C E5B8A508
2F4D9B65 64E1E244 EDA11F0E F9D06110
B7B2E826 E6FDAA72 2C653693 5D80582F
09DCFFB5 113A940C 5045C0CD 5F8332F8
34356CC6 D96F6FDB 4DEC20EA 0A24D83A
2C82C329 E3290B29 A16109A7 EC198EB9
F28EBB17 9C07403F D44BA75A C23C6874
EBF11238 5546C3DD 737DC616 445C2941
—— END LICENSE ——


Preferences ==> Settings
{
  "color_scheme": "Monokai.sublime-color-scheme",
  "font_size": 10,
  "ignored_packages":
  [
    "Vintage"
  ],
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "show_errors_inline": false,
  "word_wrap": true,
  "highlight_modified_tabs": true
}




Disable update notification in Sublime:
Preferences => Settings
Add { "update_check": false } in Preferences.sublime.settings - User


Daemon Screen
sudo apt-get install screen
screen
ctrl + a + d
screen -r
screen -r {scree_id}
screen -list
rake jobs:work


*****Install Ruby on Rails*****
1) suds apt-get update && sudo apt-get -y upgrade
2) Intall curl
	sudo apt-get install curl
2) Request a key to verify the legitimacy of the RVM release
   	gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
3) Install RVM
	curl -sSL https://get.rvm.io | bash -s stable
4) Run RVM
	source /home/touqeer/.rvm/scripts/rvm
		OR
	source ~/.rvm/scripts/rvm
5) Install Ruby
	rvm list known
	rvm install 2.4.2

	For RVM to work properly, you have to check the 'Run command as login shell'
	checkbox on the Title and Command tab of gnome-terminal
	Edit ▸ Profile Preferences menu dialog
	in case the menu is missing right click the terminal app
	and navigate Profiles ▸ Profile Preferences.
	
6) Add nodejs repo
	curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
7) Install nodejs
	sudo apt-get install -y nodejs
8) Install Rails
	gem install rails -v 4.2.6

*****Sample ROR Project*****
1) To view list of ruby versions
	rvm list gemsets
2) To use ruby version
	rvm use {version}
	rvm use --default {version}
	rvm {version} --default
3) To install ruby version
	rvm install {version}
4) To install bundle
	gem install bundler
4) Create Rails Project
	rails new app_name
5) Go to project directory
	cd app_name
6) Install gem
	bundle

*****Install Angular*****
1) install nodejs > 8	=>	sudo apt-get install nodejs
2) install npm > 3		=>	sudo apt-get install npm
3) sudo npm install -g @angular/cli
4) npm install typescript@2.2.1 --save
5) ng -v
6) ng new projectname
8) ng serve
9) http://localhost:4200/
10) ng serve --host 0.0.0.0 –port 4205
11) Creating Components: ng g component new-cmp


********************** Git Commands **********************
sudo apt-get install git
sudo apt install gitk
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global color.ui true
git config --global user.name "Touqeer-tqr"
git config --global user.email "tqr093@gmail.com"

:"set user.name and email for seperate repositories"
git config user.name "Touqeer-tqr"
git config user.email "tqr093@gmail.com"
		OR
.git/config  	=>	edit this file
For example:
[core]
	name = Touqeer-tqr
    email = tqr093@gmail.com


git filter-branch -f --env-filter "GIT_AUTHOR_NAME='Touqeer-tqr'; GIT_AUTHOR_EMAIL='tqr093@gmail.com'; GIT_COMMITTER_NAME='Touqeer'; GIT_COMMITTER_EMAIL='tqr093@gmail.com';" HEAD

git clone /path/to/repository

list of files edited: git st
view changes: git diff
view changes ready to be commited: git diff --cached
git diff <sourcebranch> <targetbranch>
git log
git log --oneline 
git log --graph --oneline --decorate
git log --since=2.weeks
git log -3		=>		by num
git log --after="2014-7-1"
git log --after="yesterday" --before="2014-7-4"
git log --author="Touqeer"
git log --grep="JRA-224:"		=>		by message
git log -S"Hello, World!"		=>		by content

git log -p  	=>	with difference
git st  =>  list of files edited
check last modified date :
	git st -s | while read mode file; do echo $mode $file $(stat -c %y $file); done
git diff  =>  view changes
git diff --cached  => view changes ready to be commited
git diff <sourcebranch> <targetbranch>
git add
git add -u 	=>	to add deleted / modified / renamed
git ci -m "message"
git ci --amend
git push -d <remote_name> <branch_name>		=>	Delete remtoe branch
git branch -d <branch_name> 	=>	Delete local branch
git branch -D <branch_name>		=>	Force Delete local branch
git push <remote_name> --delete <branch_name>	=>	Delete remote branch

"rebase"
git rebase --interactive HEAD~[7]	=>	merge last seven commits into last commit with message of last commit
--interactive or -i
git rebase --interactive {commit_id}	=>	merge from commit_id to last commit
    c1--c2--c3--c4--c5--c6  ==>   c1--c2--c3--c4(c5&c6)

Example:
git rebase -i HEAD~3
Editable file will open with commits like:
  pick f05aefa commit-msg-1
  pick b260e42 commit-msg-1
  pick 0c66d1c commit-msg-1
Replace pick with squash or s
  pick f05aefa commit-msg-1
  s b260e42 commit-msg-1
  s 0c66d1c commit-msg-1
Ctrl+x ==> y
  comment all messages except one, which will be used.

"squash"
git merge --squash branch_name
Example:
    c1--c2--c3--c4 (master)
             \_c3.1--c.3.2 (my_branch)
  git merge my_branch # => result will be
    c1--c2--c3--c4--c3.1--c3.2
  git merge --squash my_branch # => result will be
    c1--c2--c3--c4(c3.1&c3.2)

Localy Save changes: (stash)
git stash
git stash apply
git stash list
git stash clear

git remote add {remote_name} {server}
list remote servers: git remote -v
git remote rm origin_name
git push <remote_name> --delete <branch_name>

git remote set-url origin {remote_url}

git remote rename origin destination
# Change remote name from 'origin' to 'destination' (remote rename)

push branch: git push {remote_name} master

merge branch: git merge <branchname>
fetch & merge changes: git pull

reapply commits on top of another base tip
git rebase master
git rebase master <branchname>

push all branches: git push --all origin
create branch: git co -b branch_name
switch branch: git co branch_name
delete branch: git branch -d branch_name
force delete branch: git branch -D branch_name
list branch: git br
rename branch:
	If you are on the branch you want to rename:
		git branch -m new_name
	If you are on a different branch:
		git branch -m old-name new-name

reset file: git checkout -- <filename>
to drop all your local changes and commits, fetch the latest history from the server and point your local master branch at it
git fetch origin
git reset --soft HEAD@{1}
git reset --hard HEAD
git reset --hard origin/master
git reset to commit: git reset --hard commit_num
git reset to commit: git reset --hard 15e8c70ef9a04ce0125a2dbe9c10dc60c0ce07a3
git reset to commit: git reset --soft 16903bf76c436a97ba04c93c801330f8fccd626c
To show what will be deleted by using the -n option:
git clean -n
Clean Step - beware: this will delete files:
git clean -f

********************** Heroku Commands **********************
add chrome drive heroku app
heroku buildpacks:add https://github.com/heroku/heroku-buildpack-chromedriver
heroku run bash
git push heroku yourbranch:master
heroku logs -t
heroku logs -t -n 1500 --app=app_name
heroku config:set S3_KEY=ABC123 S3_SECRET=ABC123+ABC123
heroku config:unset S3_KEY=ABC123 S3_SECRET=ABC123+ABC123
heroku run printenv

heroku pg:backups:capture
heroku pg:backups:download

check running dynos
heroku ps --app app-name

stop running dyno
heroku ps:stop web.1 --app app-name
********************** Active Records Commands **********************
rake db:create
rake db:migrate
rake db:seed
rake db:setup
rake db:rollback
rake db:migrate:status
rake db:migrate:down VERSION=20180807130147

List All tables
	ActiveRecord::Base.connection.tables

	Model.destroy_all

Delete/Drop Table from ActiveRecord
ActiveRecord::Migration.drop_table(:table_name)

Reset ids after destroy (Truncate)
	ActiveRecord::Base.connection.execute("TRUNCATE model_name RESTART IDENTITY")
	i.e.	ActiveRecord::Base.connection.execute("TRUNCATE users RESTART IDENTITY")
	For Sqlite
	User.destroy_all # Only necessary if you want to trigger callbacks.
	ActiveRecord::Base.connection.execute("Delete from users")
	ActiveRecord::Base.connection.execute("DELETE FROM SQLITE_SEQUENCE WHERE name='users'")

Convert one time zone to another time zone
	t = event.date.to_s + " " + event.time.to_s + " " + Time.now.in_time_zone(event.school.time_zone).strftime("%z")
	Time.parse(t).in_time_zone(current_user.time_zone).strftime("%m/%d/%g %I:%M%P")

ID start value
mysql:
	ActiveRecord::Base.connection.execute("ALTER TABLE links AUTO_INCREMENT = 170")
postgresql:
	ActiveRecord::Base.connection.execute("ALTER SEQUENCE events_id_seq START with 171 RESTART;")
sqlite:
    ActiveRecord::Base.connection.execute("insert into sqlite_sequence(name,seq) values('links', 1000)")

Backup & Restore database:
pg_dump -F c -v -U postgres -h localhost app_live_development -f public/backup-Oct-1-2018.psql

dropdb -h localhost -U postgres zoom_live_development
createdb -h localhost -U postgres -T template0 zoom_live_development
pg_restore -h localhost -p 5432 -U postgres -d zoom_live_development -W public/backup-Oct-1-2018.psql
pg_restore -h zoom-production.clmmynlwbfnd.us-east-1.rds.amazonaws.com -p 5432 -U postgres -d zoom_live_development -W public/backup-Oct-1-2018.psql


User.left_outer_joins(:broadcaster).where(broadcasters: {user_id: nil}).map{|u| [u.email, u.id]}
User.joins(:broadcaster).where("email LIKE ?", "%#{v}%").select('users.id, broadcasters.id as broadcaster_id').collect(&:broadcaster_id)
********************** Rails Commands **********************
rails new app_name
rails _2.1.0_ new my_app
rails new app_name -d mysql
rails new right_move_scrap --database=postgresql
rails new app_name --skip-activerecord

rails s -b IP
rails s -p PORT
kill -9 $(lsof -i tcp:3000 -t)
gem list
gem list {gem_name}
gem install {gem_name} -v 1.8a
# remove all old versions of the gem
gem cleanup {gem_name}
# choose which ones you want to remove
gem uninstall {gem_name}
# remove sprcific versions
gem uninstall {gem_name} --version '<1.3.4'

rails _4.2.6_ new sample_react_rails --database=postgresql
rails generate scaffold Post title:string content:text

rails generate model NAME [field[:type][:index] field[:type][:index]] [options]

rails generate devise user first_name:string last_name:string verified:boolean status:string phone_num: string image:string time_zone:string

rails generate devise:controllers users

"Create relation during model creation"
rails generate model Post user_id:integer
				OR
rails generate model Post user:references

"Add email to user model"
rails generate migration add_email_to_users email:string

"using alias on model name"
has_many :posts, class_name: :Post, foreign_key: :user_id, dependent: :destroy
belongs_to :article, class_name: :User, foreign_key: :user_id

"remove migration"
rake db:migrate:down VERSION=versionnumber
rails d migration migration_name
	=>	rails d migration create_participants

"has_many through"
Event.rb 	=>	has_many :users, through: :participants
User.rb 	=>	has_many :events, through: :participants
rails g model Participant user:references event:references
Participant.rb	=>	belongs_to :user
					belongs_to :event

"many to many"
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories
  rails g migration CreateCategoriesUsersJoinTable

  ==> migration file
    def change
	  # This is enough; you don't need to worry about order
	  create_join_table :categories, :users

	  # If you want to add an index for faster querying through this join:
	  create_join_table :categories, :users do |t|
	    t.index :category_id
	    t.index :user_id
	  end
	end

"model vs resource vs scaffold"
rails g model Test name:text
	models/test.rb 
	CreatTest migrate file in db/migrate

rails g resource Test name:text
	models/test.rb 
	CreatTest migrate file in db/migrate
	controllers/tests_controller.rb
	routes.rb  ==>  resources :tests
 
rails g scaffold Test name:text
	models/test.rb 
	CreatTest migrate file in db/migrate
	controllers/tests_controller.rb (7 public methods and 2 private methods)
						public: index, show, new, create, edit, update, delete
						private: set_test, test_params
	routes.rb  ==>  resources :tests
	views/tests/["corresponding view files"
					_form.html.erb
					edit.html.erb
					index.html.erb
					index.json.jbuilder
					new.html.erb
					show.html.erb
					show.json.jbuilder	]

Open gem in sublime
bundle show devise | xargs subl


Rails Migration to change table name:
class RenameOldTableToNewTable < ActiveRecord::Migration
  def self.up
    rename_table :old_table_name, :new_table_name
  end
  def self.down
    rename_table :new_table_name, :old_table_name
  end
end

In Rails 3.1 & 4, ActiveRecord::Migration::CommandRecorder knows how to reverse rename_table migrations, so you can do this:
class RenameOldTableToNewTable < ActiveRecord::Migration
  def change
    rename_table :old_table_name, :new_table_name
  end 
end

ActiveAdmin
To register an existing model with Active Admin:
  rails generate active_admin:resource MyModel

********************** AWS Commands **********************
:"change access of any file on aws"
Aws.config[:credentials] = Aws::Credentials.new( ENV['AWS_ACCESS_KEY'], ENV['AWS_SECRET_ACCESS_KEY'] )
client = Aws::S3::Client.new(region: ENV['AWS_REGION'])
path = "uploads/#{current_user.id}/images/test_image.png"
resp = client.put_object_acl({ acl: "public-read", bucket: ENV['S3_BUCKET'], key: path })

begin
  # something which might raise an exception
rescue SomeExceptionClass => some_variable
  # code that deals with some exception
rescue SomeOtherException => some_other_variable
  # code that deals with some other exception
else
  # code that runs only if *no* exception was raised
ensure
  # ensure that this code always runs, no matter what
  # does not change the final value of the block
end


********************** Style (CSS, SCSS) **********************
.two lines doted text
{
	overflow: hidden;
	text-overflow: ellipsis;
	-webkit-line-clamp: 2;
	display: -webkit-box;
	-webkit-box-orient: vertical;
}

********************** Javascript, Jquery **********************
function CopyToClipboardWithInputfield(){
    var copyText = document.getElementById("destination_url");
    copyText.select();
    document.execCommand("copy");
}
function CopyToClipboardWithOutInputField (containerid) {
  // Create a new textarea element and give it id='temp_element'
  var textarea = document.createElement('textarea')
  textarea.id = 'temp_element'
  // Optional step to make less noise on the page, if any!
  textarea.style.height = 0
  // Now append it to your page somewhere, I chose <body>
  document.body.appendChild(textarea)
  // Give our textarea a value of whatever inside the div of id=containerid
  textarea.value = document.getElementById(containerid).value
  // Now copy whatever inside the textarea to clipboard
  var selector = document.querySelector('#temp_element')
  selector.select()
  document.execCommand('copy')
  // Remove the textarea
  document.body.removeChild(textarea)
}

