# OPNex-REST-StreamIngestion

This just pretend to be a small sample to test how to send a file from inside InterSystems IRIS to a REST service. 
> *Please don't use for production use and assume that there is lack of error handling in the code.*

## Contents

### REST service

To do that I've just implemented a REST service in ``OPNEx.Rest.Service.fileDispatch`` class, with just 2 operations:
- GET - /echo - to test that we reach the REST service
- POST - /file - to recieve a file (it expects the file in the body of the POST request)

Once the service receives the file, it stores it as a new object of type: ``OPNEx.Rest.Data.FileStore``

We could just test this REST service using POSTMAN or whatever REST client.
### Sender

Within class ``OPNEx.Rest.Data.FileStore`` I've implemetnated a method: ``SendFile``; that accepts and ID as an argument. It should be a numeric ID of one of the objects (streams) stored in the class.

This methos instantiates the object, take the stream asssociated, and send it to the REST service... in this case, the REST service I implemented for testing but it could be whatever other external REST services.

Once you have some stream stored in the class, you could tested directly from your terminal:

```objectscript
write ##class(OPNEx.Rest.Data.FileStore).SendFile(1)
```

And voilá! Hope it helps. Enjoy!
