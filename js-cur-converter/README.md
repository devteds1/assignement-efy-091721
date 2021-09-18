# JS/UI Application

Currency converter UI app that can be run locally. Built as SPA that has following two sections on the home page.

1. Form section that allows users to enter currency & amount to be converted to another currency.
2. Currency Conversion Rates/Table section that allows users to select a base currency and display conversion rates across other currencies in a tabular format

Quick summary of the app dev environment:

- Application is built using Vue.js, Bootstrap 5; Uses CDN urls for JS & CSS
- Minimal code and no complex setup such as Webpack & NPM/YARN etc.
- App does not have code coverage
- There is not UI to load conversion rates. It will have  to done manually [in app.js code](https://github.com/devteds1/assignment-efy-091721/blob/ebb0a2e8fbba980ee6fdb42ac27a3c0f875763c8/js-cur-converter/app.js#L21).

Run / Launch

```
cd js-cur-converter
open index.html
# Or use the `file:///` URL using the location of index.html
```

UI Sample

![UI Sample](/js-cur-converter/doc/jsapp-screenshoot.png)
