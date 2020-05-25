unit engine;

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls;

type
  TCharSrchInfo = record
    start, count: integer;
  end;

var
  _files: TStringList; // ������ �������� ������-��������
  _data: TStringList;  // �������
  _game: TStringList;  // ������� ����
  _gameS: TStringList; // ������������� ������ ��� ������
  _show: boolean;      // ���������� �� �� �������?
  _chInfo: array [ord('�')..ord('�')] of TCharSrchInfo;
  _dbreload: boolean;  // ����������� ������ ������-��������?

function isWord(s: string): boolean;
function LastLetter(s: string): char;

procedure Init;
procedure Done;
procedure LoadFileList(mask: string);
procedure LoadData(name: string);
procedure RecalcInfo;

implementation

function isWord(s: string): boolean;
var i: integer;
begin
  Result := true;
  for i:=1 to Length(s) do
    if (s[i]<'�') or ('�'<s[i]) then
      begin
        Result := false;
        exit;
      end;
end;

function LastLetter(s: string): char;
var i: integer;
begin
  i := Length(s);
  if i = 0 then
    Result := #0
  else
  if pos(s[i], '���') <> 0 then
    Result := s[i-1]
  else
    Result := s[i];
end;

procedure Init;
begin
  _files := TStringList.Create;
  _data  := TStringList.Create; _data.Sorted := True;
  _game  := TStringList.Create;
  _gameS := TStringList.Create; _gameS.Sorted := True;
  _dbreload := True;
  Randomize;
end;

procedure Done;
begin
  _files.Destroy;
  _data.Destroy;
  _game.Destroy;
  _gameS.Destroy
end;

procedure LoadFileList(mask: string);
var sr_: TSearchRec;
begin
  _files.Clear;
  If FindFirst(mask, faAnyFile, sr_) = 0 then
    repeat
      _files.Add(sr_.Name);
    until FindNext(sr_) <> 0;
  FindClose(sr_);
end;

procedure LoadData(name: string);
var tmp: TStringList;
begin
  tmp := TStringList.Create;
  tmp.LoadFromFile(name);
  _data.AddStrings(tmp);
  tmp.Destroy;
end;

procedure RecalcInfo;
var i: integer;
begin
  FillChar(_chInfo, SizeOf(_chInfo), 0);
  for i:=0 to _data.Count-1 do
  begin
    with _chInfo[ord(_data[i][1])] do
    begin
      if count = 0 then
        start := i;
      inc(count);
    end;
  end;
end;


end.

