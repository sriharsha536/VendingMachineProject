import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { VendingMachineComponent } from './components/vendingmachine/vendingmachine.component';
import { CoinsDetailsComponent } from './components/coins-details/coins-details.component';
import { VendingMachineItemComponent } from './components/vending-machine-item/vending-machine-item.component';
import { TransactionComponent } from "./components/transaction/transaction.component";

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    VendingMachineComponent,
    VendingMachineItemComponent,
    CoinsDetailsComponent,
    TransactionComponent
  ],
  imports: [
    BrowserModule.withServerTransition({ appId: 'ng-cli-universal' }),
    HttpClientModule,
    FormsModule,
    RouterModule.forRoot([
      { path: '', component: VendingMachineComponent },
    ])
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
