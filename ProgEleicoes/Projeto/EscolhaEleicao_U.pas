unit EscolhaEleicao_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, DB, DBTables, Buttons;

type
  TfrmEscolhaEleicao = class(TForm)
    Panel2: TPanel;
    Label2: TLabel;
    Panel1: TPanel;
    qryEscolhaEleicao: TQuery;
    dsEscolhaEleicao: TDataSource;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    Label3: TLabel;
    qryEscolhaEleicaoCodElei: TIntegerField;
    qryEscolhaEleicaoNomeElei: TStringField;
    ComboBoxEscolhaEleicao: TDBLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure ComboBoxEscolhaEleicaoCloseUp(Sender: TObject);
    procedure ComboBoxEscolhaEleicaoClick(Sender: TObject);
    procedure ComboBoxEscolhaEleicaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEscolhaEleicao: TfrmEscolhaEleicao;
  EleicaoEscolhida: string;
  aEleicao: integer;
implementation

uses Votacao_U;

{$R *.dfm}

procedure TfrmEscolhaEleicao.Button1Click(Sender: TObject);
begin
  frmVotacao:= TfrmVotacao.Create(self);
  frmVotacao.Show;
end;

procedure TfrmEscolhaEleicao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  close;
end;

procedure TfrmEscolhaEleicao.FormShow(Sender: TObject);
begin
  qryEscolhaEleicao.Active:= false;
  qryEscolhaEleicao.Active:= true;
  ComboBoxEscolhaEleicao.SetFocus;
end;

procedure TfrmEscolhaEleicao.btnOkClick(Sender: TObject);
begin
  frmVotacao.LabelEleicao.Caption:= 'Eleição: '+EleicaoEscolhida;
  frmVotacao.ShowModal;
  frmEscolhaEleicao.Close;
end;

procedure TfrmEscolhaEleicao.btnCancelarClick(Sender: TObject);
begin
  qryEscolhaEleicao.Active:= false;
  Close;  
end;

procedure TfrmEscolhaEleicao.ComboBoxEscolhaEleicaoCloseUp(
  Sender: TObject);
begin
  EleicaoEscolhida:= ComboBoxEscolhaEleicao.Text;
  aEleicao:= qryEscolhaEleicaoCodElei.AsInteger;
  btnOk.SetFocus;
end;

procedure TfrmEscolhaEleicao.ComboBoxEscolhaEleicaoClick(Sender: TObject);
begin
  btnOk.SetFocus;
end;

procedure TfrmEscolhaEleicao.ComboBoxEscolhaEleicaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then
      btnOk.click;
end;

end.
