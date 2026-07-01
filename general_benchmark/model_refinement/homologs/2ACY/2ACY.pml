# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 1.6941251986504624

load 2ACY.pdb, 2ACY
bg_color white
hide everything, 2ACY
show cartoon, 2ACY
color grey80, 2ACY
set cartoon_transparency, 0.1

select worst_residues, 2ACY and resi 1+2+3+17+18+19+20+43+70+86
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2ACY and resi 89
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2ACY and resi 1 and name CA, 2ACY and resi 42 and name CA  # target=27.499913946468844 current=37.10832513588305
color yellow, pair_00
distance pair_01, 2ACY and resi 2 and name CA, 2ACY and resi 18 and name CA  # target=27.4996286965646 current=36.479538220011115
color yellow, pair_01
distance pair_02, 2ACY and resi 1 and name CA, 2ACY and resi 18 and name CA  # target=27.499925754520138 current=36.44887485651104
color yellow, pair_02
distance pair_03, 2ACY and resi 2 and name CA, 2ACY and resi 42 and name CA  # target=27.499316235704676 current=35.940448063559664
color yellow, pair_03
distance pair_04, 2ACY and resi 1 and name CA, 2ACY and resi 44 and name CA  # target=27.49981308314017 current=35.17713930715345
color yellow, pair_04
distance pair_05, 2ACY and resi 70 and name CA, 2ACY and resi 86 and name CA  # target=27.32220869881535 current=34.83651902347924
color yellow, pair_05
distance pair_06, 2ACY and resi 2 and name CA, 2ACY and resi 19 and name CA  # target=27.49831452766667 current=34.92137730757284
color yellow, pair_06
distance pair_07, 2ACY and resi 2 and name CA, 2ACY and resi 44 and name CA  # target=27.49873732335629 current=34.680462117624124
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
