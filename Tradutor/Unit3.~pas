unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmPortuguesIngles = class(TForm)
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    btnTraduzir: TButton;
    btnSair: TButton;
    Memo2: TMemo;
    procedure btnSairClick(Sender: TObject);
    procedure btnTraduzirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPortuguesIngles: TfrmPortuguesIngles;
  i, j, tam: integer;
  frase, trad, aux, p: string;
  fim, achei: boolean;


implementation

uses Unit1, Types;

{$R *.dfm}

procedure TfrmPortuguesIngles.btnSairClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmPortuguesIngles.btnTraduzirClick(Sender: TObject);
begin
  frase:= Memo1.Lines.Text;
  tam:= length(frase);
  aux:= '';
  trad:= '';
  p:= '';
  achei:= false;
  fim:= false;
  for i:= 1 to tam do
  begin
    if (i = tam) then
      fim:= true;
    if (frase[i] = ' ') then
      fim:= true
    else if ((frase[i] = '.') or (frase[i] = ',') or (frase[i] = ';')) then
      p:= p + frase[i]
    else
      aux:= aux + frase[i];
    if (fim = true) then
    begin
      fim:= false;
      achei:= false;
      j:= 1;
      while ((achei = false) and (j <= x)) do
      begin
        if (aux = por[j]) then
        begin
          trad:= trad + ing[j];
          achei:= true;
        end
        else
          inc(j);
      end;
      if (achei = false) then
        trad:= trad + aux;
      if (p = '') then
        trad:= trad + ' '
      else
        trad:= trad + p + ' ';
      p:= '';
      aux:= '';
    end;
  end;
  Memo2.Lines.Text:= trad;
end;

procedure TfrmPortuguesIngles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
end;

procedure TfrmPortuguesIngles.Memo1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
    btnTraduzir.Click;
end;

procedure TfrmPortuguesIngles.FormShow(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  Memo1.SetFocus;
end;

end.
