#Week 8: CoreData Hotel Service

##Overview:
>Students will be creating a Hotel Service, allowing them to book hotel rooms, see different hotels, etc.

  * [Class 1:](class-1/)
  	* Setup your MOM with entities for Hotel >> Room >> Reservation > Guest
    * Seed your database with a few hotels and rooms.
    * Create a table view based hotel list view controller. This should show a list of hotels
    * Upon selecting a hotel, push to RoomsViewController, which shows all the rooms of that hotel in another table view.

  * [Class 2:](class-2/)
    * Seed your data base with the JSON payload provided
    * Implement Book functionality. Guests should be able to set both, the start and end reservation dates, specify the room they want and finally book it.
    	* Guest name is required... feel free to add more requirements.
    	* When selecting dates, users should not be allowed to select dates in the past for the start date.
    	* Users should also not be able to book an end date before a start date.
    		* Present an alert for the user if they attempt the above.
    * Add Attributes to your ManagedObjectModel.
    * Change your Guest model accordingly to have firstName, lastName, and email address.
    * Update UI to include fields for lastName and email in BookVC and setup constraints.
    * Assign lastName and email to guest.

  * [Class 3:](class-3/)
  	* Create a ReservationService class that should abstract away your business logic (booking reservations, checking availability, etc)
    * Add UnitTests to your project. Write a couple of tests for your model.
    * Implement search by guest name - Lookup view controller.
    * Implement NSFetchedResultsController in (at least) one of your view controllers.
	* **Code Challenge:**
		*
	* **Bonus:**
		* Separate your core data setup into a separate CoreDataStack Class.

  * [Class 4:](class-4/)
   	* Write unit tests for your Model objects.
    * Implement analytics into your app.
    * Migrate your existing model into a new model with at least one new attribute.
	* **Code Challenge:**
		*
	* **Bonus:**
		* Localize your app for another language (your pick).


  * [Class 5:](class-5/)
  	* **Potential Guest Speakers:**

##[Other Resources:](Resources/)
* [Homework Grading Standard](Resources/hw-grading-standard/)
* [Whiteboarding Grading Standard](Resources/wb-grading-standard/)
* [Project Week Grading Standard](Resources/pw-grading-standard/)
* [Reading Assignment Grading Standard](Resources/ra-grading-standard/)
