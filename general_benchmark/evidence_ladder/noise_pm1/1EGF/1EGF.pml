# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.59626237914157

load 1EGF.pdb, 1EGF
bg_color white
hide everything, 1EGF
show cartoon, 1EGF
color grey80, 1EGF
set cartoon_transparency, 0.1

select worst_residues, 1EGF and resi 2+9+24+25+31+34+43+46+47+49
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1EGF and resi 9+10+16
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1EGF and resi 8 and name CA, 1EGF and resi 51 and name CA  # target=27.409132306394902 current=31.109313843326643
color yellow, pair_00
distance pair_01, 1EGF and resi 21 and name CA, 1EGF and resi 41 and name CA  # target=11.743542961119779 current=14.830446698103861
color yellow, pair_01
distance pair_02, 1EGF and resi 7 and name CA, 1EGF and resi 51 and name CA  # target=27.231738409737787 current=30.214701743158784
color yellow, pair_02
distance pair_03, 1EGF and resi 13 and name CA, 1EGF and resi 30 and name CA  # target=8.291881763254594 current=5.439021704534793
color yellow, pair_03
distance pair_04, 1EGF and resi 35 and name CA, 1EGF and resi 51 and name CA  # target=19.423750471003476 current=16.59884193146064
color yellow, pair_04
distance pair_05, 1EGF and resi 14 and name CA, 1EGF and resi 45 and name CA  # target=10.885645607190204 current=13.687964915530173
color yellow, pair_05
distance pair_06, 1EGF and resi 8 and name CA, 1EGF and resi 48 and name CA  # target=27.392873719660194 current=30.160475200362757
color yellow, pair_06
distance pair_07, 1EGF and resi 14 and name CA, 1EGF and resi 51 and name CA  # target=19.77943548746906 current=22.51586690828271
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
