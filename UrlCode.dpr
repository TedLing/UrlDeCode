library UrlCode;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  httpapp;

{$R *.res}

 //urlencode
function   urlencode(data:PAnsichar):PAnsichar;stdcall;
var ls_in  :string;
begin
try
      //ls_in :=  string(data);
      Result := PansiChar(HttpEncode(AnsiToUtf8(data))) ;
except
   Result := PansiChar(AnsiString('º”√‹¥ÌŒÛ£°'));
end;

end;
exports urlencode;


 //urldecode
 function   urldecode(data:PAnsichar):PAnsichar;stdcall;
var ls_in  :string;
begin
try
      //ls_in :=  string(data);
      //Result := HttpEncode(AnsiToUtf8(ls_in)) ;
      Result := PansiChar(AnsiString(utf8toansi(Httpdecode(data))));
except
   Result := PansiChar(AnsiString('º”√‹¥ÌŒÛ£°'));
end;

end;
exports urldecode;



function AnsiToUnicode(Str: ansistring): string;
var
  s: ansistring;
  i:integer;
  j,k:string[2];
  a:array [1..1000] of  ansichar;
begin
  s:='';
  StringToWideChar(Str,@(a[1]),500);
  i:=1;
  while ((a[i]<>#0) or (a[i+1]<>#0)) do
  begin
    j:=IntToHex(Integer(a[i]),2);
    k:=IntToHex(Integer(a[i+1]),2);
    s:=s+'\u'+k+j;
    i:=i+2;
  end;
  Result:=s;
end;

//unencode   ansi ◊™¬Î unicode
function unencode(data:PAnsichar):PAnsichar;stdcall;
begin
      try
      Result := PansiChar(AnsiString(AnsiToUnicode(data)));
except
   Result := PansiChar(AnsiString('º”√‹¥ÌŒÛ£°'));
end;
end;
exports unencode;




begin
end.
