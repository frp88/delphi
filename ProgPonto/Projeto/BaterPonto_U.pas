unit BaterPonto_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, MMSystem;

type
  TBaterPonto = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    EdtSenha: TEdit;
    EdtCPF: TMaskEdit;
    Panel1: TPanel;
    BtnOk: TBitBtn;
    BtnCancelar: TBitBtn;
    procedure BtnCancelarClick(Sender: TObject);
    procedure BtnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCPFKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BaterPonto: TBaterPonto;
  Cont,d: array[1..10] of integer;
  HoraEntrada, HoraSaida, HoraTotal: array[1..10] of TTime;
  DataUltima: array[1..10] of TDate;
  DataAtual: TDate;
  i, f: byte;
  Vale: boolean;
implementation

uses Principal_U;

{$R *.dfm}

procedure TBaterPonto.BtnCancelarClick(Sender: TObject);
begin
  EdtCPF.EditText:= '___.___.___-__';
  EdtSenha.Clear;
  Close;
end;

procedure TBaterPonto.BtnOkClick(Sender: TObject);
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
    EdtSenha.Clear;
    EdtCPF.SetFocus;
  end;
  if Vale = true then
  begin
    if (EdtCPF.EditText <> Func[f].CPF) or (EdtSenha.Text <> Func[f].Senha) then
    begin
      ShowMessage('Senha Inválida!');
      EdtSenha.Clear;
      EdtSenha.SetFocus;
    end
    else
    begin
      DataAtual:= now;
      if DateToStr(DataAtual) <> DateToStr(DataUltima[f]) then
      begin
        d[f]:= d[f]+1;
        Cont[f]:= 1;
      end
      else
        Cont[f]:= Cont[f]+1;
      if (Cont[f] mod 2) <> 0 then
      begin
        HoraEntrada[f]:= now;
        DataUltima[f]:= now;
      end;
      if ((Cont[f] mod 2) = 0) and (Cont[f] <> 4) then
      begin
        HoraSaida[f]:= now;
        HoraTotal[f]:= HoraSaida[f] - HoraEntrada[f];
        DataUltima[f]:= now;
      end;
      if (Cont[f] mod 2 = 0) and (Cont[f] = 4) then
      begin
        HoraSaida[f]:= now;
        Func[f].Ponto[d[f]].Data:= now;
        Func[f].Ponto[d[f]].Hora:= HoraTotal[f] + (HoraSaida[f] - HoraEntrada[f]);
      end;
      EdtCPF.EditText:= '___.___.___-__';
      EdtSenha.Clear;
      Close;
      sndPlaySound('C:\WINDOWS\Media\Erro do Windows XP',1);
    end;
  end;
end;

procedure TBaterPonto.FormCreate(Sender: TObject);
begin
  for i:= 1 to 10 do
    Cont[i]:= 0;
    d[i]:= 0;
end;

procedure TBaterPonto.EdtCPFKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    EdtSenha.SetFocus;
end;

procedure TBaterPonto.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    BtnOk.Click;
end;

procedure TBaterPonto.FormShow(Sender: TObject);
begin
  EdtCPF.EditText:= '___.___.___-__';
  EdtSenha.Clear;
  EdtCPF.SetFocus;
end;

procedure TBaterPonto.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_escape then
    Close;
end;

end.
