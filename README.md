# CSCE606-Project
CSCE120 Self-Evaluation Exam

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