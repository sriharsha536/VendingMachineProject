export class Dispense {
  public transactionId: number;
  public machineId: number;
  public dispensedAmount: number;
  public transactionStatus: string;
  constructor(transactionId: number, machineId: number, dispensedAmount: number, transactionStatus: string) {
    this.transactionId = transactionId;
    this.machineId = machineId;
    this.dispensedAmount = dispensedAmount;
    this.transactionStatus = transactionStatus;
  }
}
