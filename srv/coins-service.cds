using { com.jenspots.coins } from '../db/schema';

/** Expose the three entities as part of the service. */
service CoinsService @(path: '/api/v1') @(requires: 'authenticated-user') {
  entity Transactions @(restrict: [
    { grant: 'READ', to: 'Administrator' },
  ]) as projection on coins.Transactions;

  entity TransactionCategories @(restrict: [
    { grant: 'READ', to: 'Administrator' },
  ]) as projection on coins.TransactionCategories;

  entity Partners @(restrict: [
    { grant: 'READ', to: 'Administrator' },
  ]) as projection on coins.Partners;
}
