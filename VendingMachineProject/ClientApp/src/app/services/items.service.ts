import { Injectable, Inject, Output, EventEmitter } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';
import { Items } from 'src/app/models/Items';
// import { Location, Machine } from 'src/app/models/Machines';
import { Dispense } from '../models/Dispense';

@Injectable({
  providedIn: 'root'
})
export class ItemsService {
  public baseUrl = environment.baseUrl;

  // Item event on selected event.
  itemSelectedEvent = new EventEmitter<Items>();

  //This is the event emitter for transaction result.
  transactionResultEvent = new EventEmitter<Dispense>();

  // machines: Machine[] = [];
  // locations: Location[] = [];

  constructor(private http: HttpClient) {
  }

  getItems(machineId: number): Observable<any> {
    return this.http.get<any>(this.baseUrl + 'items?machineId=' + machineId)
      .pipe(
        map(items => {
          return items;
        })
      );
  }

  // getItems(machineId: number): Items[] {
  //   this.httpClient.get<Items[]>(this.baseUrl + 'items?machineId=' + machineId).subscribe(result => {
  //     this.products = result;
  //   }, error => console.error(error))

  //   return this.products;
  // }

  // getMachines(locationId: number): Machine[] {
  //   this.httpClient.get<Machine[]>(this.baseUrl + 'machines?locationId=' + locationId).subscribe(result => {
  //     this.machines = result;
  //   }, error => console.error(error));

  //   return this.machines;
  // }

  getMachines(locationId: number): Observable<any> {
    return this.http.get<any>(this.baseUrl + 'machines?locationId=' + locationId)
      .pipe(
        map(locations => {
          return locations;
        })
      );
  }

  // getLocations(): Location[] {
  //   this.http.get<Location[]>(this.baseUrl + 'locations').subscribe(result => {
  //     this.locations = result;
  //   }, error => console.error(error));
  //   return this.locations;
  // }

  getLocations(): Observable<any> {
    return this.http.get<any>(this.baseUrl + 'locations')
      .pipe(
        map(locations => {
          return locations;
        })
      );
  }
}
