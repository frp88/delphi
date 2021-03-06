Unit Votacao_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DB, DBTables, MMSystem;

type
  TfrmVotacao = class(TForm)
    PanelPrincipal: TPanel;
    PanelTeclado: TPanel;
    btn1: TBitBtn;
    btn2: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    btn5: TBitBtn;
    btn6: TBitBtn;
    btn7: TBitBtn;
    btn8: TBitBtn;
    btn9: TBitBtn;
    btn0: TBitBtn;
    PanelTitulo: TPanel;
    PanelCandidato: TPanel;
    btnCancelar: TBitBtn;
    btnConfirmar: TBitBtn;
    Label1: TLabel;
    edtVoto: TEdit;
    LabelEscola: TLabel;
    LabelEleicao: TLabel;
    Bevel1: TBevel;
    LabelDigiteVoto: TLabel;
    Bevel2: TBevel;
    qryCandidatos: TQuery;
    dsCandidatos: TDataSource;
    qryCandidatosNomeComp: TStringField;
    qryCandidatosNomeAbrev: TStringField;
    qryCandidatosNumCand: TIntegerField;
    qryCandidatosCodElei: TIntegerField;
    qryCandidatosNomeElei: TStringField;
    edtNomeComp: TEdit;
    edtNomeAbreviado: TEdit;
    qryEsolhaCandidato: TQuery;
    dsEsolhaCandidato: TDataSource;
    qryEsolhaCandidatoNomeComp: TStringField;
    qryEsolhaCandidatoNomeAbrev: TStringField;
    qryEsolhaCandidatoNumCand: TIntegerField;
    qryEsolhaCandidatoCodElei: TIntegerField;
    LabelResposta: TLabel;
    qryAchaCandidato: TQuery;
    dsqryAchaCandidato: TDataSource;
    qryAchaCandidatoquanti: TIntegerField;
    LabelNomeComp: TLabel;
    LabelNomeAbrev: TLabel;
    procedure edtVotoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edtNomeCompKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure NovoVoto;
    procedure edtNomeAbrevKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVotacao: TfrmVotacao;
  IdEleicao, Data: string;
  QuantCand: integer;
  PodeFechar: boolean;
implementation

uses EscolhaEleicao_U, Trava_U;

{$R *.dfm}

procedure TfrmVotacao.NovoVoto;
begin
  qryEsolhaCandidato.Active:= false;
  qryAchaCandidato.Active:= false;
  edtNomeComp.Visible:= false;
  edtNomeAbreviado.Visible:= false;
  LabelResposta.Visible:= false;
  LabelNomeComp.Visible:= false;
  LabelNomeAbrev.Visible:= false;
  edtVoto.Clear;
  edtVoto.SetFocus;
end;
procedure TfrmVotacao.edtVotoKeyPress(Sender: TObject; var Key: Char);
begin
data:= DateTimeToStr(now);
if not ((key in ['1','2','3','4','5','6','7','8','9','0'])
        or(key = #08)or(key = #13)or(key = #33)) then
  key := #0
else if key = #13 then
begin
  sndPlaySound('Sons\Exclama??o do Windows XP.wav',1);
  edtNomeComp.Visible:= true;
  edtNomeAbreviado.Visible:= true;
  LabelResposta.Caption:= 'Aperte "S" para Confirmar, "N" para Anular'#13#13'          e "ESC" para Cancelar o Voto ';
  QuantCand:= 0;
  qryEsolhaCandidato.Active:= false;
  qryEsolhaCandidato.Params[0].AsInteger:=  aEleicao;
    if edtVoto.Text = '' then
    qryEsolhaCandidato.Params[1].AsInteger:= 0
  else
    qryEsolhaCandidato.Params[1].AsInteger:=  StrToInt(edtVoto.Text);
  qryEsolhaCandidato.Active:= true;
  qryAchaCandidato.Active:= false;
  qryAchaCandidato.Params[0].AsInteger:=  aEleicao;
  if edtVoto.Text = '' then
    qryAchaCandidato.Params[1].AsInteger:= 0
  else
    qryAchaCandidato.Params[1].AsInteger:= StrToInt(edtVoto.Text);
  qryAchaCandidato.Active:= true;
  QuantCand:= qryAchaCandidatoquanti.AsInteger;
if (QuantCand <> 0) then
  begin
     edtNomeComp.Text:= qryEsolhaCandidatoNomeComp.AsString;
     edtNomeAbreviado.Text:= qryEsolhaCandidatoNomeAbrev.AsString;
  end
  else begin
     edtNomeComp.Text:= 'Candidato Inexistente!';
     edtNomeAbreviado.text:= ' Seu Voto Ser? Anulado!';
  end;
  LabelResposta.Visible:= true;
  LabelNomeComp.Visible:= true;
  LabelNomeAbrev.Visible:= true;
  edtNomeComp.SetFocus;
end
else if key = #33 then
  begin
    PodeFechar := true;
    Close;
  end;
end;

procedure TfrmVotacao.FormShow(Sender: TObject);
begin
  PodeFechar:= false;
  qryEsolhaCandidato.Active:= false;
  qryCandidatos.Active:= false;
  qryCandidatos.Active:= true;
  IdEleicao:= IntToStr(qryCandidatosCodElei.AsInteger);
  LabelResposta.Caption:= 'Aperte "S" para Confirmar, "N" para Anular'#13#13'          e "ESC" para Cancelar o Voto ';
  LabelResposta.Visible:= false;
  LabelNomeComp.Visible:= false;
  LabelNomeAbrev.Visible:= false;
  edtVoto.Clear;
  edtVoto.SetFocus;
end;

procedure TfrmVotacao.edtNomeCompKeyPress(Sender: TObject; var Key: Char);
begin
  if not ((key in ['n','N','s','S'])or(key = #27)) then
    key := #0
  else if (key in ['s','S']) and (QuantCand <> 0) then
  begin
    qryCandidatos.SQL.Clear;
    qryCandidatos.SQL.text:= 'insert into Voto (DataHora, Tipo, NumCand, CodElei)';
    qryCandidatos.sql.Add(' values (' + QuotedStr(data) +',1,'+QuotedStr(edtVoto.Text) + ','+IntToStr(aEleicao)+')');
    qryCandidatos.ExecSQL;
    sndPlaySound('Sons\Som de logoff do Windows XP.wav',1);
    frmTrava.LabelConfirmaVoto.Left:= 20;
    frmTrava.LabelConfirmaVoto.Caption:= 'Voto Confirmado!';
    frmTrava.ShowModal;
    sndPlaySound('Sons\Som de logon do Windows XP.wav',1);
    NovoVoto;
    key := #0;
  end
  else if ((key in ['n','N'])and (QuantCand <> 0)) then
  begin
    qryCandidatos.SQL.Clear;
    qryCandidatos.SQL.text:= 'insert into Voto (DataHora, Tipo, NumCand, CodElei)';
    qryCandidatos.sql.Add(' values (' + QuotedStr(data) +',0,'+QuotedStr(edtVoto.Text) + ','+IntToStr(aEleicao)+')');
    qryCandidatos.ExecSQL;
    sndPlaySound('Sons\Som de logoff do Windows XP.wav',1);
    ShowMessage('Voto n?o Confirmado!');
    sndPlaySound('Sons\Som de logon do Windows XP.wav',1);
    NovoVoto;
    key := #0;
  end
  else if ((key in ['s','S']) and (QuantCand = 0)) then
  begin
    qryCandidatos.SQL.Clear;
    qryCandidatos.SQL.text:= 'insert into Voto (DataHora, Tipo, NumCand, CodElei)';
    qryCandidatos.sql.Add(' values (' + QuotedStr(data) +',0,'+QuotedStr(edtVoto.Text) + ','+IntToStr(aEleicao)+')');
    qryCandidatos.ExecSQL;
    sndPlaySound('Sons\Som de logoff do Windows XP.wav',1);
    frmTrava.LabelConfirmaVoto.Left:= 45;
    frmTrava.LabelConfirmaVoto.Caption:= 'Voto Anulado!';
    frmTrava.ShowModal;
    sndPlaySound('Sons\Som de logon do Windows XP.wav',1);
    NovoVoto;
    key := #0;
  end
  else if ((key in ['n','N']) and (QuantCand = 0)) then
  begin
    qryCandidatos.SQL.Clear;
    qryCandidatos.SQL.text:= 'insert into Voto (DataHora, Tipo, NumCand, CodElei)';
    qryCandidatos.sql.Add(' values (' + QuotedStr(data) +',0,'+QuotedStr(edtVoto.Text) + ','+IntToStr(aEleicao)+')');
    qryCandidatos.ExecSQL;
    sndPlaySound('Sons\Som de logoff do Windows XP.wav',1);
    ShowMessage('Voto n?o Confirmado!');
    sndPlaySound('Sons\Som de logon do Windows XP.wav',1);
    NovoVoto;
    key := #0;
  end
  else if key = #27 then
  begin
    LabelResposta.Caption:= '';
    edtNomeComp.Clear;
    edtNomeAbreviado.Clear;
    LabelResposta.Visible:= false;
    LabelNomeComp.Visible:= false;
    LabelNomeAbrev.Visible:= false;
    edtVoto.SetFocus;
    NovoVoto;    
    key := #0;
  end;
end;
procedure TfrmVotacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryCandidatos.Active:= false;
  qryCandidatos.SQL.Clear;
  qryCandidatos.SQL.Text:= 'SELECT  Candidato.NomeComp, Candidato.NomeAbrev, Candidato.NumCand, Candidato.CodElei,';
  qryCandidatos.SQL.add(' Eleicao.NomeElei FROM Candidato INNER JOIN Eleicao ON Candidato.CodElei = Eleicao.CodElei');
  qryEsolhaCandidato.Active:= false;
  qryAchaCandidato.Active:= false;
  LabelResposta.Visible:= false;
  LabelNomeComp.Visible:= false;
  LabelNomeAbrev.Visible:= false;
  edtNomeComp.Visible:= false;
  edtNomeAbreviado.Visible:= false;
end;

procedure TfrmVotacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 CanClose := PodeFechar;
end;

procedure TfrmVotacao.edtNomeAbrevKeyPress(Sender: TObject; var Key: Char);
begin
  edtNomeComp.Action;
end;

end.
