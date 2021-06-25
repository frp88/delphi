unit CadastroCandidato_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, DBTables, DBCtrls, Mask,
  ImgList, ExtDlgs, jpeg;

type
  TfrmCadastroCandidato = class(TForm)
    dsCadCandidato: TDataSource;
    qryCadCandidato: TQuery;
    dsSelectEleicao: TDataSource;
    qrySelectEleicao: TQuery;
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
    Label8: TLabel;
    Label9: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    btnSair: TBitBtn;
    edtNomeAbreviado: TEdit;
    edtNomeCompleto: TEdit;
    edtNumero: TEdit;
    ComboBoxEleicao: TDBLookupComboBox;
    ComboBoxVeEleicao: TComboBox;
    qryConfereCandidato: TQuery;
    dsConfereCandidato: TDataSource;
    qryConfereCandidatoquanti: TIntegerField;
    Panel4: TPanel;
    Label1: TLabel;
    qryCadCandidatoNomeComp: TStringField;
    qryCadCandidatoNomeAbrev: TStringField;
    qryCadCandidatoNumCand: TIntegerField;
    qryCadCandidatoCodElei: TIntegerField;
    qryCadCandidatoNomeElei: TStringField;
    qrySelectEleicaoCodElei: TIntegerField;
    qrySelectEleicaoNomeElei: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure ComboBoxEleicaoCloseUp(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure Atualiza;
    procedure AtivaBotoes;
    procedure DesativaBotoes;
    procedure Seleciona;
    procedure edtNomeCompletoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNomeAbreviadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtNumeroKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBoxEleicaoClick(Sender: TObject);
    procedure ComboBoxEleicaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroCandidato: TfrmCadastroCandidato;
  Num, idEleicao, idNumCand, QuantCand: integer;

implementation

{$R *.dfm}


procedure TfrmCadastroCandidato.AtivaBotoes;
begin
  btnNovo.Enabled:= true;
  btnPrimeiro.Enabled:= true;
  btnAnterior.Enabled:= true;
  btnProximo.Enabled:= true;
  btnUltimo.Enabled:= true;
  btnCancelar.Enabled:= false;
  btnSalvar.Enabled:= false;
  btnSair.Enabled:= true;
  ComboBoxEleicao.Visible:= false;
  ComboBoxVeEleicao.Visible:= true;
end;

procedure TfrmCadastroCandidato.DesativaBotoes;
begin
  btnNovo.Enabled:= false;
  btnPrimeiro.Enabled:= false;
  btnAnterior.Enabled:= false;
  btnProximo.Enabled:= false;
  btnUltimo.Enabled:= false;
  btnCancelar.Enabled:= true;
  btnSalvar.Enabled:= true;
  btnSair.Enabled:= false;
  ComboBoxEleicao.Visible:= true;
  ComboBoxVeEleicao.Visible:= false;
end;

procedure TfrmCadastroCandidato.Atualiza;
begin
  qryCadCandidato.Active := false;
  qryCadCandidato.SQL.clear;
  qryCadCandidato.SQL.text:= 'SELECT Candidato.NomeComp, Candidato.NomeAbrev, Candidato.NumCand, Candidato.CodElei, ';
  qryCadCandidato.sql.add(' Eleicao.NomeElei FROM Candidato INNER JOIN Eleicao ON Candidato.CodElei = Eleicao.CodElei');
  qryCadCandidato.sql.add(' ORDER BY Candidato.CodElei, Candidato.NomeAbrev');
  qryCadCandidato.Active:= true;
end;

procedure TfrmCadastroCandidato.Seleciona;
begin
  edtNomeCompleto.Text:= qryCadCandidatoNomeComp.AsString;
  edtNomeAbreviado.Text:= qryCadCandidatoNomeAbrev.AsString;
  edtNumero.Text:= IntToStr(qryCadCandidatoNumCand.AsInteger);
  ComboBoxVeEleicao.Text:= qryCadCandidatoNomeElei.AsString;
  idEleicao:= qryCadCandidatoCodElei.AsInteger;
  idNumCand:= qryCadCandidatoNumCand.AsInteger;
end;

procedure TfrmCadastroCandidato.FormShow(Sender: TObject);
begin
  qryCadCandidato.Active:= False;
  qryCadCandidato.Active:= true;
  AtivaBotoes;
  Seleciona;
end;

procedure TfrmCadastroCandidato.btnSairClick(Sender: TObject);
begin
  qryCadCandidato.Active:= false;
  qrySelectEleicao.Active:= false;
  Close;
end;

procedure TfrmCadastroCandidato.ComboBoxEleicaoCloseUp(Sender: TObject);
begin
  idEleicao:= qrySelectEleicaoCodElei.AsInteger;
end;

procedure TfrmCadastroCandidato.btnNovoClick(Sender: TObject);
begin
  DesativaBotoes;
  qryCadCandidato.Active:= false;
  qrySelectEleicao.Active:= False;
  qrySelectEleicao.Active:= true;
  qryCadCandidato.SQL.Clear;
  edtNomeCompleto.Clear;
  edtNomeAbreviado.Clear;
  edtNumero.Clear;
  edtNomeCompleto.SetFocus;
end;

procedure TfrmCadastroCandidato.btnSalvarClick(Sender: TObject);
begin
  QuantCand:= 0;
  if edtNumero.Text = '' then
  begin
    ShowMessage('Digite um número para o candidato');
    edtNumero.SetFocus;
  end
  else begin
    qryConfereCandidato.Params[1].AsInteger:= StrToInt(edtNumero.Text);
    qryConfereCandidato.Params[0].AsInteger:= idEleicao;
    qryConfereCandidato.Active:= true;
    QuantCand:= qryConfereCandidatoquanti.AsInteger;
    if (QuantCand <> 0) then
    begin
      ShowMessage('Existe um candidato com esse número!'#13'          Digite outro número.');
      QuantCand:= 0;
      edtNumero.SetFocus;
    end
    else if (edtNomeCompleto.Text <> '') and (edtNomeAbreviado.Text <> '')
       and (edtNumero.Text <> '') and (IntToStr(idEleicao) <> '') then
       begin
         qryCadCandidato.SQL.Clear;
         qryCadCandidato.SQL.text:= 'insert into Candidato (NomeComp, NomeAbrev, NumCand, CodElei)';
         qryCadCandidato.sql.Add(' values (' + quotedstr(edtNomeCompleto.Text) +',' + quotedstr(edtNomeAbreviado.Text) + ','+edtNumero.Text+ ','+IntToStr(idEleicao)+')');
         qryCadCandidato.ExecSQL;
         ShowMessage('Candidato Cadastrado com Sucesso!');
         AtivaBotoes;
         Atualiza;
       end
    else Begin
      ShowMessage('Preencha todos os campos!');
      edtNomeCompleto.SetFocus;
      end;
    end;
    qryConfereCandidato.Active:= false;
end;

procedure TfrmCadastroCandidato.Button1Click(Sender: TObject);
begin
 Seleciona;
end;

procedure TfrmCadastroCandidato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  btnSair.Click;
end;

procedure TfrmCadastroCandidato.btnCancelarClick(Sender: TObject);
begin
  Atualiza;
  AtivaBotoes;
  btnPrimeiro.Click;
end;

procedure TfrmCadastroCandidato.btnUltimoClick(Sender: TObject);
begin
  qryCadCandidato.Last;
  Seleciona;
end;

procedure TfrmCadastroCandidato.btnProximoClick(Sender: TObject);
begin
  qryCadCandidato.Next;
  Seleciona;
end;

procedure TfrmCadastroCandidato.btnAnteriorClick(Sender: TObject);
begin
  qryCadCandidato.Prior;
  Seleciona;
end;

procedure TfrmCadastroCandidato.btnPrimeiroClick(Sender: TObject);
begin
  qryCadCandidato.First;
  Seleciona;
end;

procedure TfrmCadastroCandidato.edtNomeCompletoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    edtNomeAbreviado.SetFocus;
end;

procedure TfrmCadastroCandidato.edtNomeAbreviadoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    edtNumero.SetFocus;
end;

procedure TfrmCadastroCandidato.edtNumeroKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    ComboBoxEleicao.SetFocus;
end;

procedure TfrmCadastroCandidato.ComboBoxEleicaoClick(Sender: TObject);
begin
  btnSalvar.SetFocus;
end;

procedure TfrmCadastroCandidato.ComboBoxEleicaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
    btnSalvar.Click;
end;

end.
