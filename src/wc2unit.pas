unit wc2Unit;

{$MODE Delphi}

interface

type
{ Common data types}
AStatus = Array[0..7] of Byte;

TUnitRec = record
 bResrv00:   Byte;                     // 00
 bResrv01:   Byte;                     // 01
 bResrv02:   Byte;                     // 02
 bResrv03:   Byte;                     // 03
 bResrv04:   Byte;                     // 04
 bResrv05:   Byte;                     // 05
 bResrv06:   Byte;                     // 06
 bResrv07:   Byte;                     // 07
 bResrv08:   Byte;                     // 08
 bResrv09:   Byte;                     // 09
 bResrv10:   Byte;                     // 10
 bResrv11:   Byte;                     // 11
 bResrv12:   Byte;                     // 12
 bResrv13:   Byte;                     // 13
 bResrv14:   Byte;                     // 14
 bResrv15:   Byte;                     // 15
 bResrv16:   Byte;                     // 16
 bResrv17:   Byte;                     // 17
 bResrv18:   Byte;                     // 18
 bResrv19:   Byte;                     // 19
 bResrv20:   Byte;                     // 20
 bResrv21:   Byte;                     // 21
 bResrv22:   Byte;                     // 22
 bResrv23:   Byte;                     // 23
 bResrv24:   Byte;                     // 24
 bResrv25:   Byte;                     // 25
 bResrv26:   Byte;                     // 26
 bResrv27:   Byte;                     // 27
 bResrv28:   Byte;                     // 28
 bResrv29:   Byte;                     // 29
 wEnergy:    Word;                     // 30
 bResrv30:   Byte;                     // 32
 bType:      Byte;                     // 33
 bMana:      Byte;                     // 34
 bBitmap:    Byte;                     // 35
 bResrv31:   Byte;                     // 36
 bResrv32:   Byte;                     // 37
 bResrv33:   Byte;                     // 38
 bMenu:      Byte;                     // 39
 bSide:      Byte;                     // 40
 bColor:     Byte;                     // 41
 bResrv34:   Byte;                     // 42
 bResrv35:   Byte;                     // 43
 bResrv36:   Byte;                     // 44
 bResrv37:   Byte;                     // 45
 bResrv38:   Byte;                     // 46
 bResrv39:   Byte;                     // 47
 bResrv40:   Byte;                     // 48
 bResrv41:   Byte;                     // 49
 bResrv42:   Byte;                     // 50
 bResrv43:   Byte;                     // 51
 bResrv44:   Byte;                     // 52
 bResrv45:   Byte;                     // 53
 bResrv46:   Byte;                     // 54
 bResrv47:   Byte;                     // 55
 bResrv48:   Byte;                     // 56
 bResrv49:   Byte;                     // 57
 bResrv50:   Byte;                     // 58
 bResrv51:   Byte;                     // 59
 bResrv52:   Byte;                     // 60
 bResrv53:   Byte;                     // 61
 bResrv54:   Byte;                     // 62
 bResrv55:   Byte;                     // 63
 bResrv56:   Byte;                     // 64
 bResrv57:   Byte;                     // 65
 bResrv58:   Byte;                     // 66
 bResrv59:   Byte;                     // 67
 bResrv60:   Byte;                     // 68
 bResrv61:   Byte;                     // 69
 bResrv62:   Byte;                     // 70
 bResrv63:   Byte;                     // 71
 bResrv64:   Byte;                     // 72
 bResrv65:   Byte;                     // 73
 bResrv66:   Byte;                     // 74
 bResrv67:   Byte;                     // 75
 bResrv68:   Byte;                     // 76
 bResrv69:   Byte;                     // 77
 bResrv70:   Byte;                     // 78
 bResrv71:   Byte;                     // 79
 bResrv72:   Byte;                     // 80
 bResrv73:   Byte;                     // 81
 bResrv74:   Byte;                     // 82
 bResrv75:   Byte;                     // 83
 bResrv76:   Byte;                     // 84
 bResrv77:   Byte;                     // 85
 bResrv78:   Byte;                     // 86
 bResrv79:   Byte;                     // 87
 bResrv80:   Byte;                     // 88
 bResrv81:   Byte;                     // 89
 bResrv82:   Byte;                     // 90
 bResrv83:   Byte;                     // 91
 bResrv84:   Byte;                     // 92
 bResrv85:   Byte;                     // 93
 bResrv86:   Byte;                     // 94
 bResrv87:   Byte;                     // 95
 bResrv88:   Byte;                     // 96
 bResrv89:   Byte;                     // 97
 bResrv90:   Byte;                     // 98
 bResrv91:   Byte;                     // 99
 bResrv92:   Byte;                     // 100
 bResrv93:   Byte;                     // 101
 bResrv94:   Byte;                     // 102
 bResrv95:   Byte;                     // 103
 bResrv96:   Byte;                     // 104
 bResrv97:   Byte;                     // 105
 bResrv98:   Byte;                     // 106
 bResrv99:   Byte;                     // 107
 bResrv100:   Byte;                     // 108
 bResrv101:   Byte;                     // 109
 bResrv102:   Byte;                     // 110
 bResrv103:   Byte;                     // 111
 bResrv104:   Byte;                     // 112
 bResrv105:   Byte;                     // 113
 bResrv106:   Byte;                     // 114
 bResrv107:   Byte;                     // 115
 bResrv108:   Byte;                     // 116
 bResrv109:   Byte;                     // 117
 bResrv110:   Byte;                     // 118
 bResrv111:   Byte;                     // 119
 bResrv112:   Byte;                     // 120
 bResrv113:   Byte;                     // 121
 bResrv114:   Byte;                     // 122
 bResrv115:   Byte;                     // 123
 bResrv116:   Byte;                     // 124
 bResrv117:   Byte;                     // 125
 wResource:   Word;                     // 126
 bResrv118:   Byte;                     // 127
 bResrv119:   Byte;                     // 128
 bResrv120:   Byte;                     // 129
 bResrv121:   Byte;                     // 130
 iOffset:     LongInt;                  // Offset of unit in file
end;
PUnitRec = ^TUnitRec;

TResRec = record
 lLumber:     LongInt;
 lGold:       LongInt;
 lOil:        LongInt;
 iOffset:     LongInt;                  // Offset of Lumber resource
end;
PResRec = ^TResRec;

const
 stHuman    = $00;
 stComputer = $01;
 stPrisoner = $02;
 stNone     = $03;

implementation

{End of file}
end.
