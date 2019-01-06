# heroku-debian-jupyter

Steps to deploy to heroku

1. Follow the instructions
   [here](https://devcenter.heroku.com/articles/buildpack-builds-heroku-yml)
   to get heroku cli beta installed  
   `heroku update beta`  
   `heroku plugins:install @heroku-cli/plugin-manifest`
2. Clone this repository and change into path
3. `heroku login`  
   `heroku create your-app-name --manifest --region eu`
4. Deploy app using heroku standard methods
  - Use heroku Web-UI to connect app to github repository
  - `heroku git:remote -a young-cove-92241`
    `git push heroku master`


...hope to see an Deploy button soon for manifest/container apps.
