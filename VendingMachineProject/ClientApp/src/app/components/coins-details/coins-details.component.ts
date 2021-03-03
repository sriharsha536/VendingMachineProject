import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { Denomination } from 'src/app/models/Denomination';
import { TransactionsService } from 'src/app/services/transactions.service';

@Component({
  selector: 'app-coins-details',
  templateUrl: './coins-details.component.html',
  styleUrls: ['./coins-details.component.css']
})
export class CoinsDetailsComponent implements OnInit {
  transactionService : TransactionsService
  denominators : Denomination[] = [];
  constructor(transactionService: TransactionsService) {
    this.transactionService = transactionService;
  }

  ngOnInit() {
    this.fillDenominators();
  }

  fillDenominators(){
    this.denominators.push({key: 1, displayValue:"1 Dollar", amount:1});
    this.denominators.push({key: 2, displayValue:"25 Cents", amount: 0.25});
    this.denominators.push({key: 3, displayValue:"10 Cents", amount: 0.10});
    this.denominators.push({key: 4, displayValue:"5 Cents", amount: 0.05});
    this.denominators.push({key: 5, displayValue:"1 Cent", amount: 0.01});
  }

  coinInserted(coin: Denomination){
    this.transactionService.coinInsertedEvent.emit(coin);
  }
}
