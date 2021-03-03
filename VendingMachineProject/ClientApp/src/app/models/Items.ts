export class Items {
  public itemId: number;
  public machineId: number;
  public itemName: string;
  public amount: string;
  public count: number;
  public itemUrl: string;

  constructor(itemId: number, machineId: number, itemName: string, amount: string, count: number, itemUrl: string) {
    this.itemId = itemId;
    this.machineId = machineId;
    this.itemName = itemName;
    this.amount = amount;
    this.count = count;
    this.itemUrl = itemUrl;
  }
}