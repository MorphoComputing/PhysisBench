# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.4622090539821762

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 6+11+12+25+26+27+35+37+43+50
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)

distance pair_00, 1EGF and resi 9 and name CA, 1EGF and resi 51 and name CA  # target=27.489564208558058 current=28.99247175058547
color yellow, pair_00
distance pair_01, 1EGF and resi 8 and name CA, 1EGF and resi 50 and name CA  # target=27.483622463468148 current=28.97369436651056
color yellow, pair_01
distance pair_02, 1EGF and resi 36 and name CA, 1EGF and resi 44 and name CA  # target=4.057068174001599 current=3.071763855044265
color yellow, pair_02
distance pair_03, 1EGF and resi 11 and name CA, 1EGF and resi 43 and name CA  # target=15.326863906158325 current=16.21002384194753
color yellow, pair_03
distance pair_04, 1EGF and resi 25 and name CA, 1EGF and resi 36 and name CA  # target=22.748314630604447 current=23.605443201653035
color yellow, pair_04
distance pair_05, 1EGF and resi 23 and name CA, 1EGF and resi 50 and name CA  # target=20.441688171005648 current=21.246920701352984
color yellow, pair_05
distance pair_06, 1EGF and resi 27 and name CA, 1EGF and resi 48 and name CA  # target=23.26670837133582 current=24.04455055638057
color yellow, pair_06
distance pair_07, 1EGF and resi 24 and name CA, 1EGF and resi 46 and name CA  # target=24.62798368312972 current=25.345523425190198
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
