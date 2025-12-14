unit UnitFunction;

interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  //System.Variants,
  System.Classes,
  //Vcl.Graphics,

  Vcl.Controls,
  Vcl.Forms,
  //Vcl.Dialogs,
  System.StrUtils,
  UnitTypes,
  System.TypInfo,
  //DateUtils,
   Vcl.StdCtrls
  //, Vcl.ExtCtrls, Vcl.ComCtrls
  ;


procedure FillVisibleWindowsCombo(ACombo: TComboBox);
function EnumVisibleWindowsProc(hWnd: HWND; lParam: LPARAM): BOOL; stdcall;

function FindWindowByTitlePart(const ATitlePart: string): HWND; // поиск первого видимого окна, в заголовке которого есть ATitlePart
function ActivateWindowByTitlePart(const ATitlePart: string): Boolean; // найти и сделать окно активным
function ActivateWindowByHWIND(const H: HWND): Boolean;
function EnumFindWindowByTitleProc(hWnd: HWND; lParam: LPARAM): BOOL; stdcall;
procedure ProcessMemoWithCallback(Memo: TMemo; Callback: TCharCallback);
function WaitForMouseClick(var ClickPoint: TPoint; Timeout: Cardinal = 10000): TMouseButton;
procedure WaitForLeftClick(var X, Y: Integer);

implementation

function EnumVisibleWindowsProc(hWnd: HWND; lParam: LPARAM): BOOL; stdcall;
var
  Style: LongInt;
  Len: Integer;
  Title: string;
  Combo: TComboBox;
begin
  Result := True;

  // Только видимые верхнеуровневые окна
  Style := GetWindowLong(hWnd, GWL_STYLE);
  if (Style and WS_VISIBLE) = 0 then
    Exit;

  // Заголовок есть?
  Len := GetWindowTextLength(hWnd);
  if Len = 0 then
    Exit;

  SetLength(Title, Len);
  GetWindowText(hWnd, PChar(Title), Len + 1);
  Title := Trim(Title);
  if Title = '' then
    Exit;

  // if ContainsText(Title, 'Program Manager') then Exit; // Можно по желанию отфильтровать какие-то служебные окна

  Combo := TComboBox(lParam);
  Combo.Items.AddObject(Title, TObject(hWnd)); // заголовок текстом, HWND в Objects (можно этого не делать или переписать ф-цию поиска окна от HWND
end;

procedure FillVisibleWindowsCombo(ACombo: TComboBox);
begin
  if ACombo = nil then
    Exit;

  ACombo.Items.BeginUpdate;
  try
    ACombo.Items.Clear;
    EnumWindows(@EnumVisibleWindowsProc, LPARAM(ACombo));
  finally
    ACombo.Items.EndUpdate;
  end;
end;

function EnumFindWindowByTitleProc(hWnd: HWND; lParam: LPARAM): BOOL; stdcall;
var
  Style: LongInt;
  Len: Integer;
  Title: string;
  Data: PFindWindowData;
begin
  Result := True; // продолжать перечисление по умолчанию

  Data := PFindWindowData(lParam);

  Style := GetWindowLong(hWnd, GWL_STYLE);  // Только видимые окна (если надо скрытые — уберать эту проверку)
  if (Style and WS_VISIBLE) = 0 then
    Exit;

  Len := GetWindowTextLength(hWnd);
  if Len = 0 then
    Exit;

  SetLength(Title, Len);
  GetWindowText(hWnd, PChar(Title), Len + 1);
  Title := Trim(Title);
  if Title = '' then
    Exit;

  if ContainsText(Title, Data^.Pattern) then   //  без учёта регистра
  begin
    Data^.Result := hWnd;
    Result := False;
  end;
end;

function FindWindowByTitlePart(const ATitlePart: string): HWND;
var
  Data: TFindWindowData;
begin
  Data.Pattern := ATitlePart;
  Data.Result := 0;
  EnumWindows(@EnumFindWindowByTitleProc, LPARAM(@Data));
  Result := Data.Result;
end;

function ActivateWindowByTitlePart(const ATitlePart: string): Boolean;
var
  H: HWND;
begin
  Result := False;
  H := FindWindowByTitlePart(ATitlePart);
  if H = 0 then
    Exit;

  if IsIconic(H) then
    ShowWindow(H, SW_RESTORE)
  else
    ShowWindow(H, SW_SHOW);

  SetForegroundWindow(H);
  Result := True;
end;

function ActivateWindowByHWIND(const H: HWND): Boolean;

begin
  Result := False;

  if IsIconic(H) then
    ShowWindow(H, SW_RESTORE)
  else
    ShowWindow(H, SW_SHOW);

  SetForegroundWindow(H);
  Result := True;
end;

function WaitForMouseClick(var ClickPoint: TPoint; Timeout: Cardinal = 10000): TMouseButton;
var
  Msg: TMsg;
  StartTime: Cardinal;
  ScreenPos: TPoint;
begin
  Result := mbNone;
  ClickPoint := Point(-1, -1);
  StartTime := GetTickCount;

  // Временно устанавливаем системный курсор в "ожидание"
  Screen.Cursor := crHourGlass;
  try
    while (GetTickCount - StartTime) < Timeout do
    begin
      if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
      begin
        case Msg.message of
          WM_LBUTTONDOWN:
            begin
              GetCursorPos(ScreenPos);
              ClickPoint := ScreenPos;
              Result := mbLeft;
              Exit;
            end;
          WM_RBUTTONDOWN:
            begin
              GetCursorPos(ScreenPos);
              ClickPoint := ScreenPos;
              Result := mbRight;
              Exit;
            end;
        else
          TranslateMessage(Msg);
          DispatchMessage(Msg);
        end;
      end
      else
      begin
        Application.ProcessMessages;
        Sleep(10);
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure WaitForLeftClick(var X, Y: Integer);
var
  WasDown, IsDown: Boolean;
  P: TPoint;
begin
  // начальное состояние кнопки
  WasDown := (GetAsyncKeyState(VK_LBUTTON) and $8000) <> 0;

  while True do
  begin
    IsDown := (GetAsyncKeyState(VK_LBUTTON) and $8000) <> 0;

    // поймали момент "была отпущена -> стала нажата"
    if IsDown and (not WasDown) then
    begin
      GetCursorPos(P);  // координаты во ВСЕМ экране
      X := P.X;
      Y := P.Y;
      Exit;
    end;

    WasDown := IsDown;

    Sleep(10);                // чтобы не грузить CPU
    Application.ProcessMessages; // не вешаем форму
  end;
end;

function GetClientRectOnScreen(hWnd: HWND; out R: TRect): Boolean;
var
  Client: TRect;
  TopLeft: TPoint;
begin
  Result := False;
  if not GetClientRect(hWnd, Client) then Exit;

  // левый верхний угол клиентской области в координатах экрана
  TopLeft.X := Client.Left;
  TopLeft.Y := Client.Top;
  if not ClientToScreen(hWnd, TopLeft) then Exit;

  R.Left   := TopLeft.X;
  R.Top    := TopLeft.Y;
  R.Right  := TopLeft.X + (Client.Right - Client.Left);
  R.Bottom := TopLeft.Y + (Client.Bottom - Client.Top);

  Result := True;
end;

procedure ProcessMemoWithCallback(Memo: TMemo; Callback: TCharCallback);
var
  i: Integer;
  Text: string;
begin
  if not Assigned(Memo) or not Assigned(Callback) then
    Exit;

  Text := Memo.Text;

  for i := 1 to Length(Text) do
  begin
    Callback(Text[i]);
    sleep (30+round(random(RND_deviation+5)*10));
    application.ProcessMessages;
    if Stop then exit;
  end;
end;

end.
