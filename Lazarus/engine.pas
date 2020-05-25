unit engine;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, ComCtrls, RegExpr;

type
  TCharSrchInfo = record
    start, count: integer;
  end;

var
  _files: TStringList; // Список найденых файлов-словарей
  _data: TStringList;  // Словарь
  _game: TStringList;  // Текущая игра
  _gameS: TStringList; // Сортированный список для поиска
  _show: boolean;      // Показываем ли мы словарь?
  _chInfo: array [128..191] of TCharSrchInfo;
  _dbreload: boolean;  // Пересчитать список файлов-словарей?

function isWord(s: string): boolean;
function LastLetter(s: string): char;

procedure Init;
procedure Done;
procedure LoadFileList(mask: string);
procedure LoadData(name: string);
procedure RecalcInfo;

implementation

function isWord(s: string): boolean;
begin
  with TRegExpr.Create do
    try
      Expression := '[а-я]+';
      Result := Exec(s);
    finally
      Free;
    end;
end;

function LastLetter(s: string): char;
var i: integer;
begin
  i := s.Length;
  if i = 0 then
    Result := #0
  else
  if pos(s[i], #138#139#140) <> 0 then
    Result := s[i-2]
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
var sr: TSearchRec;
begin
  _files.Clear;
  If FindFirst(mask, faAnyFile, sr) = 0 then
    repeat
      _files.Add(sr.Name);
    until FindNext(sr) <> 0;
  FindClose(sr);
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
  i := _data.Count;
  for i:=0 to _data.Count-1 do
    with _chInfo[ord(_data[i][2])] do
    begin
      if count = 0 then
        start := i;
      inc(count);
    end;
end;


end.

