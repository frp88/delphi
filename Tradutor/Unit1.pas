unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, jpeg, ExtCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    CadastrarPalavras1: TMenuItem;
    raduzir1: TMenuItem;
    CadastrarPalavras2: TMenuItem;
    DePortugusparaIngls1: TMenuItem;
    DeInglsparaPortugus1: TMenuItem;
    Sair1: TMenuItem;
    Image1: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CadastrarPalavras2Click(Sender: TObject);
    procedure DePortugusparaIngls1Click(Sender: TObject);
    procedure DeInglsparaPortugus1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
    const t = 10;
  var
    frmPrincipal: TfrmPrincipal;
    Por: array[1..t] of string;
    Ing: array[1..t] of string;
    x: integer;

implementation

uses Unit2, Unit3, Unit4;

{$R *.dfm}

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
if MessageDlg('Sair do Tradutor',mtConfirmation,mbOKCancel,0) = mrOk then
  Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  x:= 0;
end;

procedure TfrmPrincipal.CadastrarPalavras2Click(Sender: TObject);
begin
  frmCadastraPalavras.ShowModal;
end;

procedure TfrmPrincipal.DePortugusparaIngls1Click(Sender: TObject);
begin
  frmPortuguesIngles.ShowModal;
end;

procedure TfrmPrincipal.DeInglsparaPortugus1Click(Sender: TObject);
begin
  frmInglesPortugues.ShowModal;
end;

end.
