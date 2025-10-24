import { Component, OnInit, computed, inject, signal } from '@angular/core';
import { AsyncPipe, NgFor, NgIf } from '@angular/common';
import { FormBuilder, FormGroup, ReactiveFormsModule, Validators } from '@angular/forms';
import { MatCardModule } from '@angular/material/card';
import { MatTableModule } from '@angular/material/table';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatSelectModule } from '@angular/material/select';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatIconModule } from '@angular/material/icon';
import { MatTooltipModule } from '@angular/material/tooltip';
import { MatSnackBar, MatSnackBarModule } from '@angular/material/snack-bar';
import {
  Agraciado,
  AgraciadoPayload,
  AgraciadoService,
  CargoProfissao,
  Comarca,
  MedalType,
  SexoOption
} from '../../services/agraciado.service';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [
    MatCardModule,
    MatTableModule,
    MatFormFieldModule,
    MatSelectModule,
    MatInputModule,
    MatButtonModule,
    MatSlideToggleModule,
    MatIconModule,
    MatSnackBarModule,
    MatTooltipModule,
    ReactiveFormsModule,
    NgFor,
    NgIf,
    AsyncPipe
  ],
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})
export class DashboardComponent implements OnInit {
  private service = inject(AgraciadoService);
  private fb = inject(FormBuilder);
  private snackbar = inject(MatSnackBar);

  agraciados = signal<Agraciado[]>([]);
  cargos = signal<CargoProfissao[]>([]);
  comarcas = signal<Comarca[]>([]);
  sexos = signal<SexoOption[]>([]);
  displayedColumns = ['codigo', 'nome', 'ano', 'cargo', 'comarca', 'enviado', 'internet', 'acoes'];
  selecionado = signal<Agraciado | null>(null);

  filtroForm: FormGroup = this.fb.group({
    tipo: ['HELIO_COSTA' as MedalType, Validators.required],
    ano: [null],
    nome: ['']
  });

  cadastroForm: FormGroup = this.fb.group({
    nome: ['', [Validators.required, Validators.maxLength(80)]],
    ano: [new Date().getFullYear(), [Validators.required, Validators.min(1900)]],
    cpf: [''],
    sexo: [''],
    tipoMedalha: ['HELIO_COSTA' as MedalType, Validators.required],
    cargoProfissaoId: [null as number | null, Validators.required],
    comarcaId: [null as number | null],
    enviado: [false],
    disponivelInternet: [false],
    inMemorian: [false],
    homonimo: [false]
  });

  somenteLeituraComarca = computed(() => this.cadastroForm.get('tipoMedalha')?.value === 'COLAR_MERITO');

  ngOnInit(): void {
    this.carregarReferencia();
    this.buscar();
    this.filtroForm.get('tipo')?.valueChanges.subscribe(tipo => {
      this.cadastroForm.patchValue({ tipoMedalha: tipo });
      this.buscar();
    });
    const comarcaControl = this.cadastroForm.get('comarcaId');
    this.cadastroForm.get('tipoMedalha')?.valueChanges.subscribe(tipo => {
      if (tipo === 'COLAR_MERITO') {
        comarcaControl?.setValue(null, { emitEvent: false });
        comarcaControl?.clearValidators();
        comarcaControl?.disable({ emitEvent: false });
      } else {
        comarcaControl?.enable({ emitEvent: false });
        comarcaControl?.setValidators(Validators.required);
      }
      comarcaControl?.updateValueAndValidity({ emitEvent: false });
    });
    if (this.cadastroForm.get('tipoMedalha')?.value === 'HELIO_COSTA') {
      comarcaControl?.setValidators(Validators.required);
    } else {
      comarcaControl?.disable({ emitEvent: false });
    }
  }

  buscar(): void {
    const { tipo, ano, nome } = this.filtroForm.value;
    this.service.listar(tipo, ano, nome).subscribe({
      next: agraciados => this.agraciados.set(agraciados),
      error: err => this.snackbar.open('Erro ao carregar agraciados', 'Fechar', { duration: 5000 })
    });
  }

  selecionar(agraciado: Agraciado): void {
    this.selecionado.set(agraciado);
    this.cadastroForm.patchValue({
      nome: agraciado.nome,
      ano: agraciado.ano,
      cpf: agraciado.cpf ?? '',
      sexo: agraciado.sexo ?? '',
      tipoMedalha: agraciado.tipoMedalha,
      cargoProfissaoId: agraciado.cargoProfissaoId ?? null,
      comarcaId: agraciado.comarcaId ?? null,
      enviado: agraciado.enviado,
      disponivelInternet: agraciado.disponivelInternet,
      inMemorian: agraciado.inMemorian,
      homonimo: agraciado.homonimo
    });
  }

  novo(): void {
    this.selecionado.set(null);
    this.cadastroForm.reset({
      nome: '',
      ano: new Date().getFullYear(),
      cpf: '',
      sexo: '',
      tipoMedalha: this.filtroForm.value.tipo,
      cargoProfissaoId: null,
      comarcaId: null,
      enviado: false,
      disponivelInternet: false,
      inMemorian: false,
      homonimo: false
    });
  }

  salvar(): void {
    if (this.cadastroForm.invalid) {
      this.cadastroForm.markAllAsTouched();
      return;
    }
    const payload = this.cadastroForm.value as AgraciadoPayload;
    const selecionado = this.selecionado();
    const request$ = selecionado
      ? this.service.atualizar(selecionado.codigo, payload)
      : this.service.criar(payload);

    request$.subscribe({
      next: () => {
        this.snackbar.open('Registro salvo com sucesso', 'Fechar', { duration: 4000 });
        this.novo();
        this.buscar();
      },
      error: err => {
        const mensagem = err?.error?.message ?? 'Falha ao salvar registro';
        this.snackbar.open(mensagem, 'Fechar', { duration: 6000 });
      }
    });
  }

  excluir(agraciado: Agraciado): void {
    if (!confirm(`Confirma a exclusão de ${agraciado.nome}?`)) {
      return;
    }
    this.service.excluir(agraciado.codigo).subscribe({
      next: () => {
        this.snackbar.open('Registro excluído', 'Fechar', { duration: 3000 });
        if (this.selecionado()?.codigo === agraciado.codigo) {
          this.novo();
        }
        this.buscar();
      },
      error: () => this.snackbar.open('Falha ao excluir registro', 'Fechar', { duration: 5000 })
    });
  }

  private carregarReferencia(): void {
    this.service.listarCargos().subscribe({
      next: cargos => this.cargos.set(cargos),
      error: () => this.snackbar.open('Erro ao carregar cargos/profissões', 'Fechar', { duration: 5000 })
    });
    this.service.listarComarcas().subscribe({
      next: comarcas => this.comarcas.set(comarcas),
      error: () => this.snackbar.open('Erro ao carregar comarcas', 'Fechar', { duration: 5000 })
    });
    this.service.listarSexos().subscribe({
      next: sexos => this.sexos.set(sexos),
      error: () => this.snackbar.open('Erro ao carregar sexos', 'Fechar', { duration: 5000 })
    });
  }
}
