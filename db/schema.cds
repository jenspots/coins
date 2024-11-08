using { cuid, managed } from '@sap/cds/common';

namespace com.jenspots.coins;

/**
 * A transaction represents a single purchase or income event.
 */
define entity Transactions : cuid, managed {
  /** The amount expressed in cents. */
  amountInCents : Integer not null;
  /** When the transaction occurred. */
  executedAt : DateTime not null;
  /** Simple explanation what the transaction contains. */
  description: String null;
  /** Each transaction is grouped into a single category. */
  category : Association to TransactionCategories;
  /** The partner at the other end of the transaction. */
  partner : Association to Partners;
}

/**
 * All transactions are grouped into categories.
 */
define entity TransactionCategories : cuid, managed {
  /** The name of the category. */
  name : String not null;
  /** An optional description of the category. */
  description : String null;
  /** List of all transactions in this category. */
  transactions : Association to many Transactions
    on transactions.category = $self;
}

/** The entity at the other end of the transaction. */
define entity Partners : cuid, managed {
  /** The name of the partner. */
  name : String not null;
  /** An optional description of the category. */
  description : String null;
  /** All associated transactions with this entity. */
  transactions : Association to many Transactions
    on transactions.partner = $self;
}
