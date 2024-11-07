using { com.jenspots.coins } from '../db/schema';

/** Expose the three entities as part of the service. */
service CoinsService @(path: '/api/v1') {
  entity Transactions as projection on coins.Transactions;
  entity TransactionCategories as projection on coins.TransactionCategories;
  entity Partners as projection on coins.Partners;
}
