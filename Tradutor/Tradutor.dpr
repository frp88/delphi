program Tradutor;

uses
  Forms,
  Unit1 in 'Unit1.pas' {frmPrincipal},
  Unit2 in 'Unit2.pas' {frmCadastraPalavras},
  Unit3 in 'Unit3.pas' {frmPortuguesIngles},
  Unit4 in 'Unit4.pas' {frmInglesPortugues};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadastraPalavras, frmCadastraPalavras);
  Application.CreateForm(TfrmPortuguesIngles, frmPortuguesIngles);
  Application.CreateForm(TfrmInglesPortugues, frmInglesPortugues);
  Application.Run;
end.
