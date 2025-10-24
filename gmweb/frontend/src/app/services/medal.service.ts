import { inject, Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Medal {
  id: number;
  athleteName: string;
  modality: string;
  category: string;
  medalType: string;
}

@Injectable({ providedIn: 'root' })
export class MedalService {
  private http = inject(HttpClient);

  getMedals(): Observable<Medal[]> {
    return this.http.get<Medal[]>('/api/medals');
  }
}
