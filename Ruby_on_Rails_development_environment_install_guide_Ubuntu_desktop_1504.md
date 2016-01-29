Ruby on Rails development environment install guide
===================================================

Ubuntu desktop 15.04
====================

## Install Ubuntu
* Download ubuntu iso file
<pre>
  $ wget http://releases.ubuntu.com/15.04/ubuntu-15.04-desktop-amd64.iso
</pre>
* Boot from ubuntu iso file
* Change install language to  'English (US)'
* Choice 'Install Ubuntu" to start install process
* Select your location choose 'Taiwan'
* Select your keyboard choose 'English (US)'
* Setup users and passwords enter default user name and password (for example 'dtuser')
* reboot desktop

## Configure Ubuntu
* Start-up desktop, login as default user (for example 'dtuser')
* Install OpenSSH server
<pre>
  $ sudo apt-get install openssh-server
</pre>
* Generate ssh  key (linux workstation side)
<pre>
  $ ssh-keygen -t rsa -C wsuser@workstation (don't use passphrase)
</pre>
* Upload workstation's id_rsa.pub to ubuntu desktop (linux workstation side)
<pre>
  $ scp ~/.ssh/id_rsa.pub dtuser@desktop:wsuser.pub
</pre>
* Generate desktop user ssh  key
<pre>
  $ ssh-keygen -t rsa -C dtuser@desktop (don't use passphrase)
</pre>
* Copy workstation's id_rsa.pub to desktop authorized_keys
<pre
  $ ssh-copy-id -i wsuser dtuser@desktop
  or
  $ cat asahi.pub >> .ssh/authorized_keys
  $ chmod 600 .ssh/authorized_keys
</pre>
* Change root password
<pre>
  $ sudo passwd root
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
  $ git config --global user.name dtuser
  $ git config --global user.email dtuser@desktop
  $ git config --global core.editor vim
  $ git config --global color.ui true
</pre>
* Install command tools
<pre>
  $ sudo apt-get install curl wget w3m unzip mc tree markdown lynx-cur
  # use "markdown somefile.md | lynx -stdin" for command line markdown viewer support.
</pre>
* Install git-flow
<pre>
  $ wget --no-check-certificate -q -O - https://github.com/nvie/gitflow/raw/develop/contrib/gitflow-installer.sh | sudo bash
</pre>
* Install git-flow-completion
<pre>
  $ git clone git://github.com/bobthecow/git-flow-completion.git
  $ sudo cp git-flow-completion/git-flow-completion.bash /etc/bash_completion.d/git-flow-completion
</pre>
* Install develop libraries
<pre>
  $ sudo apt-get install build-essential autoconf automake zlib1g-dev libssl-dev libreadline6-dev
</pre>

## Install RVM & Rails
* Install RVM
<pre>
  $gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
  $ \curl -sSL https://get.rvm.io | bash -s stable
  (Check after install)
  source rvm script.
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
  # rails 4.2.3
  $ vi ~/.gemrc
    gem: --no-ri --no-rdoc --no-document
  # Install node.js and dependence libraries
    $ sudo apt-get install nodejs nodejs-dev
  # Install Rails
    $ gem install rails -v=4.2.3
    $ rails -v
    $   Rails 4.2.3
</pre>

## Install Vim and plugins
* Install Vim package
<pre>
  $ sudo apt-get install vim
</pre>
* Install Vim's plugins manager
<pre>
  $ mkdir -p ~/.vim/bundle
  $ cd ~/.vim/bundle
  $ git clone git://github.com/gmarik/vundle.git
</pre>
* Install default vimrc
<pre>
  $ vim ~/.vimrc
</pre>
<pre>
" alex's vimrc
set nocompatible
" VIM 不使用和 VI 相容的模式

filetype off

"
" 安裝 Vim Bundle Manager
"
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-bundler'
filetype plugin indent on

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" 編輯喜好設定

syntax on
" 語法上色顯示

set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

set ruler
" 顯示右下角設定值

set hlsearch
" 設定高亮度顯示搜尋結果

" 自定義命令
" define OpenURL (OSX)
":command -bar -nargs=1 OpenURL :!open &ltargs&gt
" define OpenURL (Windows)
":command -bar -nargs=1 OpenURL :!start cmd /cstart /b &ltargs&gt
" define OpenURL (Linux)
:command -bar -nargs=1 OpenURL :!firefox <targs>

" Keymaping
nmap \s :w<<cr>cr>
nmap \q :q!<<cr>cr>
nmap \f <<C-f>C-f> " Maping '\f' to Ctrl-F (Page Down) for Mac
nmap \b <<C-b>C-b> " Maping '\b' to Ctrl-B (Page Up) for Mac
nmap \d <<C-d>C-d> " Maping '\d' to Ctrl-d (Half-Page Down) for Mac
nmap \u <<C-u>C-u> " Maping '\u' to Ctrl-u (Half-Page Up) for Mac
nmap \r <<C-r>C-r> " Maping '\r' to Ctrl-r (Redo) for Mac
nmap \w <<C-w>C-w>w " Maping '\w' to Ctrl-w w (Window command) for Mac
</pre>

* Install vim plugins and plugins help file
<pre>
  $ vim
    :BundleInstall
    :h rails
    :h NERDTree
    :h bundler
</pre>
* Check plugins install
<pre>
  $ vim
    :Rails!
    :NERDTree
    :Bundle
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
  $ sudo apt-get install apache2 apache2-prefork-dev apache2-mpm-prefork
</pre>
* Install passenger module
<pre>
  $ passenger-install-apache2-module  (change ruby version need to re-execute once)

  # for backupground install passenger module.
  $ nohup passenger-install-apache2-module --auto --languages ruby &
  $ tail -f nohup.out

  $ sudo vim /etc/apache2/mods-available/rails.load  (new file)(replace ruby ver & passenger ver)(replace username to your home name)
  $ sudo vim /etc/apache2/mods-available/rails.conf  (new file)(replace ruby ver & passenger ver)(replace username to your home name)
  $ sudo vim /etc/apache2/sites-available/001-railstest.conf (new file)
</pre>
* `rails.load`
<pre>
  LoadModule passenger_module /home/dtuser/.rvm/gems/ruby-2.2.1/gems/passenger-5.0.15/buildout/apache2/mod_passenger.so
</pre>
* `rails.conf`
 <pre>
  <IfModule mod_passenger.c>
    PassengerRoot /home/dtuser/.rvm/gems/ruby-2.2.1/gems/passenger-5.0.15
    PassengerDefaultRuby /home/dtuser/.rvm/gems/ruby-2.2.1/wrappers/ruby
  </IfModule> 
 </pre>
* `001-railstest.conf`
<pre>
  <<VirtualHost *:80>VirtualHost *:80>
    #ServerName www.example.com

    ServerAdmin webmaster@localhost
    DocumentRoot /home/dtuser/workspace/railstest/public
    <<Directory /home/dtuser/workspace/railstest/public>Directory /home/dtuser/workspace/railstest/public>
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
  # change port from "80" to "8080"
</pre>
* add listen port 8080
<pre>
  $ sudo vim /etc/apache2/ports.conf
  # add "Listen 8080"
</pre>

* Create rails test site
<pre>
  $ mkdir -p ~/workspace; cd ~/workspace
  $ rails new railstest
  $ cd railstest
  $ bundle check
  $ bundle install
  $ rails generate controller pages
  $ vim app/controllers/pages_controller.rb
    def welcome
      @version=Rails.version
      @env=Rails.env
      @current_time=Time.current
    end
  $ vim app/views/pages/welcome.html.erb
</pre>

	<h1>Hello World!</h1>
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
	root :to => "pages#welcome"::
  $ RAILS_ENV=production rake secret
    (GENERATED_CODE)
  $ vim .bashrc
	export SECRET_KEY_BASE=GENERATED_CODE
  $ source .bashrc
<pre>
#Add config/secrets.yml to version control and deploy again. You might need to remove a line from .gitignore so that you can commit the file.
</pre>  
  $ sudo apache2ctl stop
  $ rails server
  (Check rails WEBrick http server start on development mode, use http://127.0.0.1:3000 to browse the web page )
  Ctrl-C to shutdown server
</pre>
* Test web site in workstation
** Restart apache2 service
<pre>
  $ sudo a2enmod rails
  $ sudo a2ensite 001-railstest
  $ sudo apache2ctl stop
  $ sudo apache2ctl start
  $ w3m testsite
  (Press  q y to exit)
</pre>

* Use browser open http://localhost
<pre>
$ firefox http://localhost
</pre>