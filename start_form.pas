unit start_form;

{$mode objfpc}{$H+}
{$define ___start_form}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  engine, form_switcher;

type

  { TStartForm }

  TStartForm = class(TForm)
    Button1: TButton;
    ComboBox1: TComboBox;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  end;



implementation

{$R *.lfm}

{ TStartForm }

procedure TStartForm.Button1Click(Sender: TObject);
var i: integer;
begin
  _data.Clear;
  i := ComboBox1.ItemIndex;
  if i=0 then
  begin
    for i:=1 to ComboBox1.Items.Count-1 do
      LoadData(ComboBox1.Items[i]);
  end
  else
    LoadData(ComboBox1.Items[i]);
  RecalcInfo;
  FormSwitcher.SwitchTo(self, 'main');
end;

procedure TStartForm.Button2Click(Sender: TObject);
begin
  _dbreload := True;
  self.FormShow(Sender);
end;

procedure TStartForm.FormCreate(Sender: TObject);
begin
  engine.Init;
end;

procedure TStartForm.FormDestroy(Sender: TObject);
begin
  engine.Done;
end;

procedure TStartForm.FormShow(Sender: TObject);
var i: integer;
begin
  if _dbreload then
  begin
    ComboBox1.Clear;
    LoadFileList('*.dat');
    for i:=1 to _files.Count do
      ComboBox1.Items.Add(_files[i-1]);
    if _files.Count = 0 then
      ComboBox1.ItemIndex := -1
    else
    begin
      ComboBox1.Items.Insert(0, 'Все');
      ComboBox1.ItemIndex := 0;
    end;
    _dbreload := False;
  end;
end;

end.

