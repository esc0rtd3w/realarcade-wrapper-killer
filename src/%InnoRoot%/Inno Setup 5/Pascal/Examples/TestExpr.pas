program TestExpr;

// This example evaluates some expressions and displays the results

type
  UINT = Cardinal;
const
  SM_CXSCREEN = 0;

function GetSystemMetrics(nIndex: Integer): Integer; stdcall; external 'user32.dll';
procedure ipShowInteger(Fmt: PChar; Int: Integer); stdcall; external 'ipsupport.dll';
procedure ExitProcess(uExitCode: UINT); stdcall; external 'kernel32.dll';

var
  I, J, K: Integer;
begin
  I := 1 + 2 * 4;  // this expression will be evaluated entirely at compile time
  J := -I * 100;
  K := GetSystemMetrics(SM_CXSCREEN) div 2;

  ipShowInteger('I = %d', I);
  ipShowInteger('J = %d', J);
  ipShowInteger('Half the screen width is %d.', K);

  ExitProcess(0);
end.
