# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.08893680064356921

load 1TEN.pdb, 1TEN
bg_color white
hide everything, 1TEN
show cartoon, 1TEN
color grey80, 1TEN
set cartoon_transparency, 0.1

select worst_residues, 1TEN and resi 39+40+41+42+62+63+75+76+77+78
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TEN and resi 21+64+71+78
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TEN and resi 64 and name CA, 1TEN and resi 77 and name CA  # target=27.49999999877349 current=37.653174452426676
color yellow, pair_00
distance pair_01, 1TEN and resi 64 and name CA, 1TEN and resi 76 and name CA  # target=27.499999998371205 current=37.445368746046455
color yellow, pair_01
distance pair_02, 1TEN and resi 27 and name CA, 1TEN and resi 64 and name CA  # target=27.49999999740103 current=37.309918010195865
color yellow, pair_02
distance pair_03, 1TEN and resi 14 and name CA, 1TEN and resi 77 and name CA  # target=27.49999999763107 current=37.26411404367087
color yellow, pair_03
distance pair_04, 1TEN and resi 63 and name CA, 1TEN and resi 77 and name CA  # target=27.499999996994788 current=37.09236565043761
color yellow, pair_04
distance pair_05, 1TEN and resi 27 and name CA, 1TEN and resi 63 and name CA  # target=27.49999999381916 current=36.78067945737439
color yellow, pair_05
distance pair_06, 1TEN and resi 26 and name CA, 1TEN and resi 64 and name CA  # target=27.499999992903216 current=36.75413554387188
color yellow, pair_06
distance pair_07, 1TEN and resi 63 and name CA, 1TEN and resi 76 and name CA  # target=27.499999993817188 current=36.64174221783971
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
