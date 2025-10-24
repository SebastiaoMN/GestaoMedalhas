package com.gmweb.app.service;

import com.gmweb.app.domain.Agraciado;
import com.gmweb.app.domain.CargoProfissao;
import com.gmweb.app.domain.Comarca;
import com.gmweb.app.domain.MedalType;
import com.gmweb.app.repository.AgraciadoRepository;
import com.gmweb.app.repository.CargoProfissaoRepository;
import com.gmweb.app.repository.ComarcaRepository;
import com.gmweb.app.service.support.CpfValidator;
import com.gmweb.app.web.dto.AgraciadoRequest;
import com.gmweb.app.web.dto.AgraciadoResponse;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class AgraciadoService {

    private static final long COMARCA_PADRAO_MEDALHA_COLAR = 24L;

    private final AgraciadoRepository agraciadoRepository;
    private final CargoProfissaoRepository cargoProfissaoRepository;
    private final ComarcaRepository comarcaRepository;

    public AgraciadoService(AgraciadoRepository agraciadoRepository,
                            CargoProfissaoRepository cargoProfissaoRepository,
                            ComarcaRepository comarcaRepository) {
        this.agraciadoRepository = agraciadoRepository;
        this.cargoProfissaoRepository = cargoProfissaoRepository;
        this.comarcaRepository = comarcaRepository;
    }

    @Transactional(readOnly = true)
    public List<AgraciadoResponse> listar(MedalType tipo, Integer ano, String nome) {
        return agraciadoRepository.findActiveByFilters(tipo, ano, nome)
                .stream()
                .map(this::toResponse)
                .toList();
    }

    @Transactional(readOnly = true)
    public AgraciadoResponse detalhar(Long codigo) {
        Agraciado agraciado = agraciadoRepository.findActiveByCodigo(codigo)
                .orElseThrow(() -> new EntityNotFoundException("Agraciado não encontrado"));
        return toResponse(agraciado);
    }

    @Transactional
    public AgraciadoResponse criar(AgraciadoRequest request) {
        Agraciado agraciado = new Agraciado();
        agraciado.setCodigo(agraciadoRepository.nextCodigo());
        agraciado.setTipoMedalha(request.tipoMedalha());
        aplicarDados(agraciado, request);
        agraciadoRepository.save(agraciado);
        return toResponse(agraciado);
    }

    @Transactional
    public AgraciadoResponse atualizar(Long codigo, AgraciadoRequest request) {
        Agraciado agraciado = agraciadoRepository.findActiveByCodigo(codigo)
                .orElseThrow(() -> new EntityNotFoundException("Agraciado não encontrado"));
        if (agraciado.getTipoMedalha() != request.tipoMedalha()) {
            throw new IllegalArgumentException("Não é permitido alterar o tipo da medalha");
        }
        aplicarDados(agraciado, request);
        return toResponse(agraciado);
    }

    @Transactional
    public void excluir(Long codigo, String usuarioAtual) {
        Agraciado agraciado = agraciadoRepository.findActiveByCodigo(codigo)
                .orElseThrow(() -> new EntityNotFoundException("Agraciado não encontrado"));
        agraciado.setUsuarioExclusao(usuarioAtual);
        agraciado.setDataExclusao(LocalDateTime.now());
    }

    private void aplicarDados(Agraciado agraciado, AgraciadoRequest request) {
        validarNegocios(agraciado.getCodigo(), request);

        CargoProfissao cargo = cargoProfissaoRepository.findById(request.cargoProfissaoId())
                .orElseThrow(() -> new EntityNotFoundException("Cargo/Profissão não encontrado"));
        agraciado.setCargoProfissao(cargo);

        if (request.tipoMedalha() == MedalType.HELIO_COSTA) {
            if (request.comarcaId() == null) {
                throw new IllegalArgumentException("A comarca deve ser informada para a medalha Des. Hélio Costa");
            }
            Comarca comarca = comarcaRepository.findById(request.comarcaId())
                    .orElseThrow(() -> new EntityNotFoundException("Comarca não encontrada"));
            agraciado.setComarca(comarca);
        } else {
            Long comarcaId = request.comarcaId() != null ? request.comarcaId() : COMARCA_PADRAO_MEDALHA_COLAR;
            Comarca comarca = comarcaRepository.findById(comarcaId)
                    .orElseThrow(() -> new EntityNotFoundException("Comarca padrão não encontrada"));
            agraciado.setComarca(comarca);
        }

        agraciado.setNome(request.nome().trim());
        agraciado.setAno(request.ano());
        agraciado.setSexo(StringUtils.hasText(request.sexo()) ? request.sexo().trim().toUpperCase() : null);
        agraciado.setEnviado(request.enviado());
        agraciado.setDisponivelInternet(request.disponivelInternet());
        agraciado.setInMemorian(request.inMemorian());
        agraciado.setHomonimo(request.homonimo());
        agraciado.setDataExclusao(null);
        agraciado.setUsuarioExclusao(null);

        if (StringUtils.hasText(request.cpf())) {
            String digits = request.cpf().replaceAll("\\D", "");
            agraciado.setCpf(digits);
        } else {
            agraciado.setCpf(null);
        }
    }

    private void validarNegocios(Long codigo, AgraciadoRequest request) {
        String nomeNormalizado = request.nome().trim();
        String cpfNormalizado = StringUtils.hasText(request.cpf()) ? request.cpf().replaceAll("\\D", "") : null;

        if (request.tipoMedalha() == MedalType.HELIO_COSTA) {
            if (request.comarcaId() == null) {
                throw new IllegalArgumentException("A comarca deve ser informada");
            }
            boolean existeMesmoAnoComarca;
            if (codigo == null) {
                existeMesmoAnoComarca = agraciadoRepository.existsByAnoAndComarcaCodigoAndTipoMedalhaAndDataExclusaoIsNull(
                        request.ano(), request.comarcaId(), request.tipoMedalha());
            } else {
                existeMesmoAnoComarca = agraciadoRepository.existsByAnoAndComarcaCodigoAndTipoMedalhaAndDataExclusaoIsNullAndCodigoNot(
                        request.ano(), request.comarcaId(), request.tipoMedalha(), codigo);
            }
            if (existeMesmoAnoComarca) {
                throw new IllegalArgumentException("Esta comarca já possui agraciado no ano informado");
            }
            if (!request.homonimo()) {
                boolean existeNome;
                if (codigo == null) {
                    existeNome = agraciadoRepository.existsByNomeIgnoreCaseAndTipoMedalhaAndDataExclusaoIsNull(nomeNormalizado, request.tipoMedalha());
                } else {
                    existeNome = agraciadoRepository.existsByNomeIgnoreCaseAndTipoMedalhaAndDataExclusaoIsNullAndCodigoNot(nomeNormalizado, request.tipoMedalha(), codigo);
                }
                if (existeNome) {
                    throw new IllegalArgumentException("Nome já cadastrado. Caso necessário marque como homônimo.");
                }
            }
        } else {
            boolean existeNome;
            if (codigo == null) {
                existeNome = agraciadoRepository.existsByNomeIgnoreCaseAndTipoMedalhaAndDataExclusaoIsNull(nomeNormalizado, request.tipoMedalha());
            } else {
                existeNome = agraciadoRepository.existsByNomeIgnoreCaseAndTipoMedalhaAndDataExclusaoIsNullAndCodigoNot(nomeNormalizado, request.tipoMedalha(), codigo);
            }
            if (existeNome) {
                throw new IllegalArgumentException("Nome já cadastrado.");
            }
        }

        if (StringUtils.hasText(cpfNormalizado)) {
            if (!CpfValidator.isValid(cpfNormalizado)) {
                throw new IllegalArgumentException("O CPF informado é inválido");
            }
            boolean existeCpf;
            if (codigo == null) {
                existeCpf = agraciadoRepository.existsByCpfAndTipoMedalhaAndDataExclusaoIsNull(cpfNormalizado, request.tipoMedalha());
            } else {
                existeCpf = agraciadoRepository.existsByCpfAndTipoMedalhaAndDataExclusaoIsNullAndCodigoNot(cpfNormalizado, request.tipoMedalha(), codigo);
            }
            if (existeCpf) {
                throw new IllegalArgumentException("CPF já cadastrado para este tipo de medalha");
            }
        }
    }

    private AgraciadoResponse toResponse(Agraciado agraciado) {
        return new AgraciadoResponse(
                agraciado.getCodigo(),
                agraciado.getNome(),
                agraciado.getAno(),
                agraciado.getCpf(),
                agraciado.getSexo(),
                agraciado.getTipoMedalha(),
                agraciado.getCargoProfissao() != null ? agraciado.getCargoProfissao().getCodigo() : null,
                agraciado.getCargoProfissao() != null ? agraciado.getCargoProfissao().getDescricao() : null,
                agraciado.getComarca() != null ? agraciado.getComarca().getCodigo() : null,
                agraciado.getComarca() != null ? agraciado.getComarca().getNome() : null,
                Boolean.TRUE.equals(agraciado.getEnviado()),
                Boolean.TRUE.equals(agraciado.getDisponivelInternet()),
                Boolean.TRUE.equals(agraciado.getInMemorian()),
                Boolean.TRUE.equals(agraciado.getHomonimo())
        );
    }
}
