import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { ItemsService } from '../../services/items.service';
import { TransactionsService } from '../../services/transactions.service';
import { Items } from 'src/app/models/Items';
import { Dispense } from 'src/app/models/Dispense';

@Component({
  selector: 'app-vendingmachine',
  templateUrl: './vendingmachine.component.html',
  styleUrls: ['./vendingmachine.component.css']
})

export class VendingMachineComponent implements OnInit {
  locations: {};
  machines: {};
  machineId: number;
  items: Items[];

  constructor(private itemsService: ItemsService) { }

  ngOnInit(): void {
    this.itemsService.getLocations().subscribe(data => { this.locations = data });

    // this.getItemsByMachine(this.machineId);
    this.itemsService.transactionResultEvent.subscribe((dispense: Dispense) => {
      this.getItemsByMachine(dispense.machineId);
    });
  }

  getItemsByMachine(machineId: number) {
    this.itemsService.getItems(machineId).subscribe(data => { this.items = data; });
  }

  onChangeLocation(locationId: number) {
    if (locationId)
      this.itemsService.getMachines(locationId).subscribe((data => { this.machines = data }));
    else
      this.machines = {};
  }

  onChangeMachine(machineId: number) {
    if (machineId)
      this.getItemsByMachine(machineId);
    else
      this.machines = {};
  }
}
