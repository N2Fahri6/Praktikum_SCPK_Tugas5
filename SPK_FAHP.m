namaPegawai = {'Ahmad' 'Dedi' 'Eggy' 'Galuh' 'Indra' 'Laras' 'Maudy' 'Ragil' 'Tengku' 'Zia'};
data = [ 83 76 80
         78 81 87
         69 66 71
         91 87 90
         76 95 85
         90 86 81
         89 83 77 
         78 80 83
         95 85 87
         79 79 92];
maksNilaiKeramahan = 100;
maksNilaiProfesionalitas = 100;
maksNilaiDisiplin = 100;

data(:,1) = data(:,1) / maksNilaiKeramahan;
data(:,2) = data(:,2) / maksNilaiProfesionalitas;
data(:,3) = data(:,3) / maksNilaiDisiplin;

relasiAntarKriteria = [ 1 2 2
                        0 1 4
                        0 0 1 ];
                    
TFN = {[-100/3 0 100/3]     [3/100 0 -3/100]
       [0 100/3 200/3]      [3/200 3/100 0 ]
       [100/3 200/3 300/3]  [3/300 3/200 3/100 ]
       [200/3 300/3 400/3]  [3/400 3/300 3/200 ]};
   
[RasioKonsistensi] = HitungKonsistensiAHP(relasiAntarKriteria)

if RasioKonsistensi < 0.10
    % Metode Fuzzy AHP
    [bobotAntarKriteria, relasiAntarKriteria] = FuzzyAHP(relasiAntarKriteria, TFN);
    % Hitung nilai skor akhir
    ahp = data * bobotAntarKriteria';
    disp('Hasil Perhitungan dengan metode Fuzzy AHP')
    disp('Nama Pegawai, Nilai , Rating Pegawai')
end
 
 for i = 1:size(ahp, 1)
        if ahp(i) < 0.7
            status = 'Pegawai Kurang baik';
        elseif ahp(i) < 0.8
            status = 'Pegawai Baik';
        elseif ahp(i) >= 0.85
            status = 'Pegawai Terbaik';
        end
            disp([char(namaPegawai(i)), blanks(13 -cellfun('length',namaPegawai(i))), ', ', ...
                num2str(ahp(i)), blanks(10 - length(num2str(ahp(i)))), ', ', ...
                char(status)])

end