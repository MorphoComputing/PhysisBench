# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.2711005980053394

load 1MSI.pdb, 1MSI
bg_color white
hide everything, 1MSI
show cartoon, 1MSI
color grey80, 1MSI
set cartoon_transparency, 0.1

select worst_residues, 1MSI and resi 1+2+13+14+15+16+18+24+60+61
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1MSI and resi 45 and name CA, 1MSI and resi 61 and name CA  # target=6.884688864133953 current=5.924155774726561
color yellow, pair_00
distance pair_01, 1MSI and resi 26 and name CA, 1MSI and resi 61 and name CA  # target=22.058587947449546 current=22.998348579627862
color yellow, pair_01
distance pair_02, 1MSI and resi 44 and name CA, 1MSI and resi 61 and name CA  # target=6.812757356265263 current=5.911897894920751
color yellow, pair_02
distance pair_03, 1MSI and resi 46 and name CA, 1MSI and resi 61 and name CA  # target=7.034254564767779 current=6.205223843018438
color yellow, pair_03
distance pair_04, 1MSI and resi 2 and name CA, 1MSI and resi 61 and name CA  # target=21.71827032625278 current=22.513174573506355
color yellow, pair_04
distance pair_05, 1MSI and resi 25 and name CA, 1MSI and resi 61 and name CA  # target=20.9099380227876 current=21.693439666251702
color yellow, pair_05
distance pair_06, 1MSI and resi 9 and name CA, 1MSI and resi 64 and name CA  # target=22.53850817884152 current=23.3062289667944
color yellow, pair_06
distance pair_07, 1MSI and resi 2 and name CA, 1MSI and resi 14 and name CA  # target=26.421714076038285 current=27.16948975096834
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
