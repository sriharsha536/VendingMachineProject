import { Component, OnInit } from "@angular/core";
import { TransactionsService } from "src/app/services/transactions.service";
import { Denomination } from "src/app/models/Denomination";
import { Items } from "src/app/models/Items";
import { ItemsService } from "src/app/services/items.service";
import { Transaction } from "src/app/models/Transaction";
import { Dispense } from "src/app/models/Dispense";

@Component({
  selector: "app-transaction",
  templateUrl: "./transaction.component.html",
  styleUrls: ["./transaction.component.css"],
})
export class TransactionComponent implements OnInit {
  transactionService: TransactionsService;
  itemsService: ItemsService;
  totalAmountDeposited: number = 0;
  totalDispensed: number = 0;
  itemSelected: Items;
  dispense: Dispense;
  displayCount = false;
  coin = [];

  constructor(
    transactionService: TransactionsService,
    itemsService: ItemsService
  ) {
    this.transactionService = transactionService;
    this.itemsService = itemsService;

  }

  ngOnInit(): void {
    this.transactionService.coinInsertedEvent.subscribe((insertedCoin: Denomination) => {
      this.transactionUpdated(insertedCoin);
    });

    this.itemsService.itemSelectedEvent.subscribe((selectedItem: Items) => {
      this.showItem(selectedItem);
    });
  }

  showItem(selectedItem: Items) {
    this.itemSelected = selectedItem;
    this.totalDispensed = 0;
  }

  transactionUpdated(insertedCoin: Denomination) {
    this.totalAmountDeposited = this.totalAmountDeposited + insertedCoin.amount;
    this.totalAmountDeposited = Number(
      (Math.round(this.totalAmountDeposited * 100) / 100).toFixed(2)
    );
  }

  calculateChangeAndDispense() {
    this.coin = [];
    var change = this.totalDispensed;

    var quarters = Math.floor(Number(change / 0.25));
    if (quarters >= 1) change = change - quarters * 0.25;

    var dimes = Math.floor(Number(change / 0.1));
    if (dimes >= 1) change = change - dimes * 0.1;

    var nickels = Math.floor(Number(change / 0.05));
    if (nickels >= 1) change = change - nickels * 0.05;

    var penny = Math.ceil(Number(change / 0.01));

    this.coin.push({ key: "Quarters", value: quarters });
    this.coin.push({ key: "Dimes", value: dimes });
    this.coin.push({ key: "Nikel", value: nickels });
    this.coin.push({ key: "Penny", value: penny });
  }

  onCancelBtnClick() {
    this.totalAmountDeposited = 0;
    this.itemSelected = null;
  }

  onBuyBtnClick() {
    var transaction = new Transaction(
      0,
      this.itemSelected.machineId,
      this.itemSelected.itemId,
      this.totalAmountDeposited
    );

    this.transactionService
      .CompleteTransaction(transaction)
      .subscribe((data) => {
        this.dispense = data;
        this.totalDispensed = this.dispense.dispensedAmount;
        this.totalAmountDeposited = 0;
        this.itemSelected = null;
        this.calculateChangeAndDispense();
        this.itemsService.transactionResultEvent.emit(this.dispense);
      });
  }
}
