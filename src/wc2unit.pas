unit wc2Unit;

{$MODE Delphi}

interface

type
  { Common data types}
  AStatus = array[0..7] of byte;

  TUnitRec = record
    bResrv00: byte;                     // 00
    bResrv01: byte;                     // 01
    bResrv02: byte;                     // 02
    bResrv03: byte;                     // 03
    bResrv04: byte;                     // 04
    bResrv05: byte;                     // 05
    bResrv06: byte;                     // 06
    bResrv07: byte;                     // 07
    bResrv08: byte;                     // 08
    bResrv09: byte;                     // 09
    bResrv10: byte;                     // 10
    bResrv11: byte;                     // 11
    bResrv12: byte;                     // 12
    bResrv13: byte;                     // 13
    bResrv14: byte;                     // 14
    bResrv15: byte;                     // 15
    bResrv16: byte;                     // 16
    bResrv17: byte;                     // 17
    bResrv18: byte;                     // 18
    bResrv19: byte;                     // 19
    bResrv20: byte;                     // 20
    bResrv21: byte;                     // 21
    bResrv22: byte;                     // 22
    bResrv23: byte;                     // 23
    bResrv24: byte;                     // 24
    bResrv25: byte;                     // 25
    bResrv26: byte;                     // 26
    bResrv27: byte;                     // 27
    bResrv28: byte;                     // 28
    bResrv29: byte;                     // 29
    wEnergy: word;                      // 30
    bResrv30: byte;                     // 32
    bType: byte;                        // 33
    bMana: byte;                        // 34
    bBitmap: byte;                      // 35
    bResrv31: byte;                     // 36
    bResrv32: byte;                     // 37
    bResrv33: byte;                     // 38
    bMenu: byte;                        // 39
    bSide: byte;                        // 40
    bColor: byte;                       // 41
    bResrv34: byte;                     // 42
    bResrv35: byte;                     // 43
    bResrv36: byte;                     // 44
    bResrv37: byte;                     // 45
    bResrv38: byte;                     // 46
    bResrv39: byte;                     // 47
    bResrv40: byte;                     // 48
    bResrv41: byte;                     // 49
    bResrv42: byte;                     // 50
    bResrv43: byte;                     // 51
    bResrv44: byte;                     // 52
    bResrv45: byte;                     // 53
    bResrv46: byte;                     // 54
    bResrv47: byte;                     // 55
    bResrv48: byte;                     // 56
    bResrv49: byte;                     // 57
    bResrv50: byte;                     // 58
    bResrv51: byte;                     // 59
    bResrv52: byte;                     // 60
    bResrv53: byte;                     // 61
    bResrv54: byte;                     // 62
    bResrv55: byte;                     // 63
    bResrv56: byte;                     // 64
    bResrv57: byte;                     // 65
    bResrv58: byte;                     // 66
    bResrv59: byte;                     // 67
    bResrv60: byte;                     // 68
    bResrv61: byte;                     // 69
    bResrv62: byte;                     // 70
    bResrv63: byte;                     // 71
    bResrv64: byte;                     // 72
    bResrv65: byte;                     // 73
    bResrv66: byte;                     // 74
    bResrv67: byte;                     // 75
    bResrv68: byte;                     // 76
    bResrv69: byte;                     // 77
    bResrv70: byte;                     // 78
    bResrv71: byte;                     // 79
    bResrv72: byte;                     // 80
    bResrv73: byte;                     // 81
    bResrv74: byte;                     // 82
    bResrv75: byte;                     // 83
    bResrv76: byte;                     // 84
    bResrv77: byte;                     // 85
    bResrv78: byte;                     // 86
    bResrv79: byte;                     // 87
    bResrv80: byte;                     // 88
    bResrv81: byte;                     // 89
    bResrv82: byte;                     // 90
    bResrv83: byte;                     // 91
    bResrv84: byte;                     // 92
    bResrv85: byte;                     // 93
    bResrv86: byte;                     // 94
    bResrv87: byte;                     // 95
    bResrv88: byte;                     // 96
    bResrv89: byte;                     // 97
    bResrv90: byte;                     // 98
    bResrv91: byte;                     // 99
    bResrv92: byte;                     // 100
    bResrv93: byte;                     // 101
    bResrv94: byte;                     // 102
    bResrv95: byte;                     // 103
    bResrv96: byte;                     // 104
    bResrv97: byte;                     // 105
    bResrv98: byte;                     // 106
    bResrv99: byte;                     // 107
    bResrv100: byte;                    // 108
    bResrv101: byte;                    // 109
    bResrv102: byte;                    // 110
    bResrv103: byte;                    // 111
    bResrv104: byte;                    // 112
    bResrv105: byte;                    // 113
    bResrv106: byte;                    // 114
    bResrv107: byte;                    // 115
    bResrv108: byte;                    // 116
    bResrv109: byte;                    // 117
    bResrv110: byte;                    // 118
    bResrv111: byte;                    // 119
    bResrv112: byte;                    // 120
    bResrv113: byte;                    // 121
    bResrv114: byte;                    // 122
    bResrv115: byte;                    // 123
    bResrv116: byte;                    // 124
    bResrv117: byte;                    // 125
    wResource: word;                    // 126
    bResrv118: byte;                    // 127
    bResrv119: byte;                    // 128
    bResrv120: byte;                    // 129
    bResrv121: byte;                    // 130
    iOffset: longint;                   // Offset of unit in file
  end;
  PUnitRec = ^TUnitRec;

  TResRec = record
    lLumber: longint;
    lGold: longint;
    lOil: longint;
    iOffset: longint;                    // Offset of Lumber resource
  end;
  PResRec = ^TResRec;

const
  stHuman = $00;
  stComputer = $01;
  stPrisoner = $02;
  stNone = $03;

implementation

{End of file}
end.
