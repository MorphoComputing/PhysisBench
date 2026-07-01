# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 3.2754187889311286

load 1HPH.pdb, 1HPH
bg_color white
hide everything, 1HPH
show cartoon, 1HPH
color grey80, 1HPH
set cartoon_transparency, 0.1

select worst_residues, 1HPH and resi 1+2+3+6+7+9+12+25+27+30
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1HPH and resi 10+18+26+32+137
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1HPH and resi 6 and name CA, 1HPH and resi 14 and name CA  # target=18.833132934314403 current=10.227163421484047
color yellow, pair_00
distance pair_01, 1HPH and resi 14 and name CA, 1HPH and resi 26 and name CA  # target=20.32727084818434 current=12.235832909742314
color yellow, pair_01
distance pair_02, 1HPH and resi 9 and name CA, 1HPH and resi 18 and name CA  # target=18.52890119666162 current=11.175325156066494
color yellow, pair_02
distance pair_03, 1HPH and resi 1 and name CA, 1HPH and resi 12 and name CA  # target=20.854094304582542 current=13.721489786252103
color yellow, pair_03
distance pair_04, 1HPH and resi 1 and name CA, 1HPH and resi 10 and name CA  # target=16.299892660390476 current=9.34547024631934
color yellow, pair_04
distance pair_05, 1HPH and resi 17 and name CA, 1HPH and resi 26 and name CA  # target=20.217830547706868 current=13.554227479176218
color yellow, pair_05
distance pair_06, 1HPH and resi 6 and name CA, 1HPH and resi 29 and name CA  # target=13.447812545531459 current=20.10396560692703
color yellow, pair_06
distance pair_07, 1HPH and resi 21 and name CA, 1HPH and resi 35 and name CA  # target=21.675297054730798 current=15.13754887334446
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
