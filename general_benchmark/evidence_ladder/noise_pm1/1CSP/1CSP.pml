# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5060844703771925

load 1CSP.pdb, 1CSP
bg_color white
hide everything, 1CSP
show cartoon, 1CSP
color grey80, 1CSP
set cartoon_transparency, 0.1

select worst_residues, 1CSP and resi 3+5+12+20+36+46+53+57+58+64
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CSP and resi 6+12
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CSP and resi 35 and name CA, 1CSP and resi 61 and name CA  # target=15.662191620140167 current=12.163295997773407
color yellow, pair_00
distance pair_01, 1CSP and resi 21 and name CA, 1CSP and resi 36 and name CA  # target=27.415779305707954 current=30.806458688244632
color yellow, pair_01
distance pair_02, 1CSP and resi 26 and name CA, 1CSP and resi 58 and name CA  # target=7.316352449079869 current=3.9423582342461128
color yellow, pair_02
distance pair_03, 1CSP and resi 50 and name CA, 1CSP and resi 59 and name CA  # target=7.028033835875499 current=3.8964047908633246
color yellow, pair_03
distance pair_04, 1CSP and resi 51 and name CA, 1CSP and resi 63 and name CA  # target=11.859563537162098 current=14.79655236569107
color yellow, pair_04
distance pair_05, 1CSP and resi 12 and name CA, 1CSP and resi 53 and name CA  # target=24.15231104666678 current=21.260977863877457
color yellow, pair_05
distance pair_06, 1CSP and resi 47 and name CA, 1CSP and resi 59 and name CA  # target=12.72560392413876 current=9.855009929843092
color yellow, pair_06
distance pair_07, 1CSP and resi 42 and name CA, 1CSP and resi 64 and name CA  # target=14.189633702961245 current=11.390786957393132
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
