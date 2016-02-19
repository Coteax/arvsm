##ARVSM
Absence Request and Vacation Schedule Management
##Case
An ordinary way for any employee to request an approval to leave for some hours/days off the office is to send an email to the HR department and his Reporting manager. Then both parties approve or deny the request, resulting in an overload of communications over emails, messengers etc.
##Solution
This application allows every employee, no matter his position, to place an absense request through a centralised web interface. Then another employee with the **manager** role may approve or deny requests assigned to him.

###Features for Requesters
- Requesters could submit a absense request of type Full, Partial and Sickness.
- For Full and Sickness type Requesters could specify Starting and Ending date , and days of leave
- For Partial type Requesters specify Date and time interval
- In addition they should provide a comment
- After submiting their request they could view their past requests  in tabular form along with their statuses
- After request gets approved or denied from the assigned manager, request changes status and requesters can view their status and an additional comment from the manager
- Requesters receive an email when their request gets approved or denied

###Features for Managers
- Managers can view incoming requests in a tabular view
- Managers can optionally include a response to the requester
- Managers can approve or deny a request
- Managers receive email when a new request assigned to them arrives

###Screenshots

![Imgur](http://i.imgur.com/KxO0YUs.png)

![Imgur](http://i.imgur.com/DhFaaWf.png)

###Instructions
In order to run the application
- `bundle install` Install required gems
- `db:setup` Setup and seed the database
- `rails s` Run embedded rails server

### Demo crendentials
#### Employee
- **email:** alonzo@gmail.com  **password:**  demo
- **email:** james@gmail.com  **password:**  demo

#### Manager
- **email:** sherman@gmail.com  **password:**  demo
- **email:** darin@gmail.com  **password:**  demo

###Specifications
- Ruby on Rails v4.2.x
- PostgreSQL 9.x
- RSpec
- Semantic UI 2.1.8
