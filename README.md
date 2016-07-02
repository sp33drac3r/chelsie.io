# chelsie.io
chelsie.io is a publicly available API that serves location-specific help resources for survivors of sexual assault. Currently, chelsie.io serves information about local [RAINN](https://www.rainn.org/) affiliate rape crisis centers.

## Routes
**GET**  
**chelsie.io/centers/:id**  
returns all crisis center information by id  
**chelsie.io/centers/:id/services**  
returns just services offered, by id  
**chelsie.io/centers/:id/populations_served**  
returns just populations served, by id  
**chelsie.io/centers/search/:query**  
returns all crisis centers matching search query. Query string   should be formatted 'chelsie.io/centers/search/[key=value&key=value]'  
**chelsie.io/centers/geo/:lat/:lng/:radius**  
returns all crisis centers within a given radius based on nearness to a set of lat/lng coordinates.  

## Coming Soon
* Additional crisis centers, not only RAINN affiliates.
* Additional local community resources, not limited to rape crisis centers.
* POST requests. Resource center comments.

## Who is Chelsie?
https://mjakobhayes.wordpress.com/2016/04/25/to-kenyon-college-for-failing-my-little-sister/

## Contributing
Contributions welcome!
Fork it, clone it, change it and make a pull request with a clear, detailed description of the change or feature.
We will review and merge it.
