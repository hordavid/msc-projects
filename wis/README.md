# WIS Simple SOA Homework
---

#### Requirements

* [Python 3.6](https://www.python.org/downloads/) - Python 3.6 interpreter
* [MongoDB Server Community](https://www.mongodb.com/download-center/community) - MongoDB is a document-oriented database
* [MongoDB Compass Community](https://www.mongodb.com/download-center/compass?jmp=hero) - Simple GUI for MongoDB
* Python packages
    * __pymongo__ is a MongoDB client library for Python
    * __spyne__ is a SOAP web service library for Python
    * __lxml__ is a SOAP XML based message support library for Python
    * __flask__ is a microframework for Python
    * __flask-restful__ is an extension for Flask that adds support for building REST APIs
    * __zeep__ is a fast and modern Python SOAP client
    * __requests__ is an elegant and simple HTTP library for Python


#### Install

* Install Python 3.6 interpreter
* Install MongoDB Server and MongoDB Compass Community versions
* Install Python packages
    ```$> pip install requirements.txt```
* Create ```shop``` database in Compass
* Create ```user```, ```product``` and ```purchase``` collections into shop database


#### Running the simple SOA environment

* Open the ```wis``` folder
* Run ```db_init.py``` script
    ```$>python db_init.py```
* Start REST Microservice
    ```$>python rest_microservice/rest_microservice.py```
* Start SOAP Microservice
    ```$>python soap_microservice/soap_microservice.py```
* Start SOA Client for testing microservices
    ```$>python soa_client.py```