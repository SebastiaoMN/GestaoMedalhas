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

export interface AgraciadoRelatorio {
  codigo: number;
  nome: string;
  ano: number;
  comarca: string | null;
  cargoProfissao: string | null;
  enviado: string;
  disponivelInternet: string;
  inMemorian: string;
  homonimo: string;
}

export interface ComarcaSemIndicacao {
  codigo: number;
  comarca: string;
  ano: number;
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

  atualizarDisponibilidadeInternet(payload: { tipo: MedalType; ano: number; disponivel: boolean }): Observable<void> {
    return this.http.post<void>('/api/agraciados/disponibilidade-internet', payload);
  }

  relatorioPorAno(tipo: MedalType, ano: number): Observable<AgraciadoRelatorio[]> {
    const params = new HttpParams().set('tipo', tipo).set('ano', ano.toString());
    return this.http.get<AgraciadoRelatorio[]>('/api/agraciados/relatorios/ano', { params });
  }

  relatorioPorOrdem(tipo: MedalType): Observable<AgraciadoRelatorio[]> {
    const params = new HttpParams().set('tipo', tipo);
    return this.http.get<AgraciadoRelatorio[]>('/api/agraciados/relatorios/ordem', { params });
  }

  relatorioPorCargo(tipo: MedalType, cargoId?: number | null): Observable<AgraciadoRelatorio[]> {
    let params = new HttpParams().set('tipo', tipo);
    if (cargoId != null) {
      params = params.set('cargoId', cargoId.toString());
    }
    return this.http.get<AgraciadoRelatorio[]>('/api/agraciados/relatorios/cargo', { params });
  }

  comarcasSemIndicacao(ano: number): Observable<ComarcaSemIndicacao[]> {
    const params = new HttpParams().set('ano', ano.toString());
    return this.http.get<ComarcaSemIndicacao[]>('/api/agraciados/relatorios/sem-indicacao', { params });
  }

  baixarMinasGerais(ano: number): Observable<Blob> {
    const params = new HttpParams().set('ano', ano.toString());
    return this.http.get('/api/agraciados/relatorios/minas-gerais', { params, responseType: 'blob' });
  }
}
