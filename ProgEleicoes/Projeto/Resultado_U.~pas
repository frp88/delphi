unit Resultado_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBTables, StdCtrls, DBCtrls, Buttons;

type
  TfrmResultado = class(TForm)
    qrySelecionaCandidato: TQuery;
    dsSelecionaCandidato: TDataSource;
    dsContaVotos: TDataSource;
    qryContaVotos: TQuery;
    Panel1: TPanel;
    qrySelecionaEleicao: TQuery;
    dsqrySelecionaEleicao: TDataSource;
    ComboBoxEleicao: TDBLookupComboBox;
    LabelEscolhaEleicao: TLabel;
    ComboBoxCandidato: TDBLookupComboBox;
    LabelEscolhaCandidato: TLabel;
    qrySelecionaEleicaoCodElei: TIntegerField;
    qrySelecionaEleicaoNomeElei: TStringField;
    qryContaVotosquanti: TIntegerField;
    edtNomeComp: TEdit;
    edtNomeAbrev: TEdit;
    Bevel2: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtNunCand: TEdit;
    btnSair: TBitBtn;
    Bevel1: TBevel;
    LabelTotalVotos: TLabel;
    Panel2: TPanel;
    Label1: TLabel;
    qrySelecionaCandidatoNomeComp: TStringField;
    qrySelecionaCandidatoNomeAbrev: TStringField;
    qrySelecionaCandidatoNumCand: TIntegerField;
    qrySelecionaCandidatoCodElei: TIntegerField;
    procedure ComboBoxEleicaoCloseUp(Sender: TObject);
    procedure ComboBoxCandidatoCloseUp(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimpaEdits;
    procedure btnSairClick(Sender: TObject);
    procedure ComboBoxCandidatoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResultado: TfrmResultado;
  EleiEscolhida: string;
  aElei, oCand: integer;
implementation

{$R *.dfm}
procedure TfrmResultado.LimpaEdits;
begin
  edtNomeComp.Clear;
  edtNomeAbrev.Clear;
  edtNunCand.Clear;
  LabelTotalVotos.Caption:= '';
end;
procedure TfrmResultado.ComboBoxEleicaoCloseUp(Sender: TObject);
begin
  EleiEscolhida:= ComboBoxEleicao.Text;
  aElei:= qrySelecionaEleicaoCodElei.AsInteger;
  qrySelecionaCandidato.Active:= false;
  qrySelecionaCandidato.Params[0].AsInteger:= aElei;
  qrySelecionaCandidato.Active:= true;
  LimpaEdits;
end;

procedure TfrmResultado.ComboBoxCandidatoCloseUp(Sender: TObject);
begin
  aElei:= qrySelecionaEleicaoCodElei.AsInteger;
  oCand:= qrySelecionaCandidatoNumCand.AsInteger;
  qryContaVotos.Active:= false;
  qryContaVotos.Params[0].AsInteger:= aElei;
  qryContaVotos.Params[1].AsInteger:= oCand;
  qryContaVotos.Active:= true;
  edtNomeComp.Text:= qrySelecionaCandidatoNomeComp.AsString;
  edtNomeAbrev.Text:= qrySelecionaCandidatoNomeAbrev.AsString;
  edtNunCand.Text:= IntToStr(qrySelecionaCandidatoNumCand.AsInteger);
  LabelTotalVotos.Caption:= IntToStr(qryContaVotosquanti.AsInteger);
end;

procedure TfrmResultado.FormShow(Sender: TObject);
begin
  qrySelecionaEleicao.Active:= false;
  qrySelecionaEleicao.Active:= true;
  qrySelecionaCandidato.Active:= true;
  qryContaVotos.Active:= false;
  ComboBoxEleicao.SetFocus;
end;

procedure TfrmResultado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qrySelecionaEleicao.Active:= false;
  qrySelecionaCandidato.Active:= true;
  qryContaVotos.Active:= false;
  LimpaEdits;
end;

procedure TfrmResultado.btnSairClick(Sender: TObject);
begin
  qrySelecionaEleicao.Active:= false;
  qrySelecionaCandidato.Active:= true;
  qryContaVotos.Active:= false;
  LimpaEdits;
  close;
end;

procedure TfrmResultado.ComboBoxCandidatoClick(Sender: TObject);
begin
  btnSair.SetFocus;
end;

end.
