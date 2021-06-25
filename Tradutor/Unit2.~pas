unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmCadastraPalavras = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    btnCadastrar: TButton;
    btnCancelar: TButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastraPalavras: TfrmCadastraPalavras;

implementation

uses Unit1;

{$R *.dfm}

procedure TfrmCadastraPalavras.btnCadastrarClick(Sender: TObject);
var
  mais: integer;
begin
  if (x < t) then
    begin
      Inc(x);
      Por[x]:= Edit1.Text;
      Ing[x]:= Edit2.Text;
      mais:= MessageDlg('Palavra Cadastrada! Cadastrar mais palavras?',mtConfirmation,mbOKCancel,0);
      if (mais = mrOk) then
        begin
          Edit1.Clear;
          Edit2.Clear;
          Edit1.SetFocus;
        end
      else
        begin
          Close;
        end;
    end
  else
    begin
      ShowMessage('Não é possivel cadastrar mais palavras. Array Cheio!!!');
      Close;
    end;
end;

procedure TfrmCadastraPalavras.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastraPalavras.FormShow(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit1.SetFocus;
end;

procedure TfrmCadastraPalavras.Edit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    Edit2.SetFocus;
end;

procedure TfrmCadastraPalavras.Edit2KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
    btnCadastrar.Click;
end;

end.
