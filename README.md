Escape

Escape is an outdoor rental equipment application where users can create accounts, post their equipment for rent or choose to rent another user's equipment.

Installing

To start the Escape application, cd into the Escape directory and run the following:

bundle install

rake db:migrate

To host a local server for the application run the following in terminal while in the project directory:

rails s

Visit localhost:3000 in your browser to begin using the application.

User Experience

Once the user has navigated to the Escape homepage, they may click the "Create Account" tab to create a personal Escape account. If they already have an account, they may sign in with their already existing username and password. Once signed in, the user can choose to navigate to pages that allow them to post their own items for rent, or browse all the the items being rented out by other users. Items posted on Escape feature the name of the item, a short description, a price/day of rental, and a reservation form. After reviewing the form, a user can press "Rent" to complete the reservation.

From the homepage, a user can click on the "Rent Items" button to post one of their items for rent. Following this, they will be presented with a form to list the item. After completing the necessary fields, the user can press the "Create Item."

A user also has access to a profile page, that lists all of the items they are renting out, as well as all of the reservations they currently have active. From this page, a user has the option to edit or delete any reservation or listing they have created. In addition, if a user's items have been rented, they have the option of leaving a feedback review for the customer that rented their item. Any user has access to their own reviews via their profile page.

A demo of the application can be found here: 

https://youtu.be/uooUwGvgHos

Authors

Matthew Garrett- MatthewDtotheG

Kenneth Lehr  - kenman21

Acknowledgements

This is a pair programming assignment at the Flatiron School. Thanks to instructors Howard, Tashawn and Garry for their help along the way.
