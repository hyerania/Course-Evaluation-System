# CSCE606-Project
CSCE120 Self-Evaluation Exam

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/hyerania/Course-Evaluation-System)


## Development Workflow
We will be utilizing a simple version of Gitflow. [More Info](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow).

### Development
Most tasks will be possible by branching off of `develop`. The name of the branch should be the name of your story but replacing all spaces with `-` in all lower case under the appropriate category. Ex: The story "Create and setup initial student database" will be `feature/create-and-setup-initial-student-database`. If the story is a bug, replace "feature" with "bug". In order to do this (update branches/category appropriately):
```
git checkout develop
git pull
git checkout -b feature/create-and-setup-initial-student-database
git push --set-upstream origin feature/create-and-setup-initial-student-database
```

After completion of your task, reverse merge develop into your branch to ensure that everything is still working. NOTE: This means checking local and Cloud 9 to ensure that all things work.
```
# Check to see if all changes are done
git status

git checkout develop
git pull
git checkout <ORIGINAL-BRANCH>
git merge <ORIGINAL-BRANCH> develop
```

### Test Cases
All test cases should pass whenever code is finalized and about to be pushed it develop. It is the job of the developer to fix any already committed test cases and to ensure that all code is 100% covered. In order to run the tests, run the following commands:

```
cucumber
rspec
```

To see to your coverage, view the **index.html**

### Releases
All releases will be on the master branch tagged with the release/iteration complete number. Once it is time to release, merge develop into master and tag master. Ex:
```
git checkout develop
git pull
git checkout master
git merge master develop
git tag iteration0
```

## Setup Instructions (Local - Mac OS X)
1. Use RVM to switch to Ruby 2.4.1
```
rvm install ruby-2.4.1
rvm use ruby-2.4.1
```

2. Install bundler
```
gem install bundler
```

3. Install dependencies
```
brew install postgresql
bundle install
```

4. Run the server
```
rails server
```

5. Open browser to see live at [http://localhost:3000](http://localhost:3000).

6. Install Heroku (Update local NPM if needed)
```
npm install -g heroku-cli
```

7. Login with Heroku
```
heroku login
```

8. Create new Heroku application
```
heroku create
```

9. Pushing to Heroku. Since we are doing branching, you will need to specify the branch you want to push in your Heroku deployment. Replace `<BRANCH_NAME>` in the following command with your branch name.
```
git push heroku <BRANCH_NAME>:master
```

## Setup Instructions (Local - Windows)
TODO.

## Setup Instructions (AWS Cloud 9)
TODO: Figure out Collaboration
1. Create Environment on AWS Cloud 9 with default settings.
2. Clone the repository using (enter login credentials when prompted):
```
git clone https://github.com/hyerania/CSCE606-Project.git
```
3. Check Ruby Version. If 2.4.1, skip to step 6.
```
ruby -v
```

4. Fix Ruby Version Manager to resolve Error 23 issues. [More Info](https://stackoverflow.com/questions/26242712/installing-rvm-getting-error-there-was-an-error23).
```
rvm group add rvm "$USER"
id
rvm fix-permissions
sudo reboot now
```
5. After Cloud 9 Reconnects, install ruby version 2.4.1
```
rvm install ruby-2.4.1
rvm use ruby-2.4.1
```
6. Install dependencies
```
git checkout develop
gem install bundler
sudo yum -y install postgresql postgresql-server postgresql-devel postgresql-contrib postgresql-docs
bundle install
```

7. Setup Cloud 9's Postgresql (Look at section below!)


7. Start the server to check everything works. Same as the homework, a little window should popup with the URL.
```
rails server -p $PORT -b $IP
```

8. Install Heroku CLI
```
nvm install stable
nvm alias default stable
npm install -g heroku-cli
```

9. Login with Heroku
```
heroku login
```

10. Create new Heroku application
```
heroku create
```

11. Pushing to Heroku. Since we are doing branching, you will need to specify the branch you want to push in your Heroku deployment. Replace `<BRANCH_NAME>` in the following command with your branch name.
```
git push heroku <BRANCH_NAME>:master
```

12. Verify that the deployment succeeded by visiting the Heroku url.

## Setting up Cloud 9 Postgresql
The EC2 instance requires custom setup but production on Heroku does not need the setup.

1. Initialize the database:
```
sudo service postgresql initdb
```
2. Edit `pg_hba.conf` file:
```
sudo vim /var/lib/pgsql9/data/pg_hba.conf
```
3. Update the file that currently reads:
```
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     ident
# IPv4 local connections:
host    all             all             127.0.0.1/32            ident
# IPv6 local connections:
host    all             all             ::1/128                 ident
```

Replace with:
```
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             power_user      0.0.0.0/0               md5
host    all             other_user      0.0.0.0/0               md5
host    all             storageLoader   0.0.0.0/0               md5
# IPv6 local connections:
host    all             all             ::1/128                 md5
```

4. Update port settings:
```
sudo vim /var/lib/pgsql9/data/postgresql.conf
```

Update line 59 from:
```
#listen_addresses = 'localhost'          # what IP address(es) to listen on;
```

To:
```
listen_addresses='*'
```


Uncomment line 63 to be:
```
port = 5432
```

5. Start the server, add ec2-user, create development database
```
sudo service postgresql start
sudo -u postgres createuser ec2
psql -U postgres

create database development with owner ec2;
GRANT ALL PRIVILEGES ON DATABASE development to ec2;
create database test with owner ec2;
GRANT ALL PRIVILEGES ON DATABASE test to ec2;

ALTER USER ec2 WITH SUPERUSER;
\q 

rake db:migrate
rake db:seed
```

6. Make sure everything is running by running the server locally.
```
rails server -p $PORT -b $IP
```
