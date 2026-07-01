# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.1299648953014176

load 2ACY.pdb, 2ACY
bg_color white
hide everything, 2ACY
show cartoon, 2ACY
color grey80, 2ACY
set cartoon_transparency, 0.1

select worst_residues, 2ACY and resi 1+2+3+4+5+15+43+71+73+87
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 2ACY and resi 3+5
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 2ACY and resi 71 and name CA, 2ACY and resi 86 and name CA  # target=27.499999982348104 current=36.243070392840856
color yellow, pair_00
distance pair_01, 2ACY and resi 15 and name CA, 2ACY and resi 86 and name CA  # target=27.499999850126883 current=34.92108345121049
color yellow, pair_01
distance pair_02, 2ACY and resi 2 and name CA, 2ACY and resi 42 and name CA  # target=27.499999859630087 current=34.918186676235926
color yellow, pair_02
distance pair_03, 2ACY and resi 71 and name CA, 2ACY and resi 87 and name CA  # target=27.499999738260954 current=34.69456359078794
color yellow, pair_03
distance pair_04, 2ACY and resi 4 and name CA, 2ACY and resi 18 and name CA  # target=27.499999638980565 current=34.45565963954142
color yellow, pair_04
distance pair_05, 2ACY and resi 72 and name CA, 2ACY and resi 86 and name CA  # target=27.49999872951223 current=33.811232016686176
color yellow, pair_05
distance pair_06, 2ACY and resi 15 and name CA, 2ACY and resi 87 and name CA  # target=27.499998704891166 current=33.70294756017275
color yellow, pair_06
distance pair_07, 2ACY and resi 18 and name CA, 2ACY and resi 87 and name CA  # target=27.499998188980186 current=33.560356691968344
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
