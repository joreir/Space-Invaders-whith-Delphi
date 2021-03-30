
unit UCnave;

interface
Uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,JPEG,PNGImage, Vcl.StdCtrls;

Const
    Max = 8;
    new = 3;

Type
    Nave_ene = Class
      Private
             Nx,Ny:Integer;
             img :TBitmap;

      Public
             Constructor Create(s:string;N_x,N_y:integer);
             Function obtener_Nx:integer;
             Function obtener_Ny:integer;
             Function obtener_imagen:Tbitmap;
             Procedure mover_derecha;
             Procedure mover_Izquierda;
             Procedure mover_abajo;
             Procedure movimiento(k:integer);
             Procedure cambiar_pos(x,y:integer);

             //balas
             Procedure Disparos_balas(Bx,By:integer);


    End;

implementation

{ Nave_ene }

procedure Nave_ene.cambiar_pos(x, y: integer);
begin
Nx:=x;
Ny:=y;
end;

Constructor Nave_ene.Create(s:string;N_x,N_y:integer);
begin

  img := TBitmap.Create;
  img .LoadFromFile(s);
  img .Transparent:=True;
  img .TransparentColor:= img.Canvas.Pixels[1,1];
  img .TransparentMode:=tmAuto;

  Nx:=N_x;
  Ny:=N_y;

end;

procedure Nave_ene.Disparos_balas(Bx, By: integer);
begin
NX:=NX-10;
end;



procedure Nave_ene.mover_abajo;
begin
Ny:=Ny+45;
end;

procedure Nave_ene.mover_derecha;
begin
Nx:=Nx+5;
end;

procedure Nave_ene.mover_Izquierda;
begin
Nx:=Nx-20;
end;

procedure Nave_ene.movimiento(k: integer);
begin
Nx:=Nx+k;
end;

function Nave_ene.obtener_imagen: Tbitmap;
begin
Result:=img;
end;

Function Nave_ene.obtener_Nx:integer;
begin
 Result:=Nx;
end;

function Nave_ene.obtener_Ny: integer;
begin
 Result:=Ny;
end;

end.
