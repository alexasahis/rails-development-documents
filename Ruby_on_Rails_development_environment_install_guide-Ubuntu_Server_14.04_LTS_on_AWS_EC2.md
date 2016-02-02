Ruby on Rails development environment install guide
===================================================

Ubuntu Server 14.04 LTS on AWS EC2
==================================

## Install Ubuntu
* AWS Consol Launch Instance
<pre>
  Ubuntu Server 14.04 LTS (HVM), EBS General Purpose (SSD) Volume Type. Support available from Canonical (64-bit)
</pre>

## Configure Ubuntu
* Start-up ubuntu instance
* add swap file
<pre>
  $ sudo /bin/dd if=/dev/zero of=/var/swap.1 bs=1M count=1024
  $ sudo /sbin/mkswap /var/swap.1
  $ sudo /sbin/swapon /var/swap.1
  $ sudo swapon -s
  $ sudo vim /etc/fstab
    /var/swap.1 swap swap defaults 0 0
</pre>
* Upload another workstation's id_rsa.pub to ubuntu server
<pre>
  $ scp ~/.ssh/id_rsa.pub ubuntu@aws_ubuntu_server_name:user.pub
</pre>
* Login as default user ('ubuntu')
* Generate user ssh key
<pre>
  $ ssh-keygen -t rsa -C user@aws_ubuntu_server_alias_name
</pre>
* Copy workstation's id_rsa.pub to server authorized_keys
<pre
  $ ssh-copy-id -i user ubuntu@aws_ubuntu_server_alias_name
  or
  $ cat user.pub >> .ssh/authorized_keys
  $ chmod 600 .ssh/authorized_keys
</pre>
* Change root & user password
<pre>
  $ sudo apg-get install pwgen
  $ pwgen 
  $ sudo su -
  $ passwd root
  $ passwd ubuntu 
</pre>
* Update system
<pre>
  $ sudo apt-get update
  $ sudo apt-get upgrade
</pre>
* Remove un-usage packages
<pre>
  $ sudo apt-get autoremove
</pre>
* Reboot system
<pre>
  $ sudo shutdown -r now
</pre>

## Install development packages
* Install Git and Subversion
<pre>
  $ sudo apt-get install subversion git git-svn git-gui tig
</pre>
* install mysql and sqlite3
<pre>
  $ sudo apt-get install mysql-server libmysqlclient-dev sqlite3 libsqlite3-dev
</pre>
* Setup git configuration
<pre>
  $ git config --global user.name ubuntu
  $ git config --global user.email ubuntu@aws_ubuntu_server_alias_name
  $ git config --global core.editor vim
  $ git config --global color.ui true
</pre>
* Install command tools
<pre>
  $ sudo apt-get install unzip mc tree markdown lynx
  # use "markdown somefile.md | lynx -stdin" for command line markdown viewer support.
</pre>
* Install git-flow
<pre>
  $ sudo apt-get install git-flow
</pre>
* Install git-flow-completion
<pre>
  $ git clone https://github.com/bobthecow/git-flow-completion.git 
  $ sudo cp git-flow-completion/git-flow-completion.bash /etc/bash_completion.d/git-flow-completion
</pre>
* Install develop libraries
<pre>
  $ sudo apt-get install build-essential autoconf automake zlib1g-dev libssl-dev libreadline6-dev
</pre>

## Install RVM & Rails
* Install RVM
<pre>
  $gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  $\curl -sSL https://get.rvm.io | bash -s stable
  (Check after install)
  #source rvm script.
  $ source /home/ubuntu/.rvm/scripts/rvm
  #test rvm
  $ rvm notes
</pre>
* Install libtool for yaml
<pre>
  $ sudo apt-get install libtool pkgconf
</pre>
* Install Ruby
<pre>
  # ruby 2.2.1
  $ rvm list known
  $ rvm install 2.2.1 --disable-install-doc
  $ rvm use 2.2.1 --default
  $ ruby -v
  $   ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-linux]
</pre>
* Install Rails
<pre>
  # rails 4.2.5.1
  $ vi ~/.gemrc
    gem: --no-ri --no-rdoc --no-document
  # Install node.js and dependence libraries
    $ sudo apt-get install nodejs nodejs-dev
  # Install Rails
    $ gem install rails -v=4.2.5.1
    $ rails -v
    $   Rails 4.2.5.1
</pre>

## Install Vim and plugins
* Install Vim package
<pre>
  $ sudo apt-get install vim
</pre>
* Install Vim's plugins manager
<pre>
  $ mkdir -p ~/.vim/bundle
  $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
</pre>
* Install default vimrc
<pre>
  $ vim ~/.vimrc
</pre>
<pre>
set nocompatible

filetype off

"
"Vim Bundle Manager
"
" $ mkdir -p ~/.vim/bundle
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'gmarik/Vundle.vim'
"
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use: filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set ruler
set hlsearch

" define OpenURL (OSX)
":command -bar -nargs=1 OpenURL :!open &ltargs&gt
" define OpenURL (Windows)
":command -bar -nargs=1 OpenURL :!start cmd /cstart /b &ltargs&gt
" define OpenURL (Linux)
:command -bar -nargs=1 OpenURL :!firefox <targs>

" Keymaping
nmap \s :w<cr>
nmap \q :q!<cr>
nmap \f <C-f> " Maping '\f' to Ctrl-F (Page Down) for Mac
nmap \b <C-b> " Maping '\b' to Ctrl-B (Page Up) for Mac
nmap \d <C-d> " Maping '\d' to Ctrl-d (Half-Page Down) for Mac
nmap \u <C-u> " Maping '\u' to Ctrl-u (Half-Page Up) for Mac
nmap \r <C-r> " Maping '\r' to Ctrl-r (Redo) for Mac
nmap \w <C-w>w " Maping '\w' to Ctrl-w w (Window command) for Mac
</pre>

* Install vim plugins and check plugins install
<pre>
  $ vim
    :PluginInstall
    :wq!
  $ vim
    :h vundle
    :h NERDTree
    :h rails
</pre>

* Install mysql & sqlite3 drivers
<pre>
  $ gem install mysql2
  $ gem install sqlite3
</pre>
* Install Apache and gems
<pre>
  $ gem install passenger
  $ sudo apt-get install libcurl4-openssl-dev
  $ sudo apt-get install apache2 apache2-dev apache2-mpm-prefork
</pre>
* Install passenger module
<pre>
  $ passenger-install-apache2-module  (change ruby version need to re-execute once)

  # for backupground install passenger module.
  $ nohup passenger-install-apache2-module --auto --languages ruby &
  $ tail -f nohup.out

  $ sudo vim /etc/apache2/mods-available/rails.load  (new file)(replace ruby ver & passenger ver)(replace username to your home name)
  $ sudo vim /etc/apache2/mods-available/rails.conf  (new file)(replace ruby ver & passenger ver)(replace username to your home name)
  $ sudo vim /etc/apache2/sites-available/001-rails.conf (new file)
</pre>
* `rails.load`
<pre>
   LoadModule passenger_module /home/ubuntu/.rvm/gems/ruby-2.2.1/gems/passenger-5.0.24/buildout/apache2/mod_passenger.so
</pre>
* `rails.conf`
 <pre>
   <IfModule mod_passenger.c>
     PassengerRoot /home/ubuntu/.rvm/gems/ruby-2.2.1/gems/passenger-5.0.24
     PassengerDefaultRuby /home/ubuntu/.rvm/gems/ruby-2.2.1/wrappers/ruby
   </IfModule>
 </pre>
* `001-rails.conf`
<pre>
  <<VirtualHost *:80>VirtualHost *:80>
    #ServerName www.example.com

    ServerAdmin webmaster@localhost
    DocumentRoot /home/ubuntu/sites/rails-site/public
    <<Directory /home/ubuntu/sites/rails-site/public>Directory /home/ubuntu/sites/rails-site/public>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
        #Order allow,deny
        #Allow from all
        #AllowOverride all
        #Options -MultiViews
    <</Directory>/Directory>
    # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
    # error, crit, alert, emerg.
    # It is also possible to configure the loglevel for particular
    # modules, e.g.
    #LogLevel info ssl:warn

    ErrorLog ${APACHE_LOG_DIR}/rails_error.log
    CustomLog ${APACHE_LOG_DIR}/rails_access.log combined

    # For most configuration files from conf-available/, which are
    # enabled or disabled at a global level, it is possible to
    # include a line for only one particular virtual host. For example the
    # following line enables the CGI configuration for this host only
    # after it has been globally disabled with "a2disconf".
    #Include conf-available/serve-cgi-bin.conf
  <</VirtualHost>/VirtualHost>
  # vim: syntax=apache ts=4 sw=4 sts=4 sr noet
</pre>
* modify 000-default
<pre>
  $ sudo vim /etc/apache2/sites-available/000-default.conf
  # change port from "80" to "8000"
</pre>
* add listen port 8000
<pre>
  $ sudo vim /etc/apache2/ports.conf
  # add "Listen 8000"
</pre>

* Create rails develop site
<pre>
  $ mkdir -p ~/sites; cd ~/sites
  $ rails new rails-site
  $ cd rails
  $ bundle check
  $ bundle install
  $ rails generate controller pages
    def welcome
      @version=Rails.version
      @env=Rails.env
      @current_time=Time.current
    end
  $ vim app/views/pages/welcome.html.erb
</pre>
	<h1>Hello Rails!</h1>
	<p/>
	<h2>Rails Version:</h2>
	<%= @version %>
	<p/>
	<h2>Environment:</h2>
	<%= @env %>
	<h2>Time:</h2>
	<%= @current_time%>
<pre>
  $ vim config/routes.rb
  get '/version' => 'pages#welcome'
  $ RAILS_ENV=production rake secret
    (GENERATED_CODE_STRING)
  $ vim config/secrets
	production:
    secret_key_base: (GENERATED_CODE_STRING)
  $ source .bashrc
<pre>
#Add config/secrets.yml to version control and deploy again. You might need to remove a line from .gitignore so that you can commit the file.
</pre>  
  $ sudo apache2ctl stop
  $ rails server -b 0.0.0.0
  (Check rails WEBrick http server start on development mode, use http://127.0.0.1:3000 to browse the web page )
  Ctrl-C to shutdown server
</pre>
* Test web site in local
<pre>
  $ w3m http://localhost:3000/version
</pre>
* open port 80, 443, 8000, 3000
<pre>
  # AWS Console EC2 Security Group
  # Inbound add tcp port 80, 443, 8000, 3000
</pre>
* Test web site in workstation
<pre>
  # browsing http://aws_ubuntu_host_public_ip:3000/version
</pre>
** Config & Restart apache2 service
<pre>
  $ sudo apache2ctl stop
  $ sudo a2enmod rails
  $ sudo a2ensite 001-rails
  $ sudo apache2ctl start
  $ w3m http://localhost/version
  (Press  q y to exit)
</pre>

* Use browser open http://aws_ubuntu_host_public_ip
<pre>
$ firefox http://aws_ubuntu_host_public_ip
</pre>