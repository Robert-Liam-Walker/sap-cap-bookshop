# cap-bookshop

A **SAP Cloud Application Programming Model (CAP)** service for the **Bookshop** domain.

OData V4 service over a composition of `Books` and `BookItems`, backed by SQLite
for local development, with sample data and a bound `submit` action.

## Model
- `db/schema.cds` - domain model (`Books` 1:n `BookItems`), using `cuid`/`managed` aspects
- `srv/service.cds` - `BookService` at `/bookshop`, draft-enabled, with a `submit` action and an `OpenBooks` view
- `srv/service.js` - custom handlers: non-negative-amount validation + `submit` implementation
- `db/data/*.csv` - sample data

## Run
```bash
npm install
npm run watch      # cds watch -> http://localhost:4004
```
Open http://localhost:4004 for the service index. Try the calls in `test/requests.http`.

## Build / validate
```bash
npx cds compile srv      # validate the model
npm run build            # cds build
```

> Generated as part of a batch of SAP sample apps. Domain: Bookshop.