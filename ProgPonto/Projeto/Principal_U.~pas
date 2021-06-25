unit Principal_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, Menus;

type
  TPrincipal = class(TForm)
    LabelData: TLabel;
    LabelHora: TLabel;
    Timer1: TTimer;
    Image1: TImage;
    BtnBaterPonto: TBitBtn;
    BtnGerarRelatorio: TBitBtn;
    Panel1: TPanel;
    BtnSair: TBitBtn;
    MainMenu1: TMainMenu;
    AlterarSenha1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BtnBaterPontoClick(Sender: TObject);
    procedure BtnGerarRelatorioClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure AlterarSenha1Click(Sender: TObject);
  private
    procedure GeraSenha(n: string; var s: string);
    { Private declarations }
  public
      { Public declarations }
  end;

  TPonto = record
    Data: Tdate;
    Hora: TTime;
  end;
  TFuncionarios = record
    Nome: string;
    CPF: string;
    Senha: string;
    Ponto: array[1..180] of TPonto;
  end;

var
  Principal: TPrincipal;
  Func: array[1..10] of TFuncionarios;
  x: integer;
implementation

uses BaterPonto_U, GerarRelatorio_U, AlterarSenha_U;

{$R *.dfm}
procedure TPrincipal.GeraSenha(n: string; var s: string);
{Procedure que gera senha a partir das iniciais do nome
  de cada funcionario}
var
  g: integer;
begin
  s:= n[1];
  for g:= 2 to length(n) do
  if n[g] = ' ' then
    s:= s+n[g+1];
end;

procedure TPrincipal.FormCreate(Sender: TObject);
var
  i: byte;
begin
  x:= 1;
  LabelHora.Caption:= FormatDateTime('hh:nn:ss',now);
  LabelData.Caption:= FormatDateTime('dd/mm/yyyy',now);

  Func[1].Nome:= 'FERNANDO ROBERTO PROENCA';
  GeraSenha(Func[1].Nome,Func[1].Senha);
  Func[1].CPF:= '111.111.111-11';
  Func[2].Nome:= 'MICHEL CESAR COSTA';
  GeraSenha(Func[2].Nome,Func[2].Senha);
  Func[2].CPF:= '222.222.222-22';
  Func[3].Nome:= 'VANIA BORGES';
  GeraSenha(Func[3].Nome,Func[3].Senha);
  Func[3].CPF:= '333.333.333-33';
  Func[4].Nome:= 'MIGUEL LIDIO';
  GeraSenha(Func[4].Nome,Func[4].Senha);
  Func[4].CPF:= '444.444.444-44';
  Func[5].Nome:= 'MARIA IOLANDA';
  GeraSenha(Func[5].Nome,Func[5].Senha);
  Func[5].CPF:= '555.555.555-55';
  Func[6].Nome:= 'DIMAS GUILHERME';
  GeraSenha(Func[6].Nome,Func[6].Senha);
  Func[6].CPF:= '666.666.666-66';
  Func[7].Nome:= 'MARCO TULIO';
  GeraSenha(Func[7].Nome,Func[7].Senha);
  Func[7].CPF:= '777.777.777-77';
  Func[8].Nome:= 'ERICA PATRICIA';
  GeraSenha(Func[8].Nome,Func[8].Senha);
  Func[8].CPF:= '888.888.888-88';
  Func[9].Nome:= 'FERNANDA FERREIRA';
  GeraSenha(Func[9].Nome,Func[9].Senha);
  Func[9].CPF:= '999.999.999-99';
  Func[10].Nome:= 'ROBERTO OBVIOSLO';
  GeraSenha(Func[10].Nome,Func[10].Senha);
  Func[10].CPF:= '000.000.000-00';

end;

procedure TPrincipal.Timer1Timer(Sender: TObject);
begin
  LabelHora.Caption:= FormatDateTime('hh:nn:ss',now);
  LabelData.Caption:= FormatDateTime('dd/mm/yyyy',now);
end;

procedure TPrincipal.BtnBaterPontoClick(Sender: TObject);
begin
  BaterPonto.ShowModal;
end;

procedure TPrincipal.BtnGerarRelatorioClick(Sender: TObject);
begin
  GerarRelatorio.ShowModal;
end;

procedure TPrincipal.BtnSairClick(Sender: TObject);
begin
 if MessageDlg('Sair do Programa?',mtConfirmation,mbOKCancel,0) = mrOk then
  Application.Terminate;
end;

procedure TPrincipal.AlterarSenha1Click(Sender: TObject);
begin
  AlterarSenha.ShowModal;
end;

end.
