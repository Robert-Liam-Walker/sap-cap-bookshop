using com.liamwalker.bookshop as my from '../db/schema';

/** OData V4 service exposing the Bookshop domain. */
service BookService @(path: '/bookshop') {

  @odata.draft.enabled
  @cds.redirection.target
  entity Books as projection on my.Books
    actions {
      /** Transition this Book to status 'Submitted'. */
      action submit() returns Books;
    };

  entity BookItems as projection on my.BookItems;

  /** Read-only aggregate view of open items. */
  @readonly
  entity OpenBooks as projection on my.Books where status = 'Open';
}