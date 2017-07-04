# Auction-Edge Test

## Installation

To run this simply clone or fork it, run `bundle install`, `rails db:migrate`, `rails s`, then navigate to localhost:3000 in your browser.

## Usage

Click the 'Choose File' button and navigate to the root directory. Select 'example_input.csv'. Then click the 'Import CSV'.

Note: If the user attempts to upload a file that doesn't end in '.csv', an error is raised. Then the user is instructed to navigate back and correctly upload a CSV.

Run tests with by running `rspec`

## Todos
- [Done] Accept (via a form) a CSV file
- [Done] An example input file named example_input.csv should accompany this code challenge.
- [Done] Your app must parse the given file and store the information in a database.

After upload, your application should output:
- [Done] A list of the auctions (name and city)
- [Done] The number of vehicles each auction has sold
- [Done] The total profit the auction made selling those vehicles
- [Done] The average profit the auction made per vehicle.


- [Done] Model Tests
- [Done] Controller Tests
- [Done] Feature Tests
- [Done] Documentation
