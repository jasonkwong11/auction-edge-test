# Auction-Edge Test

## Installation

To run this simply clone or fork it, run `bundle install`, `rails db:migrate`, `rails s`, then navigate to localhost:3000 in your browser.

## Usage

Click the 'Choose File' button and navigate to the root directory. Select 'example_input.csv'. Then click the 'Import CSV'.

Note: If the user attempts to upload a file that doesn't end in '.csv', an error is raised. Then the user is instructed to navigate back and correctly upload a CSV.

Run tests with by running `rspec`

## Todos
- [ ] Tests
- [ ] Documentation
