unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmInglesPortugues = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    btnTraduzir: TButton;
    btnSair: TButton;
    Memo2: TMemo;
    procedure btnTraduzirClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure Memo1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInglesPortugues: TfrmInglesPortugues;
  i, j, tam: integer;
  frase, trad, aux, p: string;
  fim, achei: boolean;

implementation

uses Unit1;

{$R *.dfm}

procedure TfrmInglesPortugues.btnTraduzirClick(Sender: TObject);
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
        if (aux = ing[j]) then
        begin
          trad:= trad + por[j];
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

procedure TfrmInglesPortugues.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmInglesPortugues.Memo1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
    btnTraduzir.Click;
end;

procedure TfrmInglesPortugues.FormShow(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo2.Lines.Clear;
  Memo1.SetFocus;
end;

end.
