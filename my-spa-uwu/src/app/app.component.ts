import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { HttpClientModule } from '@angular/common/http';
import { HttpClient } from '@angular/common/http';
import { Item } from '../models/item'

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet, HttpClientModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss',
})
export class AppComponent {
  title = 'application';
  items: Item[] = [];
  constructor(private http: HttpClient) {
    this.getItems();
  }

  getItems() {
    const apiUrl = '<API_URL>';
    const endpoint = `${apiUrl}/items`;

    return this.http.get<Item[]>(endpoint).subscribe((result) => {
      console.log(result)
      this.items = result;
    });
  }
}
