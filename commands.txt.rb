********************** Ubuntu Commands **********************
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


Disable update notification in Sublime:
Preferences => Settings
Add { "update_check": false } in Preferences.sublime.settings - User


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

git clone /path/to/repository

list of files edited: git st
view changes: git diff
view changes ready to be commited: git diff --cached
git diff <sourcebranch> <targetbranch>
git log


git add
git ci
git ci --amend
git st
git remote add {remote_name} {server}
list remote servers: git remote -v
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
git reset --hard origin/master
reset to commit: git reset --hard commit_num


********************** Heroku Commands **********************

heroku buildpacks:add https://github.com/heroku/heroku-buildpack-chromedriver
heroku run bash
git push heroku yourbranch:master

********************** Active Records Commands **********************


********************** Rails Commands **********************
rails new app_name
rails _2.1.0_ new my_app
rails new app_name -d mysql
rails new right_move_scrap --database=postgresql
rails new app_name --skip-activerecord


rails generate model NAME [field[:type][:index] field[:type][:index]] [options]

rails generate devise user first_name:string last_name:string verified:boolean status:string role:string

rails generate devise:controllers users

rails g model blog type:string count:integer approved:boolean status:string title:string tags:string
rails g model blog_content content:text type:string order:integer
content has images


gem list
gem list name
gem install fog -v 1.8
gem uninstall fog -v 1.8
