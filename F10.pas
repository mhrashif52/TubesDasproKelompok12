unit F10;

interface

uses Record_Perpus, F13;

const
    NMax = 10000;




procedure TambahJumlahBuku(arrDataBuku : array of DataBuku);


implementation

procedure TambahJumlahBuku(arrDataBuku : array of DataBuku);
var
    idBuku : string;
    jumlahBukuBaru : string;
    jumlahBukuLama : string;
    jumlahTotal : string;
    satuan : char;
    puluhan : char;
    ratusan : char;
    i : integer;

begin
    write('Masukkan ID Buku : ');
    readln(idBuku);
    write('Masukkan jumlah buku yang ditambahkan: ');
    readln(jumlahBukuBaru);
    for i:=1 to LoadNeffData.Buku do
    begin
        if (idBuku = arrDataBuku[i].idBuku) then
        begin
            jumlahBukuLama := arrDataBuku[i].jumlah;
            if ((integer(jumlahBukuLama[1]) >= 48) and (integer(jumlahBukuLama[1]) <= 57 ) and (integer(jumlahBukuLama[2]) >= 48) and (integer(jumlahBukuLama[2]) <= 57 )) then
            begin
                if ((integer(jumlahBukuBaru[1]) >= 48) and (integer(jumlahBukuBaru[1]) <= 57 ) and (integer(jumlahBukuBaru[2]) >= 48) and (integer(jumlahBukuBaru[2]) <= 57 )) then
                begin
                    puluhan := char( integer(jumlahBukuBaru[1]) + integer(jumlahBukuLama[1]) - 48 );
                    satuan := char ( integer(jumlahBukuBaru[2]) + integer(jumlahBukuLama[2])  - 48 );

                    if ( integer(satuan) > 57) then
                    begin
                        puluhan := char ( integer(puluhan) + 1);
                        satuan := char ( integer(satuan) - 10);
                    end;

                    if ( integer(puluhan) > 57 ) then
                    begin
                        ratusan := '1';
                        puluhan := char( integer(puluhan) - 10);
                        jumlahTotal := ratusan + puluhan + satuan;
                    end else
                    begin
                        jumlahTotal := puluhan + satuan;
                    end;
                    
                end else // Jika Buku Baru ada puluhan dan Buku Lama hanya satuan
                begin
                    puluhan := jumlahBukuBaru[1];
                    satuan := char( integer(jumlahBukuBaru[2]) + integer(jumlahBukuLama[2]) - 48 );

                    if ( integer(puluhan) > 57) then
                    begin
                        ratusan := '1';
                        puluhan := char ( integer(puluhan) - 10 );
                        jumlahTotal := ratusan + puluhan + satuan;
                    end else
                    begin
                        jumlahTotal := puluhan + satuan;
                    end;

                end;

            arrDataBuku[i].jumlah := jumlahTotal;

            end else if ((integer(jumlahBukuLama[1]) >= 48) and (integer(jumlahBukuLama[1]) <= 57 ) and (integer(jumlahBukuLama[2]) >= 48) and (integer(jumlahBukuLama[2]) <= 57 )) then // Buku Lama 2 digit
            begin

                if ((integer(jumlahBukuBaru[1]) >= 48) and (integer(jumlahBukuBaru[1]) <= 57 ) and (integer(jumlahBukuBaru[2]) >= 48) and (integer(jumlahBukuBaru[2]) <= 57 )) then
                begin
                    puluhan := char( integer(jumlahBukuBaru[1]) + integer(jumlahBukuLama[1]) - 48 );
                    satuan := char ( integer(jumlahBukuBaru[2]) + integer(jumlahBukuLama[2])  - 48 );

                    if ( integer(satuan) > 57) then
                    begin
                        puluhan := char ( integer(puluhan) + 1);
                        satuan := char ( integer(satuan) - 10);
                    end;

                    if ( integer(puluhan) > 57 ) then
                    begin
                        ratusan := '1';
                        puluhan := char( integer(puluhan) - 10);
                        jumlahTotal := ratusan + puluhan + satuan;
                    end else
                    begin
                        jumlahTotal := puluhan + satuan;
                    end;
                    
                end else // Jika Buku Lama ada puluhan dan Buku Baru hanya satuan
                begin
                    puluhan := jumlahBukuLama[1];
                    satuan := char( integer(jumlahBukuBaru[2]) + integer(jumlahBukuLama[2]) - 48 );

                    if ( integer(satuan) > 57 ) then
                    begin
                        satuan := char( integer(satuan) - 10);
                        puluhan := char( integer(puluhan) + 1 );
                    end;

                    if ( integer(puluhan) > 57) then
                    begin
                        ratusan := '1';
                        puluhan := char ( integer(puluhan) - 10 );
                        jumlahTotal := ratusan + puluhan + satuan;
                    end else
                    begin
                        jumlahTotal := puluhan + satuan;
                    end;
                

                end;

            arrDataBuku[i].jumlah := jumlahTotal;

            end else
            begin
                satuan := char( integer(jumlahBukuBaru[1]) + integer(jumlahBukuLama[1]) - 48 );
                if ( integer(satuan) > 57 ) then
                begin
                    puluhan := '1';
                    satuan := char ( integer(satuan) - 10 );

                end;

                 jumlahTotal := puluhan + satuan;
                arrDataBuku[i].jumlah := jumlahTotal;
            end;       

        writeln('Pembaharuan jumlah buku berhasil dilakukan, total buku ', arrDataBuku[i].judul, ' di perpustakaan menjadi ', arrDataBuku[i].jumlah);


        end; // End of if IdInput = IdBuku

    end; // End of Looping



end; // End of Procedure TambahBuku

end.
