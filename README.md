# Assignments

Below are the 3 assignments submitted as one github repository. Click on the assignment topic links/headings below to see the code and respective README files. The sections below summarize the code submissions.

## [1: Ruby Gem: Currency Converter](./cur-gem)

- Gem was built and tested on Docker environment. There should not be an issue running it without Docker but there is not documentation provided for one to run outside of docker. All that a developer need is ruby and preferably the version 3.0.1
- See the [README](./cur-gem/README.md) for dev/test or docker specific instructions. It also highlights a few possible changes writing specs

## [2: Code Refactor](./02-refactoring)

- Code changes
  - Created mutliple smaller methods instead of one method that had poor readability
  - Used `switch` block instead of multiple `if-else` statements. I feel it makes the code better readable and maintenable
  - Added attribute reader methods for all the instance variables to avoid using `@` in many places. I find this much cleaner
- Test case changes
  - Grouped test cases into different contexts for better readability. `rspec -f d`
  - Added one test case to address the bug fix
- Another approach for code coverage: (suggestion)
  - Write test cases for individual smaller functions such as `format_for_same_day`, `format_for_different_dates`, `full_date`, `same_day?` etc.
  - Stub the response of already tested methods while testing `to_s`. For example, stub the response of `same_day?` to return true and expect the `format_for_same_day` be invoked

## [3: JS/UI App: Currency Converter](./js-cur-converter)

- **Note:** Problem statement wasn't clear
  - Name of the class `CurrencyConverter` was suggested but the example provided was bit off
  - The example provided was copy of assignment-1 description
  - There was no mention of if a JS framework/library can be used for the UI app or to use Vanilla Javascript 
- JS / UI Application Code
  - I chose `Vue.js` to build the UI application. There are only two files: `index.html` & `app.js`
  - App uses Bootstrap for CSS (not JS components)
  - Both for Vue.js and Bootstrap, it uses CDN URLs for JS & CSS
  - JS file `app.js` could have been split into two files but chose to keep it one to not over-complicate the code
  - Instead two separate pages for currency converter and rate table, the app does those two in a single page. This may be going against the requirement but provides a better UX.

