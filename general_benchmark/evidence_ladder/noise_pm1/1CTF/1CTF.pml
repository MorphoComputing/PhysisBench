# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.514635153445837

load 1CTF.pdb, 1CTF
bg_color white
hide everything, 1CTF
show cartoon, 1CTF
color grey80, 1CTF
set cartoon_transparency, 0.1

select worst_residues, 1CTF and resi 1+4+9+13+23+27+28+40+55+56
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1CTF and resi 9+45
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1CTF and resi 13 and name CA, 1CTF and resi 65 and name CA  # target=16.398101706838084 current=19.995142059683932
color yellow, pair_00
distance pair_01, 1CTF and resi 6 and name CA, 1CTF and resi 54 and name CA  # target=14.698485282551434 current=11.453094212387551
color yellow, pair_01
distance pair_02, 1CTF and resi 15 and name CA, 1CTF and resi 26 and name CA  # target=16.6356665269155 current=13.461382643384006
color yellow, pair_02
distance pair_03, 1CTF and resi 34 and name CA, 1CTF and resi 45 and name CA  # target=21.748187814679618 current=18.6969063473263
color yellow, pair_03
distance pair_04, 1CTF and resi 17 and name CA, 1CTF and resi 55 and name CA  # target=12.228297181759148 current=15.103194217905314
color yellow, pair_04
distance pair_05, 1CTF and resi 3 and name CA, 1CTF and resi 17 and name CA  # target=13.84516278120217 current=16.695949969250172
color yellow, pair_05
distance pair_06, 1CTF and resi 7 and name CA, 1CTF and resi 27 and name CA  # target=14.6787177089659 current=17.47071164999208
color yellow, pair_06
distance pair_07, 1CTF and resi 37 and name CA, 1CTF and resi 46 and name CA  # target=19.4501711143273 current=22.18326767555884
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
