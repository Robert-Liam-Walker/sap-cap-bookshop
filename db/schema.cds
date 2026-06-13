namespace com.liamwalker.bookshop;

using { cuid, managed, Currency } from '@sap/cds/common';

/** Root business object for the Bookshop domain. */
entity Books : cuid, managed {
  title       : String(111) @mandatory;
  status      : String(20) default 'Open';
  amount      : Decimal(15, 2) default 0;
  currency    : Currency;
  dueDate     : Date;
  description : String(1000);
  items       : Composition of many BookItems on items.parent = $self;
}

/** Line items belonging to a Book. */
entity BookItems : cuid {
  parent   : Association to Books;
  position : Integer;
  name     : String(111);
  quantity : Integer default 1;
  price    : Decimal(15, 2) default 0;
}