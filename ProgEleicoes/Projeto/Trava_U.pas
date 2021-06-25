unit Trava_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TfrmTrava = class(TForm)
    TimerTravaVoto: TTimer;
    LabelConfirmaVoto: TLabel;
    LabelAguarde: TLabel;
    procedure TimerTravaVotoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrava: TfrmTrava;
  PodeFechar: boolean;
  Tempo: integer;
implementation

{$R *.dfm}

procedure TfrmTrava.TimerTravaVotoTimer(Sender: TObject);
begin
  tempo:= tempo-1;
  LabelAguarde.Caption:= 'Aguarde '+IntToStr(Tempo)+' segundo(s) para votar novamente!';
  if Tempo = 0 then
  begin
    PodeFechar := true;
    Close;
  end;
end;

procedure TfrmTrava.FormShow(Sender: TObject);
begin
  Tempo:= 20;
  LabelAguarde.Caption:= 'Aguarde '+IntToStr(tempo)+' segundos para votar novamente!';
  PodeFechar:= false;
end;

procedure TfrmTrava.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose := PodeFechar;
end;

end.
