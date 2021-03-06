unit AlterarSenha_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask;

type
  TAlterarSenha = class(TForm)
    Label1: TLabel;
    EdtCPF: TMaskEdit;
    Panel1: TPanel;
    Label2: TLabel;
    EdtAntiga: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtNova: TEdit;
    EdtRepete: TEdit;
    BtnConfirmar: TButton;
    BtnCancelar: TButton;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnConfirmarClick(Sender: TObject);
    procedure EdtCPFKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAntigaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtNovaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtRepeteKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AlterarSenha: TAlterarSenha;

implementation

uses Principal_U;

{$R *.dfm}

procedure TAlterarSenha.BtnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TAlterarSenha.BtnConfirmarClick(Sender: TObject);
var
  i, f: byte;
  Vale: boolean;
begin
  Vale:= false;
  for i:= 1 to 10 do
  begin
    if EdtCPF.EditText = Func[i].CPF then
    begin
      Vale:= true;
      f:= i;
    end;
  end;
  if Vale = false then
  begin
    ShowMessage('Funcionário Inexistente!');
    EdtAntiga.Clear;
    EdtNova.Clear;
    EdtRepete.Clear;
    EdtCPF.SetFocus;
  end;
  if Vale = true then
  begin
    if (EdtCPF.EditText = Func[f].CPF) and (EdtAntiga.Text = Func[f].Senha) and
       (EdtNova.Text = EdtRepete.Text) then
    begin
      Func[f].Senha:= EdtNova.Text;
      ShowMessage('Ok! Senha Alterada!');
      Close;
    end
    else
    begin
      ShowMessage('Senha(s) Inválida(s)!');
      EdtAntiga.SetFocus;
    end;
  end;
end;

procedure TAlterarSenha.EdtCPFKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EdtAntiga.SetFocus;
end;

procedure TAlterarSenha.EdtAntigaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EdtNova.SetFocus;
end;

procedure TAlterarSenha.EdtNovaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EdtRepete.SetFocus;
end;

procedure TAlterarSenha.EdtRepeteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    BtnConfirmar.Click;
end;

procedure TAlterarSenha.FormShow(Sender: TObject);
begin
  EdtCPF.SetFocus;
end;

procedure TAlterarSenha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_escape then
    Close;
end;

end.
