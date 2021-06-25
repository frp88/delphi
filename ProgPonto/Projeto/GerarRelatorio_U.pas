unit GerarRelatorio_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, DBCtrls, Grids, DBGrids, ExtCtrls,
  Mask;

type
  TGerarRelatorio = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label5: TLabel;
    Label6: TLabel;
    Bevel6: TBevel;
    DateTimePickerInicio: TDateTimePicker;
    DateTimePickerFim: TDateTimePicker;
    BtnGerar: TBitBtn;
    Label1: TLabel;
    Tabela: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    EdtDias: TEdit;
    EdtHorasTrab: TEdit;
    EdtHorasExtras: TEdit;
    ComboBoxCPF: TComboBox;
    Bevel3: TBevel;
    BtnSair: TBitBtn;
    EdtFuncionario: TEdit;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BtnGerarClick(Sender: TObject);
    procedure DateTimePickerFimChange(Sender: TObject);
    procedure ComboBoxCPFClick(Sender: TObject);
    procedure BtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GerarRelatorio: TGerarRelatorio;
  f: byte;
implementation

uses BaterPonto_U, Principal_U;

{$R *.dfm}


procedure TGerarRelatorio.FormShow(Sender: TObject);
begin
  Tabela.RowCount:= 2;
  Tabela.Cells[0,0]:= ' Data';
  Tabela.Cells[1,0]:= ' Hora';
  Tabela.Cells[2,0]:= ' Extra';
  Tabela.Cells[0,1]:= '';
  Tabela.Cells[1,1]:= '';
  Tabela.Cells[2,1]:= '';
  DateTimePickerInicio.Date:= now;
  DateTimePickerFim.Date:= now;
  ComboBoxCPF.SetFocus;
end;

procedure TGerarRelatorio.BtnGerarClick(Sender: TObject);
var
  Teste: boolean;
  a, b, d, i, dt, tr: byte;
  HoraTrab, HoraTot, HoraExtra, HoraTrabDia: TTime;
  DiaIni, DiaFim, DiaComp, MesIni, MesFim, MesComp, AnoIni, AnoFim, AnoComp: integer;
  aux: string;
begin
  Tabela.RowCount:= 2;
  Tabela.Cells[0,0]:= ' Data';
  Tabela.Cells[1,0]:= ' Hora';
  Tabela.Cells[2,0]:= ' Extra';
  Tabela.Cells[0,1]:= '';
  Tabela.Cells[1,1]:= '';
  Tabela.Cells[2,1]:= '';

  DiaIni:= (StrToInt(FormatDateTime('dd',DateTimePickerInicio.Date)));
  DiaFim:= (StrToInt(FormatDateTime('dd',DateTimePickerFim.Date)));
  MesIni:= (StrToInt(FormatDateTime('mm',DateTimePickerInicio.Date)));
  MesFim:= (StrToInt(FormatDateTime('mm',DateTimePickerFim.Date)));
  AnoIni:= (StrToInt(FormatDateTime('yyyy',DateTimePickerInicio.Date)));
  AnoFim:= (StrToInt(FormatDateTime('yyyy',DateTimePickerFim.Date)));

  teste:= false;
  b:= 0;
  dt:= 0; //Total de dias trabalhados
  HoraTrab:= 0; {Total real de horas trabalhadas
    considerando as horas extras}
  HoraTot:= 0; {Horas normais de trabalho sem levar em
    consideração as horas extras}
  HoraTrabDia:= StrToTime('00:00:20'); {Quantidade de Horas
    que o funionario deve trabalhar em um dia.}

  if (ComboBoxCPF.ItemIndex >= 0) and (ComboBoxCPF.ItemIndex <= 9) then
  begin
    for d:= 1 to 180 do
    begin
      DiaComp:= (StrToInt(FormatDateTime('dd',Func[f].Ponto[d].Data)));
      MesComp:= (StrToInt(FormatDateTime('mm',Func[f].Ponto[d].Data)));
      AnoComp:= (StrToInt(FormatDateTime('yyyy',Func[f].Ponto[d].Data)));

      if (AnoComp >= AnoIni) and (AnoComp <= AnoFim) then
      begin
        if (MesComp >= MesIni) and (MesComp <= MesFim) then
        begin
          if (DiaComp >= diaIni) and (DiaComp <= DiaFim) then
          begin
            dt:= dt+1;
            HoraTrab:= HoraTrab+Func[f].Ponto[d].Hora; {Quantidade total de
            horas trabalhadas considerando as horas extras}
            HoraTot:= HoraTot+HoraTrabDia; {Soma das horas normais de trabalho
            sem levar em consideração as horas extras}
            b:= b+1;
            Tabela.RowCount:= b+1;
            a:= 0;
            Tabela.Cells[a,b]:= DateToStr(Func[f].Ponto[d].Data);
            a:= a+1;
            Tabela.Cells[a,b]:= TimeToStr(Func[f].Ponto[d].Hora);
            a:= a+1;
            if Func[f].Ponto[d].Hora <= HoraTrabDia then
              Tabela.Cells[a,b]:= '00:00:00'
            else
              Tabela.Cells[a,b]:= TimeToStr(Func[f].Ponto[d].Hora-HoraTrabDia);
          end;
        end;
      end;
    end;
    EdtDias.Text:= ' '+IntToStr(dt);
    EdtHorasTrab.Text:= ' '+TimeToStr(HoraTrab);
    EdtFuncionario.Text:= ' '+Func[f].Nome;
    if Horatrab <= HoraTot then
      EdtHorasExtras.Text:= ' 00:00:00'
    else
      EdtHorasExtras.Text:= ' '+TimeToStr(HoraTrab-HoraTot);
  end;
end;
procedure TGerarRelatorio.DateTimePickerFimChange(Sender: TObject);
begin
  BtnGerar.Click;
end;

procedure TGerarRelatorio.ComboBoxCPFClick(Sender: TObject);
begin
  f:= ComboBoxCPF.ItemIndex+1
end;

procedure TGerarRelatorio.BtnSairClick(Sender: TObject);
begin
  EdtDias.Clear;
  EdtHorasTrab.Clear;
  EdtHorasExtras.Clear;
  EdtFuncionario.Clear;
  ComboBoxCPF.ItemIndex:= -1;

  Close;
end;

procedure TGerarRelatorio.FormCreate(Sender: TObject);
var
  i: byte;
begin
 for i:= 1 to 10 do
  begin
  ComboBoxCPF.Items.Append(Func[i].CPF);
  end;
end;

end.


