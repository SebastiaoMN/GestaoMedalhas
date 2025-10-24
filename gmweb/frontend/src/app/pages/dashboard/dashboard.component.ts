import { Component, inject, OnInit, signal } from '@angular/core';
import { AsyncPipe, NgFor, NgIf } from '@angular/common';
import { MatCardModule } from '@angular/material/card';
import { MatTableModule } from '@angular/material/table';
import { MedalService, Medal } from '../../services/medal.service';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [MatCardModule, MatTableModule, NgFor, NgIf, AsyncPipe],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  private medalService = inject(MedalService);
  medals = signal<Medal[]>([]);
  displayedColumns = ['athleteName', 'modality', 'category', 'medalType'];

  ngOnInit(): void {
    this.medalService.getMedals().subscribe({
      next: medals => this.medals.set(medals),
      error: err => console.error('Erro ao carregar medalhas', err)
    });
  }
}
