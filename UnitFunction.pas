{*
  MIT License
  Copyright (c) 2024 TextInjectToWindows contributors

  Permission is hereby granted, free of charge, to any person obtaining a copy
  of this software and associated documentation files (the "Software"), to deal
  in the Software without restriction, including without limitation the rights
  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
  copies of the Software, and to permit persons to whom the Software is
  furnished to do so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in all
  copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
  SOFTWARE.

  DISCLAIMER: This software is provided for informational and experimental
  purposes only. Use it at your own risk and ensure compliance with applicable
  laws and policies.
*}

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

function FindWindowByTitlePart(const ATitlePart: string): HWND; // ïîèñê ïåðâîãî âèäèìîãî îêíà, â çàãîëîâêå êîòîðîãî åñòü ATitlePart
function ActivateWindowByTitlePart(const ATitlePart: string): Boolean; // íàéòè è ñäåëàòü îêíî àêòèâíûì
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

  // Òîëüêî âèäèìûå âåðõíåóðîâíåâûå îêíà
  Style := GetWindowLong(hWnd, GWL_STYLE);
  if (Style and WS_VISIBLE) = 0 then
    Exit;

  // Çàãîëîâîê åñòü?
  Len := GetWindowTextLength(hWnd);
  if Len = 0 then
    Exit;

  SetLength(Title, Len);
  GetWindowText(hWnd, PChar(Title), Len + 1);
  Title := Trim(Title);
  if Title = '' then
    Exit;

  // if ContainsText(Title, 'Program Manager') then Exit; // Ìîæíî ïî æåëàíèþ îòôèëüòðîâàòü êàêèå-òî ñëóæåáíûå îêíà

  Combo := TComboBox(lParam);
  Combo.Items.AddObject(Title, TObject(hWnd)); // çàãîëîâîê òåêñòîì, HWND â Objects (ìîæíî ýòîãî íå äåëàòü èëè ïåðåïèñàòü ô-öèþ ïîèñêà îêíà îò HWND
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
  Result := True; // ïðîäîëæàòü ïåðå÷èñëåíèå ïî óìîë÷àíèþ

  Data := PFindWindowData(lParam);

  Style := GetWindowLong(hWnd, GWL_STYLE);  // Òîëüêî âèäèìûå îêíà (åñëè íàäî ñêðûòûå — óáåðàòü ýòó ïðîâåðêó)
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

  if ContainsText(Title, Data^.Pattern) then   //  áåç ó÷¸òà ðåãèñòðà
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

  // Âðåìåííî óñòàíàâëèâàåì ñèñòåìíûé êóðñîð â "îæèäàíèå"
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
  // íà÷àëüíîå ñîñòîÿíèå êíîïêè
  WasDown := (GetAsyncKeyState(VK_LBUTTON) and $8000) <> 0;

  while True do
  begin
    IsDown := (GetAsyncKeyState(VK_LBUTTON) and $8000) <> 0;

    // ïîéìàëè ìîìåíò "áûëà îòïóùåíà -> ñòàëà íàæàòà"
    if IsDown and (not WasDown) then
    begin
      GetCursorPos(P);  // êîîðäèíàòû âî ÂÑÅÌ ýêðàíå
      X := P.X;
      Y := P.Y;
      Exit;
    end;

    WasDown := IsDown;

    Sleep(10);                // ÷òîáû íå ãðóçèòü CPU
    Application.ProcessMessages; // íå âåøàåì ôîðìó
  end;
end;

function GetClientRectOnScreen(hWnd: HWND; out R: TRect): Boolean;
var
  Client: TRect;
  TopLeft: TPoint;
begin
  Result := False;
  if not GetClientRect(hWnd, Client) then Exit;

  // ëåâûé âåðõíèé óãîë êëèåíòñêîé îáëàñòè â êîîðäèíàòàõ ýêðàíà
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
