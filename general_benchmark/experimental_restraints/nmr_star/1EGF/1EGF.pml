# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 6.786487640015498

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 1+2+25+26+27+34+35+36+39+51
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1EGF and resi 7+45
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1EGF and resi 15 and name CA, 1EGF and resi 43 and name CA  # target=5.533144452470395 current=11.292546567867639
color yellow, pair_00
distance pair_01, 1EGF and resi 16 and name CA, 1EGF and resi 43 and name CA  # target=5.533144452470395 current=10.876684609204073
color yellow, pair_01
distance pair_02, 1EGF and resi 19 and name CA, 1EGF and resi 32 and name CA  # target=3.2686005254474764 current=8.590174841423398
color yellow, pair_02
distance pair_03, 1EGF and resi 17 and name CA, 1EGF and resi 34 and name CA  # target=6.114476574701069 current=10.78044494529884
color yellow, pair_03
distance pair_04, 1EGF and resi 16 and name CA, 1EGF and resi 37 and name CA  # target=6.845537590407531 current=11.471216802014997
color yellow, pair_04
distance pair_05, 1EGF and resi 16 and name CA, 1EGF and resi 42 and name CA  # target=6.114476574701069 current=10.481162544680902
color yellow, pair_05
distance pair_06, 1EGF and resi 20 and name CA, 1EGF and resi 31 and name CA  # target=3.523882894165543 current=6.9098524416213145
color yellow, pair_06
distance pair_07, 1EGF and resi 15 and name CA, 1EGF and resi 42 and name CA  # target=7.58155325793762 current=10.788489047194515
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
