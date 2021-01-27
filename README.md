# README
This simple demo app is meant to show how to integrate with [ESPEN Portal](https://admin.espen.afro.who.int/)'s API. The link below provides documentation for the API and also provides a form to request an API key (which is required).

https://admin.espen.afro.who.int/docs/api

This README should provide everything needed to get this demo app up and running locally. No database is required for setup and the only thing that is needed is an ESPEN API key.

Step 1:

Clone project locally and run `bundle install`

Step 2: 

Create `.env` file and setup required config variables. Which are `ESPEN_ENDPOINT` and `ESPEN_API_KEY`

Step 3:

Start the app with `foreman run rails s` and navigate to the localhost

At this point the app should be working locally. From the homepage you can choose to search for JRF or JRSM data by Country and Year.

### General Info

- Ruby `2.6.5`
- Rails `5.1.4`
