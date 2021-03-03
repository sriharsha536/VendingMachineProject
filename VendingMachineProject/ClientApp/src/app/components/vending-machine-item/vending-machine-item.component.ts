import { Component, OnInit, Input, ViewChild, ElementRef } from '@angular/core';
import { Items } from 'src/app/models/Items';
import { ItemsService } from 'src/app/services/items.service';

@Component({
  selector: 'app-vending-machine-item',
  templateUrl: './vending-machine-item.component.html',
  styleUrls: ['./vending-machine-item.component.css']
})
export class VendingMachineItemComponent implements OnInit {
  itemService: ItemsService;
  @Input('vendingItem') item: Items;
  @Input('displayCount') displayCount: boolean = true;
  @ViewChild('itemCard', { static: false }) itemCard: ElementRef;

  constructor(itemsService: ItemsService) {
    this.itemService = itemsService;
  }

  ngOnInit() {
  }

  vendingItemSelected() {
    this.itemService.itemSelectedEvent.emit(this.item);
  }

  ngAfterViewInit() {
    if (this.item.count == 0) {
      this.itemCard.nativeElement.className = "btn-disabled";
    }
  }
}
