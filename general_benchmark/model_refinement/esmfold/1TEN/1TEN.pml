# Physis Fold — conflict visualization (PyMOL)
# verdict: PASS_WITH_WARNINGS | CA RMSD: 0.5679775000510785

load 1TEN.pdb, 1TEN
bg_color white
hide everything, 1TEN
show cartoon, 1TEN
color grey80, 1TEN
set cartoon_transparency, 0.1

select worst_residues, 1TEN and resi 1+5+6+23+39+40+41+60+77+84
show sticks, worst_residues
color red, worst_residues
label worst_residues and name CA, "%s%s" % (one_letter[resn], resi)
select conflict_roots, 1TEN and resi 8+48+64+77
show sticks, conflict_roots
color orange, conflict_roots

distance pair_00, 1TEN and resi 64 and name CA, 1TEN and resi 76 and name CA  # target=27.49871394562363 current=37.461587792789295
color yellow, pair_00
distance pair_01, 1TEN and resi 27 and name CA, 1TEN and resi 64 and name CA  # target=27.498194326776098 current=37.1990886290605
color yellow, pair_01
distance pair_02, 1TEN and resi 64 and name CA, 1TEN and resi 77 and name CA  # target=27.49805024085472 current=36.854282903311024
color yellow, pair_02
distance pair_03, 1TEN and resi 27 and name CA, 1TEN and resi 63 and name CA  # target=27.497728900104114 current=36.84162605347986
color yellow, pair_03
distance pair_04, 1TEN and resi 63 and name CA, 1TEN and resi 76 and name CA  # target=27.49808629282616 current=36.77112829731837
color yellow, pair_04
distance pair_05, 1TEN and resi 26 and name CA, 1TEN and resi 63 and name CA  # target=27.497474384248104 current=36.69798299545825
color yellow, pair_05
distance pair_06, 1TEN and resi 26 and name CA, 1TEN and resi 64 and name CA  # target=27.49745392202472 current=36.671844559311396
color yellow, pair_06
distance pair_07, 1TEN and resi 63 and name CA, 1TEN and resi 77 and name CA  # target=27.497446909359084 current=36.34451767198364
color yellow, pair_07

set dash_width, 3
set label_size, 14
set label_color, black
orient
zoom
# end
