const cds = require('@sap/cds');

module.exports = class BookService extends cds.ApplicationService {
  init() {
    const { Books } = this.entities;

    // Validation: amount must not be negative.
    this.before(['CREATE', 'UPDATE'], Books, (req) => {
      const { amount } = req.data;
      if (amount != null && amount < 0) {
        req.error(400, 'Amount must not be negative', 'amount');
      }
    });

    // Bound action: submit a Book.
    this.on('submit', Books, async (req) => {
      const id = req.params[req.params.length - 1];
      await UPDATE(Books, id).with({ status: 'Submitted' });
      return SELECT.one.from(Books, id);
    });

    return super.init();
  }
};