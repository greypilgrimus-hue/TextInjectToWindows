unit UnitTypes;

interface
uses
  system.UITypes, Winapi.Windows;

const
  mbNone = TMouseButton(-1); // или просто Integer(-1)

type
  TCharCallback = procedure(Ch: Char) of object;

type
  PFindWindowData = ^TFindWindowData;
  TFindWindowData = record
    Pattern: string;
    Result: HWND;
  end;

var
  dtStart, dtEnd, TimePrevStart, TimePrevEnd:TDateTime;
  FPrgStopChangeDTP: Boolean; //програмный флаг для запрета изменений
  RND_deviation: integer;
  dt:TDateTime;
  Stop:boolean=false;

implementation

end.
