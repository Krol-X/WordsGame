unit form_switcher;

interface

uses
  Classes, SysUtils, Forms;

type TFormRec = record
  form: TForm;
  id: string;
end;

type TFormSwitcher = class
  public
    constructor Create;
    procedure Clear;
    procedure AddForm(form: TForm; id: string);
    procedure SwitchTo(cur: TForm; id: string);
    destructor Destroy;
  private
    obj: array of TFormRec;
end;

var
  FormSwitcher: TFormSwitcher;


implementation

constructor TFormSwitcher.Create;
begin
  SetLength(obj, 0);
end;

procedure TFormSwitcher.Clear;
begin
  SetLength(obj, 0);
end;

procedure TFormSwitcher.AddForm(form: TForm; id: string);
var len: integer; t: TFormRec;
begin
  len := Length(obj);
  SetLength(obj, len+1);
  t.form := form;
  t.id := id;
  obj[len] := t;
end;

// TODO: Find(id: string): integer;

procedure TFormSwitcher.SwitchTo(cur: TForm; id: string);
var i: integer;
begin
  for i:=0 to Length(obj)-1 do
    if obj[i].id = id then
      begin
        cur.Hide;
        obj[i].form.Show;
        exit;
      end;
end;

destructor TFormSwitcher.Destroy;
begin
  SetLength(obj, 0);
end;

end.

