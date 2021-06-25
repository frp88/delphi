program Eleicao;

uses
  Forms,
  Principal_U in 'Principal_U.pas' {frmPrincipal},
  CadastroCandidato_U in 'CadastroCandidato_U.pas' {frmCadastroCandidato},
  Resultado_U in 'Resultado_U.pas' {frmResultado},
  EscolhaEleicao_U in 'EscolhaEleicao_U.pas' {frmEscolhaEleicao},
  Votacao_U in 'Votacao_U.pas' {frmVotacao},
  Trava_U in 'Trava_U.pas' {frmTrava},
  CadastroEleicao_U in 'CadastroEleicao_U.pas' {frmCadastroEleicao},
  Sobre_U in 'Sobre_U.pas' {frmSobre},
  Ajuda_U in 'Ajuda_U.pas' {frmAjuda};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastroCandidato, frmCadastroCandidato);
  Application.CreateForm(TfrmCadastroEleicao, frmCadastroEleicao);
  Application.CreateForm(TfrmResultado, frmResultado);
  Application.CreateForm(TfrmEscolhaEleicao, frmEscolhaEleicao);
  Application.CreateForm(TfrmVotacao, frmVotacao);
  Application.CreateForm(TfrmTrava, frmTrava);
  Application.CreateForm(TfrmSobre, frmSobre);
  Application.CreateForm(TfrmAjuda, frmAjuda);
  Application.Run;
end.
