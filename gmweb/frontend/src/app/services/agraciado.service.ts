import { inject, Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';

export type MedalType = 'HELIO_COSTA' | 'COLAR_MERITO';

export interface Agraciado {
  codigo: number;
  nome: string;
  ano: number;
  cpf?: string | null;
  sexo?: string | null;
  tipoMedalha: MedalType;
  cargoProfissaoId?: number | null;
  cargoProfissaoDescricao?: string | null;
  comarcaId?: number | null;
  comarcaNome?: string | null;
  enviado: boolean;
  disponivelInternet: boolean;
  inMemorian: boolean;
  homonimo: boolean;
}

export interface AgraciadoPayload {
  nome: string;
  ano: number;
  cpf?: string | null;
  sexo?: string | null;
  tipoMedalha: MedalType;
  cargoProfissaoId: number;
  comarcaId?: number | null;
  enviado: boolean;
  disponivelInternet: boolean;
  inMemorian: boolean;
  homonimo: boolean;
}

export interface CargoProfissao {
  codigo: number;
  descricao: string;
}

export interface Comarca {
  codigo: number;
  nome: string;
}

export interface SexoOption {
  codigo: string;
  descricao: string;
}

@Injectable({ providedIn: 'root' })
export class AgraciadoService {
  private http = inject(HttpClient);

  listar(tipo: MedalType, ano?: number | null, nome?: string | null): Observable<Agraciado[]> {
    let params = new HttpParams().set('tipo', tipo);
    if (ano != null) {
      params = params.set('ano', ano.toString());
    }
    if (nome) {
      params = params.set('nome', nome);
    }
    return this.http.get<Agraciado[]>('/api/agraciados', { params });
  }

  criar(payload: AgraciadoPayload): Observable<Agraciado> {
    return this.http.post<Agraciado>('/api/agraciados', payload);
  }

  atualizar(codigo: number, payload: AgraciadoPayload): Observable<Agraciado> {
    return this.http.put<Agraciado>(`/api/agraciados/${codigo}`, payload);
  }

  excluir(codigo: number): Observable<void> {
    return this.http.delete<void>(`/api/agraciados/${codigo}`);
  }

  listarCargos(): Observable<CargoProfissao[]> {
    return this.http.get<CargoProfissao[]>('/api/cargos-profissao');
  }

  listarComarcas(): Observable<Comarca[]> {
    return this.http.get<Comarca[]>('/api/comarcas');
  }

  listarSexos(): Observable<SexoOption[]> {
    return this.http.get<SexoOption[]>('/api/referencias/sexos');
  }
}
