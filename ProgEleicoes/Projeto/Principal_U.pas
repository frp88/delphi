unit Principal_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, ComCtrls, ToolWin, DB, DBTables,
  ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Eleio1: TMenuItem;
    Candidato1: TMenuItem;
    IniciarEleio1: TMenuItem;
    Resultados1: TMenuItem;
    Sobre1: TMenuItem;
    Sair1: TMenuItem;
    dbEleicoes: TDatabase;
    Label1: TLabel;
    Ajuda1: TMenuItem;
    Timer1: TTimer;
    ImageUrna: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure Eleio1Click(Sender: TObject);
    procedure Candidato1Click(Sender: TObject);
    procedure IniciarEleio1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Resultados1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ajuda1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  aELeicao: integer;
implementation

uses CadastroCandidato_U, EscolhaEleicao_U, Resultado_U,
  Votacao_U, CadastroEleicao_U, Sobre_U, Ajuda_U;


{$R *.dfm}

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  if MessageDlg('Sair do Programa?',mtConfirmation,mbOKCancel,0) = mrOk then
  begin
    Application.Terminate;
    dbEleicoes.Connected:= false;
  end;
end;

procedure TfrmPrincipal.Eleio1Click(Sender: TObject);
begin
  frmCadastroEleicao.ShowModal;
end;

procedure TfrmPrincipal.Candidato1Click(Sender: TObject);
begin
  frmCadastroCandidato.ShowModal;
end;

procedure TfrmPrincipal.IniciarEleio1Click(Sender: TObject);
begin
  frmEscolhaEleicao.ShowModal;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
  {StatusBar.Panels.Items[0].Text:= ' ProgEleições - Programa de Eleições Universitárias';
  statusbar1.Panels.Items[1].Text:= formatdatetime(' dddd, dd "de" mmmm "de" yyy',now);
  statusbar1.Panels.Items[2].Text:= formatdatetime(' hh:nn:ss',now);
}
end;

procedure TfrmPrincipal.Resultados1Click(Sender: TObject);
begin
  frmResultado.ShowModal;
end;

procedure TfrmPrincipal.Sobre1Click(Sender: TObject);
begin
  frmSobre.ShowModal;
end;

procedure TfrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F1 then
    frmAjuda.ShowModal;
end;

procedure TfrmPrincipal.Ajuda1Click(Sender: TObject);
begin
  frmAjuda.ShowModal;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Label1.Caption:='    Eleições'#13'Universitárias';
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  dbEleicoes.Connected:= true;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Application.Terminate;  
  dbEleicoes.Connected:= false;
end;

end.
