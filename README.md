# README
This demo app is meant to show how to interation with [ESPEN Portal](https://admin.espen.afro.who.int/)'s api. The link below provides documentation for the API and also provides a form to request an API key (which is required).

https://admin.espen.afro.who.int/docs/api

This README should provide everything needed to get this demo app up and running locally. No database is required for setup and the only thing that is needed is an ESPEN API key.

Step 1:

clone project locally and run `bundle install`

Step 2: 

Create `.env` file and setup required config variables. Which are `ESPEN_ENDPOINT` and `ESPEN_API_KEY`

Step 3:

Start the app with `foreman run rails s` and navigate to the localhost

### General Info

- Ruby `2.6.5`
- Rails `5.1.4`
