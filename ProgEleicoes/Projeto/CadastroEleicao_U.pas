unit CadastroEleicao_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables;

type
  TfrmCadastroEleicao = class(TForm)
    Panel4: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    btnNovo: TBitBtn;
    btnPrimeiro: TBitBtn;
    btnAnterior: TBitBtn;
    btnProximo: TBitBtn;
    btnUltimo: TBitBtn;
    btnCancelar: TBitBtn;
    btnSalvar: TBitBtn;
    Panel1: TPanel;
    Bevel4: TBevel;
    Label4: TLabel;
    Label2: TLabel;
    btnSair: TBitBtn;
    EdtNomeEleicao: TEdit;
    qryCadEleicao: TQuery;
    dsCadEleicao: TDataSource;
    qryCadEleicaoCodElei: TIntegerField;
    qryCadEleicaoNomeElei: TStringField;
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure Atualiza;
    procedure AtivaBotoes;
    procedure DesativaBotoes;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure EdtNomeEleicaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEleicao: TfrmCadastroEleicao;

implementation

{$R *.dfm}

procedure TfrmCadastroEleicao.AtivaBotoes;
begin
  btnNovo.Enabled:= true;
  btnPrimeiro.Enabled:= true;
  btnAnterior.Enabled:= true;
  btnProximo.Enabled:= true;
  btnUltimo.Enabled:= true;
  btnCancelar.Enabled:= false;
  btnSalvar.Enabled:= false;
  btnSair.Enabled:= true;
end;

procedure TfrmCadastroEleicao.DesativaBotoes;
begin
  btnNovo.Enabled:= false;
  btnPrimeiro.Enabled:= false;
  btnAnterior.Enabled:= false;
  btnProximo.Enabled:= false;
  btnUltimo.Enabled:= false;
  btnCancelar.Enabled:= true;
  btnSalvar.Enabled:= true;
  btnSair.Enabled:= false;
end;

procedure TfrmCadastroEleicao.Atualiza;
begin
  qryCadEleicao.Active := false;
  qryCadEleicao.SQL.clear;
  qryCadEleicao.SQL.text := 'select * from Eleicao';
  qryCadEleicao.Active := true;
  qryCadEleicao.First;
  EdtNomeEleicao.Text:= qryCadEleicaoNomeElei.AsString;
end;

procedure TfrmCadastroEleicao.btnPrimeiroClick(Sender: TObject);
begin
  qryCadEleicao.First;
  EdtNomeEleicao.Text:= qryCadEleicaoNomeElei.AsString;
end;

procedure TfrmCadastroEleicao.btnAnteriorClick(Sender: TObject);
begin
  qryCadEleicao.Prior;
  EdtNomeEleicao.Text:= qryCadEleicaoNomeElei.AsString;
end;

procedure TfrmCadastroEleicao.btnProximoClick(Sender: TObject);
begin
  qryCadEleicao.Next;
  EdtNomeEleicao.Text:= qryCadEleicaoNomeElei.AsString;
end;

procedure TfrmCadastroEleicao.btnUltimoClick(Sender: TObject);
begin
  qryCadEleicao.Last;
  EdtNomeEleicao.Text:= qryCadEleicaoNomeElei.AsString;
end;

procedure TfrmCadastroEleicao.FormShow(Sender: TObject);
begin
  AtivaBotoes;
  qryCadEleicao.Active:= False;
  qryCadEleicao.Active:= true;
  btnPrimeiro.Click;
end;

procedure TfrmCadastroEleicao.btnNovoClick(Sender: TObject);
begin
  DesativaBotoes;
  qryCadEleicao.Active:= false;
  qryCadEleicao.SQL.Clear;
  EdtNomeEleicao.Clear;
  EdtNomeEleicao.SetFocus;
end;

procedure TfrmCadastroEleicao.btnSalvarClick(Sender: TObject);
begin
  if EdtNomeEleicao.Text <> '' then
  begin
    qryCadEleicao.SQL.Clear;
    qryCadEleicao.SQL.text := 'insert into Eleicao (NomeElei)';
    qryCadEleicao.sql.add(' values (' + quotedstr(EdtNomeEleicao.Text) + ')');
    qryCadEleicao.ExecSQL;
    ShowMessage('Elei??o Cadastrada com Sucesso!');
    AtivaBotoes;
    Atualiza;
  end
  else begin
    ShowMessage('Digite o nome da Elei??o!');
    EdtNomeEleicao.SetFocus;
  end;
end;

procedure TfrmCadastroEleicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryCadEleicao.Active:= false;
end;

procedure TfrmCadastroEleicao.btnSairClick(Sender: TObject);
begin
  qryCadEleicao.Active:= false;
  Close;
end;

procedure TfrmCadastroEleicao.btnCancelarClick(Sender: TObject);
begin
  Atualiza;
  AtivaBotoes;
end;

procedure TfrmCadastroEleicao.EdtNomeEleicaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    btnSalvar.Click;
end;

end.
