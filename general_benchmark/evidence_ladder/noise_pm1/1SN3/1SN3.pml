# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.47085366197675993

load 1SN3.pdb, 1SN3
bg_color white
hide everything, 1SN3
show cartoon, 1SN3
color grey80, 1SN3
set cartoon_transparency, 0.1

select worst_residues, 1SN3 and resi 5+12+15+19+21+34+36+61+62+63
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1SN3 and resi 3+18+46
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1SN3 and resi 1 and name CA, 1SN3 and resi 45 and name CA  # target=14.39445414406309 current=10.981870542625431
color yellow, pair_00
distance pair_01, 1SN3 and resi 16 and name CA, 1SN3 and resi 45 and name CA  # target=12.770004894035992 current=9.46988654583856
color yellow, pair_01
distance pair_02, 1SN3 and resi 12 and name CA, 1SN3 and resi 21 and name CA  # target=17.843967012023853 current=14.842672680039614
color yellow, pair_02
distance pair_03, 1SN3 and resi 2 and name CA, 1SN3 and resi 44 and name CA  # target=12.483636523157298 current=9.601317445408197
color yellow, pair_03
distance pair_04, 1SN3 and resi 16 and name CA, 1SN3 and resi 44 and name CA  # target=10.678421969380356 current=7.902798180379757
color yellow, pair_04
distance pair_05, 1SN3 and resi 13 and name CA, 1SN3 and resi 30 and name CA  # target=11.657137791130724 current=14.395514684954483
color yellow, pair_05
distance pair_06, 1SN3 and resi 18 and name CA, 1SN3 and resi 26 and name CA  # target=12.275826798493148 current=14.913378083784679
color yellow, pair_06
distance pair_07, 1SN3 and resi 26 and name CA, 1SN3 and resi 60 and name CA  # target=21.781831954017935 current=24.386032207043417
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
