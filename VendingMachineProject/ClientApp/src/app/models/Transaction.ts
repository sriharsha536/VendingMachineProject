export class Transaction {
  public transactionId: number;
  public machineId: number;
  public itemId: number;
  public totalAmount: number;
  constructor(transactionId: number, machineId: number, itemId: number, totalAmount: number){
    this.transactionId = transactionId;
    this.machineId = machineId;
    this.itemId = itemId;
    this.totalAmount = totalAmount;
  }
}
