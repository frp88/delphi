program ProgPonto;

uses
  Forms,
  Principal_U in 'Principal_U.pas' {Principal},
  BaterPonto_U in 'BaterPonto_U.pas' {BaterPonto},
  GerarRelatorio_U in 'GerarRelatorio_U.pas' {GerarRelatorio},
  AlterarSenha_U in 'AlterarSenha_U.pas' {AlterarSenha};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TPrincipal, Principal);
  Application.CreateForm(TBaterPonto, BaterPonto);
  Application.CreateForm(TGerarRelatorio, GerarRelatorio);
  Application.CreateForm(TAlterarSenha, AlterarSenha);
  Application.Run;
end.
