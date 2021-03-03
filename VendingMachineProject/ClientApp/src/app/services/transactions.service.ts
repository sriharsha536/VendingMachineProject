import { Injectable, EventEmitter } from '@angular/core';
import { Denomination } from 'src/app/models/Denomination';
import { Transaction } from '../models/Transaction';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { map } from 'rxjs/operators';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class TransactionsService {
  public baseUrl = environment.baseUrl;
  coinInsertedEvent = new EventEmitter<Denomination>();
  constructor(private http: HttpClient) { }

  CompleteTransaction(transaction: Transaction): Observable<any> {
    return this.http.post<any>(this.baseUrl + "complete", transaction);
  }
}
