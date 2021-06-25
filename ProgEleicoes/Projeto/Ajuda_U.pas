unit Ajuda_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TfrmAjuda = class(TForm)
    MemoAjuda: TMemo;
    btnOk: TBitBtn;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAjuda: TfrmAjuda;

implementation

{$R *.dfm}

procedure TfrmAjuda.btnOkClick(Sender: TObject);
begin
  close;
end;

end.
