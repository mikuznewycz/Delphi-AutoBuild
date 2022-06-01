unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  Vcl.Menus, Vcl.StdCtrls, System.Actions, Vcl.ActnList;

type
  TForm2 = class(TForm)
    ActionList1: TActionList;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses
  Unit1;

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin
  // DisableAero := True;
end;

end.
